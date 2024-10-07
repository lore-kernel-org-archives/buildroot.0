Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26793CFB442
	for <buildroot@archiver.kernel.org>; Mon,  7 Oct 2024 06:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2BA880DE3;
	Mon,  7 Oct 2024 06:01:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aqG7TpJ8Z2rX; Mon,  7 Oct 2024 06:01:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0EAB80DE7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0EAB80DE7;
	Mon,  7 Oct 2024 06:01:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D8EC11BF4E4
 for <buildroot@lists.busybox.net>; Mon,  7 Oct 2024 06:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6EC8402AE
 for <buildroot@lists.busybox.net>; Mon,  7 Oct 2024 06:01:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W3AKt7O72AWK for <buildroot@lists.busybox.net>;
 Mon,  7 Oct 2024 06:01:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9111A402AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9111A402AD
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9111A402AD
 for <buildroot@buildroot.org>; Mon,  7 Oct 2024 06:00:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 58E5640003;
 Mon,  7 Oct 2024 06:00:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sxgnf-003mgY-1x;
 Mon, 07 Oct 2024 08:00:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
References: <20241006104434.1414754-1-ju.o@free.fr>
Date: Mon, 07 Oct 2024 08:00:55 +0200
In-Reply-To: <20241006104434.1414754-1-ju.o@free.fr> (Julien Olivain's message
 of "Sun, 6 Oct 2024 12:44:34 +0200")
Message-ID: <871q0slaeg.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 1/1] package/libopenmpt: bump to version
 0.7.10
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

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > For release note, see:
 > https://lib.openmpt.org/libopenmpt/2024/09/22/security-update-0.6.19-releases-0.7.10-0.5.33-0.4.45/

 > Note: even if the release annouce has "security update" in its title,
 > it is only applicable to the 0.6.x version series. This version 0.7.10
 > is NOT impacted by this security fix.

 > Signed-off-by: Julien Olivain <ju.o@free.fr>
 > ---
 > Change v1 -> v2:
 > - Removed "security" in the commit log title.
 >   As the rest of the commit log is stating, this bump is not
 >   a security bump.

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
