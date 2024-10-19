Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 551F1D3C92C
	for <buildroot@archiver.kernel.org>; Sat, 19 Oct 2024 19:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EDE580A48;
	Sat, 19 Oct 2024 19:16:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yNmhpICUruiN; Sat, 19 Oct 2024 19:16:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 315E880C45
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 315E880C45;
	Sat, 19 Oct 2024 19:16:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 39FB33F2C
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 19:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BBE580C45
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 19:16:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lNsyGIQTyhvp for <buildroot@buildroot.org>;
 Sat, 19 Oct 2024 19:16:38 +0000 (UTC)
X-Greylist: delayed 373 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 19 Oct 2024 19:16:37 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0C9F980A48
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C9F980A48
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C9F980A48
 for <buildroot@busybox.net>; Sat, 19 Oct 2024 19:16:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 43C44FF802;
 Sat, 19 Oct 2024 19:16:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1t2EwE-00B4b3-26;
 Sat, 19 Oct 2024 21:16:34 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
References: <20240925133735.3899867-1-francois.perrad@gadz.org>
Date: Sat, 19 Oct 2024 21:16:34 +0200
In-Reply-To: <20240925133735.3899867-1-francois.perrad@gadz.org> (Francois
 Perrad's message of "Wed, 25 Sep 2024 15:37:34 +0200")
Message-ID: <8734krdht9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/libarchive: bump to version 3.7.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Francois" == Francois Perrad <francois.perrad@gadz.org> writes:

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Looking at https://github.com/libarchive/libarchive/releases I see that
this fixes a number of security issues, so it should be marked as a
security bump:

Security fixes:

    fix multiple vulnerabilities identified by SAST (#2251, #2256)
    cpio: ignore out-of-range gid/uid/size/ino and harden AFIO parsing (#2258)
    lzop: prevent integer overflow (#2174)
    rar4: protect copy_from_lzss_window_to_unp() (#2172, CVE-2024-20696)
    rar4: fix CVE-2024-26256 (#2269, CVS-2024-26256)
    rar4: fix OOB in delta and audio filter (#2148, #2149)
    rar4: fix out of boundary access with large files (#2179)
    rar4: add boundary checks to rgb filter (#2210)
    rar4: fix OOB access with unicode filenames (#2203)
    rar5: clear 'data ready' cache on window buffer reallocs (#2265)
    rpm: calculate huge header sizes correctly (#2158)
    unzip: unify EOF handling (#2175)
    util: fix out of boundary access in mktemp functions (#2160)
    uu: stop processing if lines are too long (#2168)

In addition, 3.7.7 has been released with more security fixes - Care to
send a patch?

Committed to 2024.02.x and 2024.08.x after marking as a security bump,
thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
