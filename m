Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4BFCA0EDC
	for <buildroot@archiver.kernel.org>; Tue, 12 Aug 2025 21:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D297A41D81;
	Tue, 12 Aug 2025 21:42:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gJKtdvFXjoaW; Tue, 12 Aug 2025 21:42:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADBB441D82
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADBB441D82;
	Tue, 12 Aug 2025 21:42:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 732C5938
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 21:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64699606DF
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 21:42:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NSb6HzfncrXy for <buildroot@buildroot.org>;
 Tue, 12 Aug 2025 21:42:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CA81606DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CA81606DC
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 21:42:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 271F08750E; Tue, 12 Aug 2025 21:42:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 12 Aug 2025 21:28:23 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6e51f5835567051d5feb2e3d08e9a3c802e1a440
X-Git-Newrev: c9c8624d45eefe3465fb0a5d75dc12c1a74e9044
X-Patchwork-Hint: ignore
Message-Id: <20250812214220.271F08750E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gcc: backport upstream
 fix for glibc 2.42 build
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c9c8624d45eefe3465fb0a5d75dc12c1a74e9044
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

glibc 2.42 drops <termio.h>, so the libsanitizer code needs to be
adjusted accordingly, by backporting upstream gcc fixes.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Julien:
 - renumbered 14.3.0/0003 patch to 14.3.0/0004
 - renumbered 15.1.0/0002 patch to 15.1.0/0004
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...04-libsanitizer-Fix-build-with-glibc-2.42.patch | 81 ++++++++++++++++++++++
 ...04-libsanitizer-Fix-build-with-glibc-2.42.patch | 81 ++++++++++++++++++++++
 ...04-libsanitizer-Fix-build-with-glibc-2.42.patch | 81 ++++++++++++++++++++++
 3 files changed, 243 insertions(+)

diff --git a/package/gcc/13.4.0/0004-libsanitizer-Fix-build-with-glibc-2.42.patch b/package/gcc/13.4.0/0004-libsanitizer-Fix-build-with-glibc-2.42.patch
new file mode 100644
index 0000000000..13f7f469c4
--- /dev/null
+++ b/package/gcc/13.4.0/0004-libsanitizer-Fix-build-with-glibc-2.42.patch
@@ -0,0 +1,81 @@
+From d32ece49d32b00448d967e7dbc6900fb25cbc775 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Fri, 2 May 2025 17:41:43 +0200
+Subject: [PATCH] libsanitizer: Fix build with glibc 2.42
+
+The termio structure will be removed from glibc 2.42.  It has
+been deprecated since the late 80s/early 90s.
+
+Cherry-picked from LLVM commit 59978b21ad9c65276ee8e14f26759691b8a65763
+("[sanitizer_common] Remove interceptors for deprecated struct termio
+(#137403)").
+
+Co-Authored-By: Tom Stellard <tstellar@redhat.com>
+
+libsanitizer/
+
+	* sanitizer_common/sanitizer_common_interceptors_ioctl.inc: Cherry
+	picked from LLVM commit 59978b21ad9c65276ee8e14f26759691b8a65763.
+	* sanitizer_common/sanitizer_platform_limits_posix.cpp: Likewise.
+	* sanitizer_common/sanitizer_platform_limits_posix.h: Likewise.
+
+Upstream: 1789c57dc97ea2f9819ef89e28bf17208b6208e7 (gcc master branch)
+Upstream: d32ece49d32b00448d967e7dbc6900fb25cbc775 (gcc 15.x branch)
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ .../sanitizer_common_interceptors_ioctl.inc               | 8 --------
+ .../sanitizer_common/sanitizer_platform_limits_posix.cpp  | 3 ---
+ .../sanitizer_common/sanitizer_platform_limits_posix.h    | 1 -
+ 3 files changed, 12 deletions(-)
+
+diff --git a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
+index 49ec4097c90..dda11daa77f 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
++++ b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
+@@ -338,17 +338,9 @@ static void ioctl_table_fill() {
+   _(SOUND_PCM_WRITE_CHANNELS, WRITE, sizeof(int));
+   _(SOUND_PCM_WRITE_FILTER, WRITE, sizeof(int));
+   _(TCFLSH, NONE, 0);
+-#if SANITIZER_GLIBC
+-  _(TCGETA, WRITE, struct_termio_sz);
+-#endif
+   _(TCGETS, WRITE, struct_termios_sz);
+   _(TCSBRK, NONE, 0);
+   _(TCSBRKP, NONE, 0);
+-#if SANITIZER_GLIBC
+-  _(TCSETA, READ, struct_termio_sz);
+-  _(TCSETAF, READ, struct_termio_sz);
+-  _(TCSETAW, READ, struct_termio_sz);
+-#endif
+   _(TCSETS, READ, struct_termios_sz);
+   _(TCSETSF, READ, struct_termios_sz);
+   _(TCSETSW, READ, struct_termios_sz);
+diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
+index c87d5ef42c9..7bbc6f2edac 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
+@@ -485,9 +485,6 @@ unsigned struct_ElfW_Phdr_sz = sizeof(Elf_Phdr);
+   unsigned struct_input_id_sz = sizeof(struct input_id);
+   unsigned struct_mtpos_sz = sizeof(struct mtpos);
+   unsigned struct_rtentry_sz = sizeof(struct rtentry);
+-#if SANITIZER_GLIBC || SANITIZER_ANDROID
+-  unsigned struct_termio_sz = sizeof(struct termio);
+-#endif
+   unsigned struct_vt_consize_sz = sizeof(struct vt_consize);
+   unsigned struct_vt_sizes_sz = sizeof(struct vt_sizes);
+   unsigned struct_vt_stat_sz = sizeof(struct vt_stat);
+diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
+index c07f7cd0b0d..a80df656826 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
+@@ -1029,7 +1029,6 @@ extern unsigned struct_hd_geometry_sz;
+ extern unsigned struct_input_absinfo_sz;
+ extern unsigned struct_input_id_sz;
+ extern unsigned struct_mtpos_sz;
+-extern unsigned struct_termio_sz;
+ extern unsigned struct_vt_consize_sz;
+ extern unsigned struct_vt_sizes_sz;
+ extern unsigned struct_vt_stat_sz;
+-- 
+2.50.1
+
diff --git a/package/gcc/14.3.0/0004-libsanitizer-Fix-build-with-glibc-2.42.patch b/package/gcc/14.3.0/0004-libsanitizer-Fix-build-with-glibc-2.42.patch
new file mode 100644
index 0000000000..13f7f469c4
--- /dev/null
+++ b/package/gcc/14.3.0/0004-libsanitizer-Fix-build-with-glibc-2.42.patch
@@ -0,0 +1,81 @@
+From d32ece49d32b00448d967e7dbc6900fb25cbc775 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Fri, 2 May 2025 17:41:43 +0200
+Subject: [PATCH] libsanitizer: Fix build with glibc 2.42
+
+The termio structure will be removed from glibc 2.42.  It has
+been deprecated since the late 80s/early 90s.
+
+Cherry-picked from LLVM commit 59978b21ad9c65276ee8e14f26759691b8a65763
+("[sanitizer_common] Remove interceptors for deprecated struct termio
+(#137403)").
+
+Co-Authored-By: Tom Stellard <tstellar@redhat.com>
+
+libsanitizer/
+
+	* sanitizer_common/sanitizer_common_interceptors_ioctl.inc: Cherry
+	picked from LLVM commit 59978b21ad9c65276ee8e14f26759691b8a65763.
+	* sanitizer_common/sanitizer_platform_limits_posix.cpp: Likewise.
+	* sanitizer_common/sanitizer_platform_limits_posix.h: Likewise.
+
+Upstream: 1789c57dc97ea2f9819ef89e28bf17208b6208e7 (gcc master branch)
+Upstream: d32ece49d32b00448d967e7dbc6900fb25cbc775 (gcc 15.x branch)
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ .../sanitizer_common_interceptors_ioctl.inc               | 8 --------
+ .../sanitizer_common/sanitizer_platform_limits_posix.cpp  | 3 ---
+ .../sanitizer_common/sanitizer_platform_limits_posix.h    | 1 -
+ 3 files changed, 12 deletions(-)
+
+diff --git a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
+index 49ec4097c90..dda11daa77f 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
++++ b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
+@@ -338,17 +338,9 @@ static void ioctl_table_fill() {
+   _(SOUND_PCM_WRITE_CHANNELS, WRITE, sizeof(int));
+   _(SOUND_PCM_WRITE_FILTER, WRITE, sizeof(int));
+   _(TCFLSH, NONE, 0);
+-#if SANITIZER_GLIBC
+-  _(TCGETA, WRITE, struct_termio_sz);
+-#endif
+   _(TCGETS, WRITE, struct_termios_sz);
+   _(TCSBRK, NONE, 0);
+   _(TCSBRKP, NONE, 0);
+-#if SANITIZER_GLIBC
+-  _(TCSETA, READ, struct_termio_sz);
+-  _(TCSETAF, READ, struct_termio_sz);
+-  _(TCSETAW, READ, struct_termio_sz);
+-#endif
+   _(TCSETS, READ, struct_termios_sz);
+   _(TCSETSF, READ, struct_termios_sz);
+   _(TCSETSW, READ, struct_termios_sz);
+diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
+index c87d5ef42c9..7bbc6f2edac 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
+@@ -485,9 +485,6 @@ unsigned struct_ElfW_Phdr_sz = sizeof(Elf_Phdr);
+   unsigned struct_input_id_sz = sizeof(struct input_id);
+   unsigned struct_mtpos_sz = sizeof(struct mtpos);
+   unsigned struct_rtentry_sz = sizeof(struct rtentry);
+-#if SANITIZER_GLIBC || SANITIZER_ANDROID
+-  unsigned struct_termio_sz = sizeof(struct termio);
+-#endif
+   unsigned struct_vt_consize_sz = sizeof(struct vt_consize);
+   unsigned struct_vt_sizes_sz = sizeof(struct vt_sizes);
+   unsigned struct_vt_stat_sz = sizeof(struct vt_stat);
+diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
+index c07f7cd0b0d..a80df656826 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
+@@ -1029,7 +1029,6 @@ extern unsigned struct_hd_geometry_sz;
+ extern unsigned struct_input_absinfo_sz;
+ extern unsigned struct_input_id_sz;
+ extern unsigned struct_mtpos_sz;
+-extern unsigned struct_termio_sz;
+ extern unsigned struct_vt_consize_sz;
+ extern unsigned struct_vt_sizes_sz;
+ extern unsigned struct_vt_stat_sz;
+-- 
+2.50.1
+
diff --git a/package/gcc/15.1.0/0004-libsanitizer-Fix-build-with-glibc-2.42.patch b/package/gcc/15.1.0/0004-libsanitizer-Fix-build-with-glibc-2.42.patch
new file mode 100644
index 0000000000..13f7f469c4
--- /dev/null
+++ b/package/gcc/15.1.0/0004-libsanitizer-Fix-build-with-glibc-2.42.patch
@@ -0,0 +1,81 @@
+From d32ece49d32b00448d967e7dbc6900fb25cbc775 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Fri, 2 May 2025 17:41:43 +0200
+Subject: [PATCH] libsanitizer: Fix build with glibc 2.42
+
+The termio structure will be removed from glibc 2.42.  It has
+been deprecated since the late 80s/early 90s.
+
+Cherry-picked from LLVM commit 59978b21ad9c65276ee8e14f26759691b8a65763
+("[sanitizer_common] Remove interceptors for deprecated struct termio
+(#137403)").
+
+Co-Authored-By: Tom Stellard <tstellar@redhat.com>
+
+libsanitizer/
+
+	* sanitizer_common/sanitizer_common_interceptors_ioctl.inc: Cherry
+	picked from LLVM commit 59978b21ad9c65276ee8e14f26759691b8a65763.
+	* sanitizer_common/sanitizer_platform_limits_posix.cpp: Likewise.
+	* sanitizer_common/sanitizer_platform_limits_posix.h: Likewise.
+
+Upstream: 1789c57dc97ea2f9819ef89e28bf17208b6208e7 (gcc master branch)
+Upstream: d32ece49d32b00448d967e7dbc6900fb25cbc775 (gcc 15.x branch)
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ .../sanitizer_common_interceptors_ioctl.inc               | 8 --------
+ .../sanitizer_common/sanitizer_platform_limits_posix.cpp  | 3 ---
+ .../sanitizer_common/sanitizer_platform_limits_posix.h    | 1 -
+ 3 files changed, 12 deletions(-)
+
+diff --git a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
+index 49ec4097c90..dda11daa77f 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
++++ b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
+@@ -338,17 +338,9 @@ static void ioctl_table_fill() {
+   _(SOUND_PCM_WRITE_CHANNELS, WRITE, sizeof(int));
+   _(SOUND_PCM_WRITE_FILTER, WRITE, sizeof(int));
+   _(TCFLSH, NONE, 0);
+-#if SANITIZER_GLIBC
+-  _(TCGETA, WRITE, struct_termio_sz);
+-#endif
+   _(TCGETS, WRITE, struct_termios_sz);
+   _(TCSBRK, NONE, 0);
+   _(TCSBRKP, NONE, 0);
+-#if SANITIZER_GLIBC
+-  _(TCSETA, READ, struct_termio_sz);
+-  _(TCSETAF, READ, struct_termio_sz);
+-  _(TCSETAW, READ, struct_termio_sz);
+-#endif
+   _(TCSETS, READ, struct_termios_sz);
+   _(TCSETSF, READ, struct_termios_sz);
+   _(TCSETSW, READ, struct_termios_sz);
+diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
+index c87d5ef42c9..7bbc6f2edac 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
+@@ -485,9 +485,6 @@ unsigned struct_ElfW_Phdr_sz = sizeof(Elf_Phdr);
+   unsigned struct_input_id_sz = sizeof(struct input_id);
+   unsigned struct_mtpos_sz = sizeof(struct mtpos);
+   unsigned struct_rtentry_sz = sizeof(struct rtentry);
+-#if SANITIZER_GLIBC || SANITIZER_ANDROID
+-  unsigned struct_termio_sz = sizeof(struct termio);
+-#endif
+   unsigned struct_vt_consize_sz = sizeof(struct vt_consize);
+   unsigned struct_vt_sizes_sz = sizeof(struct vt_sizes);
+   unsigned struct_vt_stat_sz = sizeof(struct vt_stat);
+diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
+index c07f7cd0b0d..a80df656826 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
+@@ -1029,7 +1029,6 @@ extern unsigned struct_hd_geometry_sz;
+ extern unsigned struct_input_absinfo_sz;
+ extern unsigned struct_input_id_sz;
+ extern unsigned struct_mtpos_sz;
+-extern unsigned struct_termio_sz;
+ extern unsigned struct_vt_consize_sz;
+ extern unsigned struct_vt_sizes_sz;
+ extern unsigned struct_vt_stat_sz;
+-- 
+2.50.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
