Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C608C04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 21:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24FE541524;
	Thu, 28 Jul 2022 21:00:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24FE541524
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id abAOck-XsBze; Thu, 28 Jul 2022 21:00:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDD6740148;
	Thu, 28 Jul 2022 21:00:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDD6740148
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 16F091BF20B
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 20:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A452812F7
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 20:59:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A452812F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xMv0mgTXRLoh for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 20:59:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 228C181304
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 20:59:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 228C181304
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id F1957867FA; Thu, 28 Jul 2022 20:45:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 22:56:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5b4350b6b9a23687016bbdf99c32caa90118a9c7
X-Git-Newrev: b3e96b1fb0d0a7245cea6921fcdd7986762e5ec1
X-Patchwork-Hint: ignore
Message-Id: <20220728204519.F1957867FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lapack: bump to version 3.10.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b3e96b1fb0d0a7245cea6921fcdd7986762e5ec1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (already in version)
- Update hash of LICENSE (update in year:
  https://github.com/Reference-LAPACK/lapack/commit/e7ad0370d4c3bb81d663abb773e49094f68bd5d6)

http://www.netlib.org/lapack/lapack-3.10.1.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Fix-out-of-bounds-read-in-slarrv.patch    | 82 ----------------------
 package/lapack/lapack.hash                         |  4 +-
 package/lapack/lapack.mk                           |  5 +-
 3 files changed, 3 insertions(+), 88 deletions(-)

diff --git a/package/lapack/0001-Fix-out-of-bounds-read-in-slarrv.patch b/package/lapack/0001-Fix-out-of-bounds-read-in-slarrv.patch
deleted file mode 100644
index 43c6444b02..0000000000
--- a/package/lapack/0001-Fix-out-of-bounds-read-in-slarrv.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From 0631b6beaed60ba118b0b027c0f8d35397bf5df0 Mon Sep 17 00:00:00 2001
-From: Keno Fischer <keno@juliacomputing.com>
-Date: Thu, 30 Sep 2021 03:51:23 -0400
-Subject: [PATCH] Fix out of bounds read in slarrv
-
-This was originally reported as https://github.com/JuliaLang/julia/issues/42415.
-I've tracked this down to an our of bounds read on the following line:
-
-https://github.com/Reference-LAPACK/lapack/blob/44ecb6a5ff821b1cbb39f8cc2166cb098e060b4d/SRC/slarrv.f#L423
-
-In the crashing example, `M` is `0`, causing `slarrv` to read uninitialized
-memory from the work array. I believe the `0` for `M` is correct and indeed,
-the documentation above supports that `M` may be zero:
-
-https://github.com/Reference-LAPACK/lapack/blob/44ecb6a5ff821b1cbb39f8cc2166cb098e060b4d/SRC/slarrv.f#L113-L116
-
-I believe it may be sufficient to early-out this function as suggested
-in this PR. However, I have limited context for the full routine here,
-so I would appreciate a sanity check.
-
-[Retrieved from:
-https://github.com/Reference-LAPACK/lapack/commit/38f3eeee3108b18158409ca2a100e6fe03754781]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- SRC/clarrv.f | 2 +-
- SRC/dlarrv.f | 2 +-
- SRC/slarrv.f | 2 +-
- SRC/zlarrv.f | 2 +-
- 4 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/SRC/clarrv.f b/SRC/clarrv.f
-index 1f09e4da6..42f710757 100644
---- a/SRC/clarrv.f
-+++ b/SRC/clarrv.f
-@@ -348,7 +348,7 @@ SUBROUTINE CLARRV( N, VL, VU, D, L, PIVMIN,
- *
- *     Quick return if possible
- *
--      IF( N.LE.0 ) THEN
-+      IF( (N.LE.0).OR.(M.LE.0) ) THEN
-          RETURN
-       END IF
- *
-diff --git a/SRC/dlarrv.f b/SRC/dlarrv.f
-index b036c1e66..299430361 100644
---- a/SRC/dlarrv.f
-+++ b/SRC/dlarrv.f
-@@ -350,7 +350,7 @@ SUBROUTINE DLARRV( N, VL, VU, D, L, PIVMIN,
- *
- *     Quick return if possible
- *
--      IF( N.LE.0 ) THEN
-+      IF( (N.LE.0).OR.(M.LE.0) ) THEN
-          RETURN
-       END IF
- *
-diff --git a/SRC/slarrv.f b/SRC/slarrv.f
-index 9d72b339a..95f94fd1b 100644
---- a/SRC/slarrv.f
-+++ b/SRC/slarrv.f
-@@ -350,7 +350,7 @@ SUBROUTINE SLARRV( N, VL, VU, D, L, PIVMIN,
- *
- *     Quick return if possible
- *
--      IF( N.LE.0 ) THEN
-+      IF( (N.LE.0).OR.(M.LE.0) ) THEN
-          RETURN
-       END IF
- *
-diff --git a/SRC/zlarrv.f b/SRC/zlarrv.f
-index 51ec558f5..e4be63e0d 100644
---- a/SRC/zlarrv.f
-+++ b/SRC/zlarrv.f
-@@ -348,7 +348,7 @@ SUBROUTINE ZLARRV( N, VL, VU, D, L, PIVMIN,
- *
- *     Quick return if possible
- *
--      IF( N.LE.0 ) THEN
-+      IF( (N.LE.0).OR.(M.LE.0) ) THEN
-          RETURN
-       END IF
- *
diff --git a/package/lapack/lapack.hash b/package/lapack/lapack.hash
index 6f6dbff1a6..4d4d2c0596 100644
--- a/package/lapack/lapack.hash
+++ b/package/lapack/lapack.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  328c1bea493a32cac5257d84157dc686cc3ab0b004e2bea22044e0a59f6f8a19  lapack-3.10.0.tar.gz
-sha256  66246b7d3e6736aea46e63fd5e087659474d07edfe2f9b051d085d9b42aaac61  LICENSE
+sha256  cd005cd021f144d7d5f7f33c943942db9f03a28d110d6a3b80d718a295f7f714  lapack-3.10.1.tar.gz
+sha256  44f7c08ab11e40b21d8bf8220712929ba8d0204645d2174869acf915562d0969  LICENSE
diff --git a/package/lapack/lapack.mk b/package/lapack/lapack.mk
index 609075842d..2d069c1c93 100644
--- a/package/lapack/lapack.mk
+++ b/package/lapack/lapack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LAPACK_VERSION = 3.10.0
+LAPACK_VERSION = 3.10.1
 LAPACK_LICENSE = BSD-3-Clause
 LAPACK_LICENSE_FILES = LICENSE
 LAPACK_SITE = $(call github,Reference-LAPACK,lapack,v$(LAPACK_VERSION))
@@ -13,9 +13,6 @@ LAPACK_INSTALL_STAGING = YES
 LAPACK_SUPPORTS_IN_SOURCE_BUILD = NO
 LAPACK_CONF_OPTS = -DLAPACKE=ON -DCBLAS=ON
 
-# 0001-Fix-out-of-bounds-read-in-slarrv.patch
-LAPACK_IGNORE_CVES += CVE-2021-4048
-
 ifeq ($(BR2_PACKAGE_LAPACK_COMPLEX),y)
 LAPACK_CONF_OPTS += -DBUILD_COMPLEX=ON -DBUILD_COMPLEX16=ON
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
