Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2877EEF312
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 08:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A1C260B3C;
	Thu,  5 Mar 2026 08:02:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id brEBFYZM4BSS; Thu,  5 Mar 2026 08:02:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F8AB60B5B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772697761;
	bh=wjyGXjlB8dccxJgGTLYuCIwj/m4CUyBlW9eCXsneW1c=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ffu6aUNYAnSy8GnN6B9I6LrxEL0RunlwP+VTeEyb5WC0+xYdWklVihRDU9LXPBEhT
	 WvxA4vfo7ch07qbZ8Ei27Wz07xzp8HQfPgT+sui4JfChCKbi85magmz8mGCoqOAvfW
	 8MciHZkNHRne3vkRyki6olWTymfudbUiJzP1O9VU34H4+5Nql8d9CJ41IPoFU1CQiA
	 PW4vXBnEVDesX5m4YzFmN7+WMCtMcN6+E6OtVj3PMiq1Nph7GS/SYyXrVSzIvLS2Bx
	 2ap2Cy4RfGhHnPcwQ/WogmdK6GleYoUjpDvoKXtN5shEifvhnwaDlynlyU6GrzzqEG
	 VArGnE6UmHaSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F8AB60B5B;
	Thu,  5 Mar 2026 08:02:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1186334F
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFC8B4066A
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ljf_-V3bMbf3 for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 08:02:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43AC940583
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43AC940583
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4FFA2828F8; Thu,  5 Mar 2026 08:02:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 5 Mar 2026 08:57:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1822a98827b1f1f500548cf9a9bc8f7bdb838c24
X-Git-Newrev: ee671bdd18792f0bace0b2de084d4fda6982ddad
X-Patchwork-Hint: ignore
Message-Id: <20260305080209.4FFA2828F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Merge branch 'next'
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ee671bdd18792f0bace0b2de084d4fda6982ddad
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Patch is too large, so refusing to show it
Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
