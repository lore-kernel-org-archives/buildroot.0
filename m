Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80D8C6FA8A
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 09:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 876DC40BF8;
	Sun, 11 Sep 2022 09:15:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 876DC40BF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9U7W0gLH0aIc; Sun, 11 Sep 2022 09:15:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81A1D40BCA;
	Sun, 11 Sep 2022 09:15:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81A1D40BCA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 11F9B1BF368
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F3BB8186A
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F3BB8186A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UamVO1Uk7sZg for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2BF7681325
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BF7681325
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2A56083518; Sun, 11 Sep 2022 08:48:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 6 Sep 2022 18:15:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ec1b5c59a183ecbaf5774856b8b3228363993fef
X-Git-Newrev: 812b8526f8e6260d8ea90b6d4aff7d7788614b1f
X-Patchwork-Hint: ignore
Message-Id: <20220911084829.2A56083518@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: bump to version 7.1.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=812b8526f8e6260d8ea90b6d4aff7d7788614b1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove upstream commit:
0003-linux-user-syscall.c-fix-build-without-RLIMIT_RTTIME.patch

Changes log:
https://wiki.qemu.org/ChangeLog/7.1

vnc-png option renamed to png:
https://gitlab.com/qemu-project/qemu/-/commit/95f8510ef428f988897176b9585b8ba1432f939f

linux-user has been fixed to build with glibc >= 2.36 (sys/mount.h):
https://gitlab.com/qemu-project/qemu/-/commit/3cd3df2a9584e6f753bb62a0028bd67124ab5532

Runtime tested in gitlab:
https://gitlab.com/kubu93/buildroot/-/pipelines/630473210

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...syscall.c-fix-build-without-RLIMIT_RTTIME.patch | 48 ----------------------
 package/qemu/qemu.hash                             |  2 +-
 package/qemu/qemu.mk                               |  8 ++--
 3 files changed, 5 insertions(+), 53 deletions(-)

diff --git a/package/qemu/0003-linux-user-syscall.c-fix-build-without-RLIMIT_RTTIME.patch b/package/qemu/0003-linux-user-syscall.c-fix-build-without-RLIMIT_RTTIME.patch
deleted file mode 100644
index 729c2e9be8..0000000000
--- a/package/qemu/0003-linux-user-syscall.c-fix-build-without-RLIMIT_RTTIME.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 84863e007d4ef0858e74a1250e2472954924c617 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 14 May 2022 16:10:16 +0200
-Subject: [PATCH] linux-user/syscall.c: fix build without RLIMIT_RTTIME
-
-RLIMIT_RTTIME is not provided by uclibc-ng or by musl prior to version
-1.2.0 and
-https://github.com/bminor/musl/commit/2507e7f5312e79620f6337935d0a6c9045ccba09
-resulting in the following build failure since
-https://git.qemu.org/?p=qemu.git;a=commit;h=244fd08323088db73590ff2317dfe86f810b51d7:
-
-../linux-user/syscall.c: In function 'target_to_host_resource':
-../linux-user/syscall.c:1057:16: error: 'RLIMIT_RTTIME' undeclared (first use in this function); did you mean 'RLIMIT_NOFILE'?
- 1057 |         return RLIMIT_RTTIME;
-      |                ^~~~~~~~~~~~~
-      |                RLIMIT_NOFILE
-
-Fixes:
- - http://autobuild.buildroot.org/results/22d3b584b704613d030e1ea9e6b709b713e4cc26
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://patchwork.ozlabs.org/project/qemu-devel/patch/20220523105239.1499162-1-fontaine.fabrice@gmail.com]
----
-Changes v1 -> v2 (after review of Laurent Vivier):
- - Use an ifdef block instead of defining RLIMIT_RTTIME
-
- linux-user/syscall.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/linux-user/syscall.c b/linux-user/syscall.c
-index dd0d92ba4e..488facb356 100644
---- a/linux-user/syscall.c
-+++ b/linux-user/syscall.c
-@@ -1053,8 +1053,10 @@ static inline int target_to_host_resource(int code)
-         return RLIMIT_RSS;
-     case TARGET_RLIMIT_RTPRIO:
-         return RLIMIT_RTPRIO;
-+#ifdef RLIMIT_RTTIME
-     case TARGET_RLIMIT_RTTIME:
-         return RLIMIT_RTTIME;
-+#endif
-     case TARGET_RLIMIT_SIGPENDING:
-         return RLIMIT_SIGPENDING;
-     case TARGET_RLIMIT_STACK:
--- 
-2.35.1
-
diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index 9c1a85a347..06d090bd1d 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,4 +1,4 @@
 # Locally computed, tarball verified with GPG signature
-sha256  f6b375c7951f728402798b0baabb2d86478ca53d44cedbefabbe1c46bf46f839  qemu-7.0.0.tar.xz
+sha256  a0634e536bded57cf38ec8a751adb124b89c776fe0846f21ab6c6728f1cbbbe6  qemu-7.1.0.tar.xz
 sha256  6f04ae8364d0079a192b14635f4b1da294ce18724c034c39a6a41d1b09df6100  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 9e1bec3836..57d7e31cb6 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QEMU_VERSION = 7.0.0
+QEMU_VERSION = 7.1.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = http://download.qemu.org
 QEMU_LICENSE = GPL-2.0, LGPL-2.1, MIT, BSD-3-Clause, BSD-2-Clause, Others/BSD-1c
@@ -124,10 +124,10 @@ QEMU_OPTS += \
 	--disable-vnc-sasl
 QEMU_DEPENDENCIES += libvncserver
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
-QEMU_OPTS += --enable-vnc-png
+QEMU_OPTS += --enable-png
 QEMU_DEPENDENCIES += libpng
 else
-QEMU_OPTS += --disable-vnc-png
+QEMU_OPTS += --disable-png
 endif
 ifeq ($(BR2_PACKAGE_JPEG),y)
 QEMU_OPTS += --enable-vnc-jpeg
@@ -388,7 +388,7 @@ define HOST_QEMU_CONFIGURE_CMDS
 		--disable-vhost-user-blk-server \
 		--disable-virtiofsd \
 		--disable-vnc-jpeg \
-		--disable-vnc-png \
+		--disable-png \
 		--disable-vnc-sasl \
 		--enable-tools \
 		$(HOST_QEMU_OPTS)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
