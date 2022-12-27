Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5CFCC4167B
	for <buildroot@archiver.kernel.org>; Tue, 27 Dec 2022 20:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 831FE60BB0;
	Tue, 27 Dec 2022 20:50:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 831FE60BB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g2k92jyI5ygm; Tue, 27 Dec 2022 20:50:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9162F60B35;
	Tue, 27 Dec 2022 20:50:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9162F60B35
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 708F61BF37A
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 20:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C70181272
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 20:50:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C70181272
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UmIwYjnz7YYr for <buildroot@lists.busybox.net>;
 Tue, 27 Dec 2022 20:50:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5597080C2B
 for <buildroot@buildroot.org>; Tue, 27 Dec 2022 20:50:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5597080C2B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4419B86EBE; Tue, 27 Dec 2022 20:50:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Dec 2022 21:50:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: de4cf253752d2225b7d258cbaee0ddebf64901fa
X-Git-Newrev: 92a4f080b2721cc84248ebc98d41229469787688
X-Patchwork-Hint: ignore
Message-Id: <20221227205025.4419B86EBE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/orc: bump to version 0.4.33
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

commit: https://git.buildroot.net/buildroot/commit/?id=92a4f080b2721cc84248ebc98d41229469787688
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version)

https://gitlab.freedesktop.org/gstreamer/orc/-/blob/0.4.33/RELEASE

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ccpu-powerpc.c-fix-build-with-kernel-4.11.patch | 70 ----------------------
 package/orc/orc.hash                               |  4 +-
 package/orc/orc.mk                                 |  2 +-
 3 files changed, 3 insertions(+), 73 deletions(-)

diff --git a/package/orc/0001-orc-orccpu-powerpc.c-fix-build-with-kernel-4.11.patch b/package/orc/0001-orc-orccpu-powerpc.c-fix-build-with-kernel-4.11.patch
deleted file mode 100644
index 0a4e7010f2..0000000000
--- a/package/orc/0001-orc-orccpu-powerpc.c-fix-build-with-kernel-4.11.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From a45f6d49ec090ad94333c0865c378d2d96ab2af4 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 15 Feb 2021 20:17:43 +0100
-Subject: [PATCH] orc/orccpu-powerpc.c: fix build with kernel < 4.11
-
-Build with powerpc and kernel < 4.11 is broken since version 0.4.30 and
-https://gitlab.freedesktop.org/gstreamer/orc/-/commit/a999325abea6a5549d60d99ddeb0271d2aa00235:
-
-FAILED: orc/liborc-0.4.so.0.32.0.p/orccpu-powerpc.c.o
-/home/giuliobenetti/autobuild/run/instance-3/output-1/host/bin/powerpc-linux-gcc -Iorc/liborc-0.4.so.0.32.0.p -Iorc -I../orc -I. -I.. -fdiagnostics-color=always -pipe -Wall -Winvalid-pch -std=gnu99 -O3 -DHAVE_CONFIG_H -fvisibility=hidden -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O2 -fPIC -pthread -DORC_ENABLE_UNSTABLE_API -D_GNU_SOURCE -DBUILDING_ORC -MD -MQ orc/liborc-0.4.so.0.32.0.p/orccpu-powerpc.c.o -MF orc/liborc-0.4.so.0.32.0.p/orccpu-powerpc.c.o.d -o orc/liborc-0.4.so.0.32.0.p/orccpu-powerpc.c.o -c ../orc/orccpu-powerpc.c
-../orc/orccpu-powerpc.c: In function 'orc_check_powerpc_proc_auxv':
-../orc/orccpu-powerpc.c:164:21: error: 'AT_L1D_CACHESIZE' undeclared (first use in this function); did you mean 'AT_DCACHEBSIZE'?
-  164 |       if (buf[i] == AT_L1D_CACHESIZE) {
-      |                     ^~~~~~~~~~~~~~~~
-      |                     AT_DCACHEBSIZE
-../orc/orccpu-powerpc.c:164:21: note: each undeclared identifier is reported only once for each function it appears in
-../orc/orccpu-powerpc.c:168:21: error: 'AT_L2_CACHESIZE' undeclared (first use in this function); did you mean 'AT_ICACHEBSIZE'?
-  168 |       if (buf[i] == AT_L2_CACHESIZE) {
-      |                     ^~~~~~~~~~~~~~~
-      |                     AT_ICACHEBSIZE
-../orc/orccpu-powerpc.c:172:21: error: 'AT_L3_CACHESIZE' undeclared (first use in this function); did you mean 'AT_ICACHEBSIZE'?
-  172 |       if (buf[i] == AT_L3_CACHESIZE) {
-      |                     ^~~~~~~~~~~~~~~
-      |                     AT_ICACHEBSIZE
-
-Indeed, AT_{L1D,L2,L3}_CACHESIZE is only defined since kernel 4.11 and
-https://github.com/torvalds/linux/commit/98a5f361b8625c6f4841d6ba013bbf0e80d08147
-
-Fixes:
- - http://autobuild.buildroot.org/results/0821e96cba3e455edd47b87485501d892fc7ac6a
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.freedesktop.org/gstreamer/orc/-/merge_requests/56]
----
- orc/orccpu-powerpc.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/orc/orccpu-powerpc.c b/orc/orccpu-powerpc.c
-index 6796f17..340cf05 100644
---- a/orc/orccpu-powerpc.c
-+++ b/orc/orccpu-powerpc.c
-@@ -161,18 +161,24 @@ orc_check_powerpc_proc_auxv (void)
-         _orc_cpu_name = (char*)buf[i + 1];
-         found++;
-       }
-+#ifdef AT_L1D_CACHESIZE
-       if (buf[i] == AT_L1D_CACHESIZE) {
-         _orc_data_cache_size_level1 = buf[i + 1];
-         found++;
-       }
-+#endif
-+#ifdef AT_L2_CACHESIZE
-       if (buf[i] == AT_L2_CACHESIZE) {
-         _orc_data_cache_size_level2 = buf[i + 1];
-         found++;
-       }
-+#endif
-+#ifdef AT_L3_CACHESIZE
-       if (buf[i] == AT_L3_CACHESIZE) {
-         _orc_data_cache_size_level3 = buf[i + 1];
-         found++;
-       }
-+#endif
-       if (found == 6)
-         break;
-     }
--- 
-2.30.0
-
diff --git a/package/orc/orc.hash b/package/orc/orc.hash
index f48c2932ab..136fc3ece4 100644
--- a/package/orc/orc.hash
+++ b/package/orc/orc.hash
@@ -1,5 +1,5 @@
-# From https://gstreamer.freedesktop.org/data/src/orc/orc-0.4.32.tar.xz.sha256sum
-sha256  a66e3d8f2b7e65178d786a01ef61f2a0a0b4d0b8370de7ce134ba73da4af18f0  orc-0.4.32.tar.xz
+# From https://gstreamer.freedesktop.org/data/src/orc/orc-0.4.33.tar.xz.sha256sum
+sha256  844e6d7db8086f793f57618d3d4b68d29d99b16034e71430df3c21cfd3c3542a  orc-0.4.33.tar.xz
 
 # Locally calculated
 sha256  4f5dabb1b44bb6fc5cd53820b1f103147ad61b395a57903991325bd1b85d97bf  COPYING
diff --git a/package/orc/orc.mk b/package/orc/orc.mk
index a93a4f875a..be718e6f85 100644
--- a/package/orc/orc.mk
+++ b/package/orc/orc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ORC_VERSION = 0.4.32
+ORC_VERSION = 0.4.33
 ORC_SOURCE = orc-$(ORC_VERSION).tar.xz
 ORC_SITE = http://gstreamer.freedesktop.org/data/src/orc
 ORC_LICENSE = BSD-2-Clause, BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
