Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DBBD58D66
	for <buildroot@archiver.kernel.org>; Mon, 25 Nov 2024 16:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9F9C84FB7;
	Mon, 25 Nov 2024 16:43:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4aRQgnncyOjH; Mon, 25 Nov 2024 16:43:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA0DC84FCE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA0DC84FCE;
	Mon, 25 Nov 2024 16:43:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BC4EC4E7B
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 16:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D6D142F8B
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 16:43:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PAFxovKgjIvZ for <buildroot@buildroot.org>;
 Mon, 25 Nov 2024 16:43:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62F5040298
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62F5040298
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 16:43:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4FDB77FC1D; Mon, 25 Nov 2024 16:43:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Nov 2024 17:27:44 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 35d3dd33dadb5d91c4c4f260def4078f75df6e3b
X-Git-Newrev: fee127154a7bb889cff6c64046c05888f5257168
X-Patchwork-Hint: ignore
Message-Id: <20241125164339.4FDB77FC1D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/x11vnc: add and
 rework compile patches
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

commit: https://git.buildroot.net/buildroot/commit/?id=fee127154a7bb889cff6c64046c05888f5257168
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Add the "Upstream" field to the patch message for:
 - 0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
 - 0002-scan-limit-access-to-shared-memory-segments-to-current-user.patch

Add a compile patch for GCC >= 10 which enables -fno-common by default.

Fixes:
 - https://autobuild.buildroot.org/results/b2231fe06fe56036a5ddbe61cb8556b046e3a7b7
 - https://autobuild.buildroot.org/results/8afbcc63818d3e1586731e178f16635e773d5600
 - ...

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
[Julien: simplified autobuild URLs]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e5bb457d5d703aa327354236729dff1f261348ac)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |  2 -
 ...x-build-on-32bit-arches-with-64bit-time_t.patch |  8 ++--
 ...ccess-to-shared-memory-segments-to-curre.patch} |  8 ++--
 .../x11vnc/0003-Fix-build-with-fno-common.patch    | 48 ++++++++++++++++++++++
 4 files changed, 58 insertions(+), 8 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 78f05a4739..0096ed7d2f 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1375,8 +1375,6 @@ package/x11r7/xdriver_xf86-video-nouveau/0001-nouveau-fixup-driver-for-new-X-ser
 package/x11r7/xdriver_xf86-video-tdfx/0001-cross.patch Sob Upstream
 package/x11r7/xserver_xorg-server/0001-include-misc.h-fix-uClibc-build.patch Upstream
 package/x11r7/xserver_xorg-server/S40xorg Shellcheck Variables
-package/x11vnc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch Upstream
-package/x11vnc/0002-scan-limit-access-to-shared-memory-segments-to-current-user.patch Upstream
 package/xen/0001-9pfs-include-linux-limits.h-for-XATTR_SIZE_MAX.patch Upstream
 package/xen/0002-Fix-build-with-64-bits-time_t.patch Upstream
 package/xen/0003-libs-light-fix-tv_sec-printf-format.patch Upstream
diff --git a/package/x11vnc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch b/package/x11vnc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
index 87dc3c994f..a9af88e55d 100644
--- a/package/x11vnc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
+++ b/package/x11vnc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
@@ -1,4 +1,4 @@
-From daecf59cc8b294265666482a4766aaa3148c308b Mon Sep 17 00:00:00 2001
+From 8ca0465fda181bd20e5d30c36fb2aea56ed27b6b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Nov 2019 11:43:32 -0800
 Subject: [PATCH] Fix build on 32bit arches with 64bit time_t
@@ -8,8 +8,7 @@ input.h [1]
 
 [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=152194fe9c3f
 
-[Retrieved from:
-https://github.com/LibVNC/x11vnc/commit/daecf59cc8b294265666482a4766aaa3148c308b]
+Upstream: https://github.com/LibVNC/x11vnc/commit/daecf59cc8b294265666482a4766aaa3148c308b
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  src/uinput.c | 25 +++++++++++++++++++++----
@@ -107,3 +106,6 @@ index 28fbad3..d71bcde 100644
  	ev.type = EV_KEY;
  	ev.code = (unsigned char) scancode;
  	ev.value = down;
+-- 
+2.43.0
+
diff --git a/package/x11vnc/0002-scan-limit-access-to-shared-memory-segments-to-current-user.patch b/package/x11vnc/0002-scan-limit-access-to-shared-memory-segments-to-curre.patch
similarity index 81%
rename from package/x11vnc/0002-scan-limit-access-to-shared-memory-segments-to-current-user.patch
rename to package/x11vnc/0002-scan-limit-access-to-shared-memory-segments-to-curre.patch
index e4dbdf1894..05977375d8 100644
--- a/package/x11vnc/0002-scan-limit-access-to-shared-memory-segments-to-current-user.patch
+++ b/package/x11vnc/0002-scan-limit-access-to-shared-memory-segments-to-curre.patch
@@ -1,10 +1,9 @@
-From 69eeb9f7baa14ca03b16c9de821f9876def7a36a Mon Sep 17 00:00:00 2001
+From 3870280eca9c10a3607440209e9caf6d7749e379 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Gu=C3=A9nal=20DAVALAN?= <guenal.davalan@uca.fr>
 Date: Wed, 18 Nov 2020 08:40:45 +0100
 Subject: [PATCH] scan: limit access to shared memory segments to current user
 
-[Retrieved from:
-https://github.com/LibVNC/x11vnc/commit/69eeb9f7baa14ca03b16c9de821f9876def7a36a]
+Upstream: https://github.com/LibVNC/x11vnc/commit/69eeb9f7baa14ca03b16c9de821f9876def7a36a
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  src/scan.c | 2 +-
@@ -23,3 +22,6 @@ index 43e00d2..12994d5 100644
  
  	if (shm->shmid == -1) {
  		rfbErr("shmget(%s) failed.\n", name);
+-- 
+2.43.0
+
diff --git a/package/x11vnc/0003-Fix-build-with-fno-common.patch b/package/x11vnc/0003-Fix-build-with-fno-common.patch
new file mode 100644
index 0000000000..eccfd3872a
--- /dev/null
+++ b/package/x11vnc/0003-Fix-build-with-fno-common.patch
@@ -0,0 +1,48 @@
+From 08d57adf499264fcd32461a4092cd799c474d669 Mon Sep 17 00:00:00 2001
+From: Alexander Tsoy <alexander@tsoy.me>
+Date: Tue, 28 Jan 2020 22:21:01 +0300
+Subject: [PATCH] Fix build with -fno-common
+
+GCC 10 defaults to -fno-common
+
+Upstream: https://github.com/LibVNC/x11vnc/commit/a48b0b1cd887d7f3ae67f525d7d334bd2feffe60
+Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
+---
+ src/util.c | 3 +++
+ src/util.h | 6 +++---
+ 2 files changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/src/util.c b/src/util.c
+index a82a1a4..6a52ebf 100644
+--- a/src/util.c
++++ b/src/util.c
+@@ -47,6 +47,9 @@ int hxl = 0;
+ #ifdef LIBVNCSERVER_HAVE_LIBPTHREAD
+ MUTEX(x11Mutex);
+ MUTEX(scrollMutex);
++MUTEX(clientMutex);
++MUTEX(inputMutex);
++MUTEX(pointerMutex);
+ #endif
+ 
+ int nfix(int i, int n);
+diff --git a/src/util.h b/src/util.h
+index 35c1afd..99b5dd1 100644
+--- a/src/util.h
++++ b/src/util.h
+@@ -102,9 +102,9 @@ extern struct timeval _mysleep;
+ #ifdef LIBVNCSERVER_HAVE_LIBPTHREAD
+ extern MUTEX(x11Mutex);
+ extern MUTEX(scrollMutex);
+-MUTEX(clientMutex);
+-MUTEX(inputMutex);
+-MUTEX(pointerMutex);
++extern MUTEX(clientMutex);
++extern MUTEX(inputMutex);
++extern MUTEX(pointerMutex);
+ #endif
+ 
+ #define X_INIT INIT_MUTEX(x11Mutex)
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
