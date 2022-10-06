Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5625C433FE
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 18:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B3F5610A0;
	Thu,  6 Oct 2022 18:47:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B3F5610A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nBg-pU70ooA8; Thu,  6 Oct 2022 18:47:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31BDF6107A;
	Thu,  6 Oct 2022 18:47:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31BDF6107A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2D02D1BF3D2
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 18:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDE4560F71
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 18:46:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDE4560F71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VtKmqyWxgihZ for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 18:46:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 066AD60F6F
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 18:46:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 066AD60F6F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E47D6869A3; Thu,  6 Oct 2022 18:46:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 6 Oct 2022 20:42:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fc523deaf9e2e83a69ef54a2eee965e3b618a758
X-Git-Newrev: 343974b99528702842e8c1dad945fcd4f0defd6c
X-Patchwork-Hint: ignore
Message-Id: <20221006184635.E47D6869A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6: bump to version 6.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=343974b99528702842e8c1dad945fcd4f0defd6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop the qsimd_p.h fix, this has been fixed upstream since 6.3.2/6.4.0

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6.mk                                 |  4 +-
 ...-global-qsimd_p.h-fix-build-on-ARM-v7-due.patch | 49 ----------------------
 package/qt6/qt6base/qt6base.hash                   |  4 +-
 package/qt6/qt6serialport/qt6serialport.hash       |  4 +-
 4 files changed, 6 insertions(+), 55 deletions(-)

diff --git a/package/qt6/qt6.mk b/package/qt6/qt6.mk
index b609baf4c6..575b2f826c 100644
--- a/package/qt6/qt6.mk
+++ b/package/qt6/qt6.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-QT6_VERSION_MAJOR = 6.3
-QT6_VERSION = $(QT6_VERSION_MAJOR).2
+QT6_VERSION_MAJOR = 6.4
+QT6_VERSION = $(QT6_VERSION_MAJOR).0
 QT6_SOURCE_TARBALL_PREFIX = everywhere-src
 QT6_SITE = https://download.qt.io/archive/qt/$(QT6_VERSION_MAJOR)/$(QT6_VERSION)/submodules
 
diff --git a/package/qt6/qt6base/0001-src-corelib-global-qsimd_p.h-fix-build-on-ARM-v7-due.patch b/package/qt6/qt6base/0001-src-corelib-global-qsimd_p.h-fix-build-on-ARM-v7-due.patch
deleted file mode 100644
index 1097a79922..0000000000
--- a/package/qt6/qt6base/0001-src-corelib-global-qsimd_p.h-fix-build-on-ARM-v7-due.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From d69db2ba3ce47f6eded0a8843c413a67d26e6375 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sun, 24 Jul 2022 20:37:51 +0200
-Subject: [PATCH] src/corelib/global/qsimd_p.h: fix build on ARM < v7 due to
- yield instruction
-
-On ARM < v7 with gcc, the build fails with:
-
-/tmp/ccRlrCQi.s: Assembler messages:
-/tmp/ccRlrCQi.s:3858: Error: selected processor does not support `yield' in ARM mode
-/tmp/ccRlrCQi.s:3875: Error: selected processor does not support `yield' in ARM mode
-/tmp/ccRlrCQi.s:4606: Error: selected processor does not support `yield' in ARM mode
-/tmp/ccRlrCQi.s:4853: Error: selected processor does not support `yield' in ARM mode
-/tmp/ccRlrCQi.s:5268: Error: selected processor does not support `yield' in ARM mode
-
-while building src/corelib/thread/qfutureinterface.cpp.
-
-This is due to the fact that the qYieldCpu() macro on ARM, assumes
-that if the compiler is gcc, we can do asm volatile("yield"). However,
-this instruction is only guaranteed to exist on ARMv7+ cores. It
-doesn't exist on ARMv5, and only some (but not all) ARMv6 cores have
-it. If it's not available, we just fallback to the default behavior of
-qYieldCpu(), which is to do nothing.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Upstream bug: https://bugreports.qt.io/browse/QTBUG-105162
----
- src/corelib/global/qsimd_p.h | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/src/corelib/global/qsimd_p.h b/src/corelib/global/qsimd_p.h
-index d270d09f2f..b84b257e54 100644
---- a/src/corelib/global/qsimd_p.h
-+++ b/src/corelib/global/qsimd_p.h
-@@ -428,7 +428,10 @@ static inline void qYieldCpu()
-          https://stackoverflow.com/a/70076751/134841
-          https://gcc.gnu.org/bugzilla/show_bug.cgi?id=105416
-     */
--    asm volatile("yield"); /* this works everywhere */
-+#    if defined(Q_PROCESSOR_ARM_V7)
-+    /* The yield instruction appeared in ARMv7 */
-+    asm volatile("yield");
-+#    endif
- #  else
-     __yield(); /* this is what should work everywhere */
- #  endif
--- 
-2.37.1
-
diff --git a/package/qt6/qt6base/qt6base.hash b/package/qt6/qt6base/qt6base.hash
index e43a6ff52d..5dd26973fa 100644
--- a/package/qt6/qt6base/qt6base.hash
+++ b/package/qt6/qt6base/qt6base.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.3/6.3.2/submodules/qtbase-everywhere-src-6.3.2.tar.xz.sha256
-sha256  7929ba4df870b6b30870bc0aed2525cfc606ed7091107b23cf7ed7e434caa9a6  qtbase-everywhere-src-6.3.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.4/6.4.0/submodules/qtbase-everywhere-src-6.4.0.tar.xz.sha256
+sha256  cb6475a0bd8567c49f7ffbb072a05516ee6671171bed55db75b22b94ead9b37d  qtbase-everywhere-src-6.4.0.tar.xz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt6/qt6serialport/qt6serialport.hash b/package/qt6/qt6serialport/qt6serialport.hash
index 50202a1e26..fb1b3dcf6b 100644
--- a/package/qt6/qt6serialport/qt6serialport.hash
+++ b/package/qt6/qt6serialport/qt6serialport.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.3/6.3.1/submodules/qtserialport-everywhere-src-6.3.1.tar.xz.sha256
-sha256  c7d207322367c63647edbd06ded9c76ba9071961daac1d1021b622b762c35e6f  qtserialport-everywhere-src-6.3.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.4/6.4.0/submodules/qtserialport-everywhere-src-6.4.0.tar.xz.sha256
+sha256  f148cc9e87ce2228e82bff7a64d9521339ece66c4c66aa43b91bac614f4a4483  qtserialport-everywhere-src-6.4.0.tar.xz
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
