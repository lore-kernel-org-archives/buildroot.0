Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3FA7C4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 21:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 876D44011A;
	Mon,  4 Dec 2023 21:12:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 876D44011A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GT0GsZFkc671; Mon,  4 Dec 2023 21:12:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 999E241762;
	Mon,  4 Dec 2023 21:12:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 999E241762
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 077FB1BF977
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 21:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E288460FBD
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 21:12:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E288460FBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0EQ3VzfMgBWz for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 21:12:35 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 07BD360B25
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 21:12:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07BD360B25
Received: from fli4l.lan.fli4l (p4fd6c4a5.dip0.t-ipconnect.de [79.214.196.165])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E3659A4C042A
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 22:12:32 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50478)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1rAGEy-0006Rv-27
 for buildroot@buildroot.org; Mon, 04 Dec 2023 22:12:32 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  4 Dec 2023 22:12:32 +0100
Message-Id: <20231204211232.12539-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1701724352;
 bh=QbEgo4VmS5RlptgQZO2IyuOVFPGVgfYa7RjH/bRxq50=;
 h=From:To:Subject:Date:From;
 b=kuPid1fDz2ABO1tuuPOIrOcUTWQn/jdSBilHLY/Z3D3jfGBZXpETJereFvkzwnfZh
 S2wiGn8Pr4D1VnlxWAKaqu1z9MAmbFNcX5HBLJI9286VPjCKwNVpmSNLus2iCC7nBv
 rAffjel8g6NyGoyzYOtamq/icymvnfFijYWAVedbnv/dzZ7VvO8ul/BtR4WBCVZgbK
 Mdp9GH+0Qi7I9Byd3F7rtFa5c+C0M7HL88uKlCozZSfh2XlIWmEpVZED7sU02n9EUg
 dmlVsUlHDuDMT7mzl5h7fqDQq3hMO1+Nj8DnaQuq35bzmvYbRPxc4xJQaq1cDF1z7T
 jIQQTB6tec0KQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=kuPid1fD
Subject: [Buildroot] [PATCH 1/1] package/ethtool: bump version to 6.6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch back to upstream-provided tarball after upstream fixed the
inclusion of header files needed for older kernels:
https://git.kernel.org/pub/scm/network/ethtool/ethtool.git/commit/?id=988279e051e7a51d0b9e54a7366602ba2879d114

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ethtool/ethtool.hash | 3 ++-
 package/ethtool/ethtool.mk   | 9 +++------
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
index 812e4dd8d1..a37c800015 100644
--- a/package/ethtool/ethtool.hash
+++ b/package/ethtool/ethtool.hash
@@ -1,4 +1,5 @@
+# From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
+sha256  833a8493cb9cd5809ab59743092d9a38742c282290800e9626407511bbcebf9e  ethtool-6.6.tar.xz
 # Locally calculated
-sha256  b1f5fa66f71c3bab9daeacbd77e010b52c47df0a711b216847f78405f3299189  ethtool-6.5.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  5d632934396f90c82dfebe3c9512648bbb6333b406113d0cd331b0e0aa2d34a1  LICENSE
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index ee710e0021..c9c2856612 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,12 +4,9 @@
 #
 ################################################################################
 
-ETHTOOL_VERSION = 6.5
-ETHTOOL_SITE = https://git.kernel.org/pub/scm/network/ethtool/ethtool.git/snapshot
-# needed only for autoreconf
-ETHTOOL_DEPENDENCIES = host-pkgconf
-# GIT version, shipped without configure
-ETHTOOL_AUTORECONF = YES
+ETHTOOL_VERSION = 6.6
+ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
+ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPL-2.0
 ETHTOOL_LICENSE_FILES = LICENSE COPYING
 ETHTOOL_CPE_ID_VENDOR = kernel
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
