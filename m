Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C2FAFF885A
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63DB5846DA;
	Mon,  4 May 2026 14:48:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pLfxdsX75yrB; Mon,  4 May 2026 14:48:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C37F846DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906132;
	bh=r2dhF5aQK/t0uBMgl3FmXykJ9m1Fv14tolzFeHLtLpg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nTzQWPtpU6A+QuYdSsqh4SRiZgZii7O7EFM0QlDBmQYNSDUwcS2x5fmryOh4SYPCv
	 T09IUwJnxPcadIc6MkRLFKKN56u1wvh6RzIoJlCNDgToodDbihkowPVaT4z8lfwt0Z
	 0ASVCp+MmPxQBebyQa2G160eJPEiL1WPCu4Ysn8pPKKFyl/JIoPmeFG0EIpJAlrx21
	 QMlRbyS4lfLVz2Xb+4+sPw8T2LQqpQOb9RKp2QKG8B5Bx1xXnORto0CqlyeZgLtod7
	 LRr2bcRrqiJriwRZ0f61heZripPiuamWwZSF6c8zATPKiB7zN7U9+iic2TOA765oM4
	 3HE6Gl+eoFt3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C37F846DB;
	Mon,  4 May 2026 14:48:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 01CB625D
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3488A84628
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tdMmb_nalSse for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:48:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FD01846B1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FD01846B1
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 647F584364; Mon,  4 May 2026 14:48:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 14:01:05 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: eff9a8c4e293c4483b29a769fd68423d469c05ab
X-Git-Newrev: f3c3cfd7b138e46375f7f82d73a27daa1d6d8160
X-Patchwork-Hint: ignore
Message-Id: <20260504144839.647F584364@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/imagemagick:
 security bump to v7.1.2-19
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f3c3cfd7b138e46375f7f82d73a27daa1d6d8160
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

For change log, see:
https://github.com/ImageMagick/Website/blob/main/ChangeLog.md#712-19---2026-04-12

This fixes a large number of CVEs:
- CVE-2026-28493 (since 7.1.2-16)
- CVE-2026-28494 (since 7.1.2-16)
- CVE-2026-28686 (since 7.1.2-16)
- CVE-2026-28687 (since 7.1.2-16)
- CVE-2026-28688 (since 7.1.2-16)
- CVE-2026-28689 (since 7.1.2-16)
- CVE-2026-28690 (since 7.1.2-16)
- CVE-2026-28691 (since 7.1.2-16)
- CVE-2026-28692 (since 7.1.2-16)
- CVE-2026-28693 (since 7.1.2-16)
- CVE-2026-30883 (since 7.1.2-16)
- CVE-2026-30929 (since 7.1.2-16)
- CVE-2026-30931 (since 7.1.2-16)
- CVE-2026-30935 (since 7.1.2-16)
- CVE-2026-30936 (since 7.1.2-16)
- CVE-2026-30937 (since 7.1.2-16)
- CVE-2026-31853 (since 7.1.2-16)
- CVE-2026-32259 (since 7.1.2-16)
- CVE-2026-32636 (since 7.1.2-17)
- CVE-2026-33535 (since 7.1.2-18)
- CVE-2026-33536 (since 7.1.2-18)
- CVE-2026-33899 (since 7.1.2-19)
- CVE-2026-33900 (since 7.1.2-19)
- CVE-2026-33901 (since 7.1.2-19)
- CVE-2026-33902 (since 7.1.2-19)
- CVE-2026-33905 (since 7.1.2-19)
- CVE-2026-33908 (since 7.1.2-19)
- CVE-2026-34238 (since 7.1.2-19)
- CVE-2026-40169 (since 7.1.2-19)
- CVE-2026-40183 (since 7.1.2-19)
- CVE-2026-40310 (since 7.1.2-19)
- CVE-2026-40311 (since 7.1.2-19)
- CVE-2026-40312 (since 7.1.2-19)

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
[Julien: add link to change log in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 08d0c7617159020b0658a98a79b4de5fe69ce3e7)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 90383c4d17..a308cd1f06 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bf646e7fffdf50b7d886eec6bbe51c3ced1c4d68fbabfcc534e014575359fe7f  imagemagick-7.1.2-15.tar.gz
+sha256  91ffe35706ef01d0fc9630e3a81b168b9bdb10b5e1e0b0983c287063cce21210  imagemagick-7.1.2-19.tar.gz
 sha256  131447ad0099069beaa32acf1700716eea294a5bdf936d8211d7026b1849e5d4  LICENSE
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 5a03fbfd8f..d88323ca2d 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.1.2-15
+IMAGEMAGICK_VERSION = 7.1.2-19
 IMAGEMAGICK_SITE = $(call github,ImageMagick,ImageMagick,$(IMAGEMAGICK_VERSION))
 IMAGEMAGICK_LICENSE = Apache-2.0
 IMAGEMAGICK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
