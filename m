Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B71C3DA4B
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 18:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 513B541103;
	Thu, 11 Jul 2024 18:44:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2h3Q8rzIGA_u; Thu, 11 Jul 2024 18:44:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C43C54110B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C43C54110B;
	Thu, 11 Jul 2024 18:44:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 80BBE1BF42E
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 18:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D334414B4
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 18:44:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id poL1Rq8NiyYP for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 18:44:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A6583413DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6583413DC
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A6583413DC
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 18:44:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 04E56240005;
 Thu, 11 Jul 2024 18:44:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sRylz-00CIsn-0d;
 Thu, 11 Jul 2024 20:44:07 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
References: <20240622084322.10480-1-bernd@kuhls.net>
 <87frsjkraz.fsf@dell.be.48ers.dk>
Date: Thu, 11 Jul 2024 20:44:07 +0200
In-Reply-To: <87frsjkraz.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Tue, 09 Jul 2024 08:33:40 +0200")
Message-ID: <87frsfhiq0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/ghostscript: security bump
 version to 10.03.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:
 >> Fixes CVE-2024-33869, CVE-2023-52722, CVE-2024-33870, CVE-2024-33871
 >> and CVE-2024-29510.

 >> Release notes:
 >> https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/tag/gs10031

 >> Remove patch which is included in this release.

 >> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

 > Committed, thanks.

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
