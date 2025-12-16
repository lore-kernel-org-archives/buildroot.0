Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA56D5CC9D
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 10:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BEA6608FE;
	Tue, 16 Dec 2025 10:00:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e4C9e9Xn4nz0; Tue, 16 Dec 2025 10:00:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8936F6090C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765879216;
	bh=UrMmYgPu69xi+jEPyXKISZCmVsWoAB4TuMWXd/JJrtY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=l6uVYup0SpHIWKKB3CmSd/ByCnK9Zje4LyhajsMrdQ4WvvBaUDlfIY9NyDks8sUgb
	 tFqHen1YjYmDs336BKBaj0UQyrabrkgvM1KbUJvhRIAvJH/77EUU0gTAumOGp4e9WO
	 1JfB+cVwf3tkOzssppu2wvpyxXLwbo2IciZ+rnpNKmwkBmLC3sL7djkUdxOGA4snmb
	 cy4bgccTmaIKU7yhSqEqOscZupuYQ0EAryVqVsuaNdTkgd5qnsPvpNDZUokF8vyYkj
	 Jed4a7xvwDWYIe2Od6Pg9AmdAeGCHni8MQH0Vp4htm40nc2Vuo+mCZDF1DMBN/ZS3L
	 7YridH4CYlr6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8936F6090C;
	Tue, 16 Dec 2025 10:00:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A6662372
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 10:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C4BA6090C
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 10:00:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r78LHTILwbM7 for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 10:00:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE25E608FE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE25E608FE
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 10:00:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C25987067; Tue, 16 Dec 2025 10:00:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 16 Dec 2025 10:59:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: df26e939636610e2d5aac5dc35265f8d334c40eb
X-Git-Newrev: 92e1a15522347c5e092496f8603c50d86f62de74
X-Patchwork-Hint: ignore
Message-Id: <20251216100013.9C25987067@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libyuv: bump version
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=92e1a15522347c5e092496f8603c50d86f62de74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump includes a patch which adds cmake4 compatibility.

Rebased patch 0001.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libyuv/0001-i386-sse2.patch | 14 +++++++-------
 package/libyuv/libyuv.hash          |  2 +-
 package/libyuv/libyuv.mk            |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/libyuv/0001-i386-sse2.patch b/package/libyuv/0001-i386-sse2.patch
index 2380bbc973..7d61fb0609 100644
--- a/package/libyuv/0001-i386-sse2.patch
+++ b/package/libyuv/0001-i386-sse2.patch
@@ -1,16 +1,16 @@
 Fix compilation on non-sse2 platforms
 
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 
 diff -uNr libyuv-1411.org/include/libyuv/scale_row.h libyuv-1411/include/libyuv/scale_row.h
 --- libyuv-1411.org/include/libyuv/scale_row.h	2015-05-22 23:39:21.000000000 +0200
 +++ libyuv-1411/include/libyuv/scale_row.h	2015-05-25 12:35:17.000000000 +0200
-@@ -55,7 +55,7 @@
- 
- // The following are available on all x86 platforms:
- #if !defined(LIBYUV_DISABLE_X86) && \
--    (defined(_M_IX86) || defined(__x86_64__) || defined(__i386__))
-+    (defined(_M_IX86) || defined(__x86_64__) || (defined(__i386__) && defined(__SSE2__)))
+@@ -24,7 +24,7 @@
+ #if !defined(LIBYUV_DISABLE_X86) &&                             \
+     (defined(_M_IX86) ||                                        \
+      (defined(__x86_64__) && !defined(LIBYUV_ENABLE_ROWWIN)) || \
+-     defined(__i386__))
++     (defined(__i386__) && defined(__SSE2__)))
  #define HAS_FIXEDDIV1_X86
  #define HAS_FIXEDDIV_X86
  #define HAS_SCALEADDROW_SSE2
diff --git a/package/libyuv/libyuv.hash b/package/libyuv/libyuv.hash
index 095da4e606..cad7427721 100644
--- a/package/libyuv/libyuv.hash
+++ b/package/libyuv/libyuv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e27c9d73ca502361d0e532065e790e41a958ae0369f1edfa4d296d33317653b1  libyuv-413a8d8041f1cc5a350a47c0d81cc721e64f9fd0-git4.tar.gz
+sha256  324b6bb4a158f2a231427562a01becafc7cb8ad4e105b9f9b21b85ccc406b649  libyuv-4825d9b29eea4dac24607245db7ec7d4c41c1964-git4.tar.gz
 sha256  2b2cc1180c7e6988328ad2033b04b80117419db9c4c584918bbb3cfec7e9364f  LICENSE
diff --git a/package/libyuv/libyuv.mk b/package/libyuv/libyuv.mk
index b3843cec8f..676a95c3d7 100644
--- a/package/libyuv/libyuv.mk
+++ b/package/libyuv/libyuv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBYUV_VERSION = 413a8d8041f1cc5a350a47c0d81cc721e64f9fd0
+LIBYUV_VERSION = 4825d9b29eea4dac24607245db7ec7d4c41c1964
 LIBYUV_SITE = https://chromium.googlesource.com/libyuv/libyuv
 LIBYUV_SITE_METHOD = git
 LIBYUV_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
