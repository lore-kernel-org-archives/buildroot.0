Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B7BC54E60
	for <buildroot@archiver.kernel.org>; Sat, 16 Mar 2024 22:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9ED54155D;
	Sat, 16 Mar 2024 22:28:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eWH_HRECVUPi; Sat, 16 Mar 2024 22:28:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C38E641561
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C38E641561;
	Sat, 16 Mar 2024 22:28:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8B2211BF3D5
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 22:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84FAA410D4
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 22:28:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Prs5RChoU_Lx for <buildroot@lists.busybox.net>;
 Sat, 16 Mar 2024 22:28:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 48A904098E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48A904098E
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 48A904098E
 for <buildroot@buildroot.org>; Sat, 16 Mar 2024 22:28:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 500AAC0004;
 Sat, 16 Mar 2024 22:28:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rlcVU-001XXJ-24;
 Sat, 16 Mar 2024 23:28:00 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Frank Vanbever via buildroot <buildroot@buildroot.org>
References: <20240217092413.288309-1-frank.vanbever@mind.be>
Date: Sat, 16 Mar 2024 23:28:00 +0100
In-Reply-To: <20240217092413.288309-1-frank.vanbever@mind.be> (Frank Vanbever
 via buildroot's message of "Sat, 17 Feb 2024 10:24:13 +0100")
Message-ID: <87msqxke1b.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/libmodsecurity: security bump
 to 3.0.12
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
Cc: Frank Vanbever <frank.vanbever@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Frank" == Frank Vanbever via buildroot <buildroot@buildroot.org> writes:

 > The project has been transferred from Trustwave (SpiderLabs) to OWASP, hence the
 > change in URLs. The upstream CPE vendor ID will likely also change in the future
 > but the upstream is still working on this [1].

 > - Fixes:
 >   https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2024-1019

 > [1] https://github.com/owasp-modsecurity/ModSecurity/issues/3083

 > Signed-off-by: Frank Vanbever <frank.vanbever@mind.be>

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
