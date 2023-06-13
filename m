Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5542C77B7A
	for <buildroot@archiver.kernel.org>; Tue, 13 Jun 2023 07:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35B61408AF;
	Tue, 13 Jun 2023 07:06:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35B61408AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gHIezUf2XBsp; Tue, 13 Jun 2023 07:06:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E887408A5;
	Tue, 13 Jun 2023 07:06:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E887408A5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D5E511BF95E
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 07:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8EF4408AF
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 07:05:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8EF4408AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id szYxiKHzKVRj for <buildroot@lists.busybox.net>;
 Tue, 13 Jun 2023 07:05:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF2A5408A5
 for <buildroot@buildroot.org>; Tue, 13 Jun 2023 07:05:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF2A5408A5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD769828A6; Tue, 13 Jun 2023 07:05:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 13 Jun 2023 09:04:21 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 73ff3453af0dbadc02ec58dc849c0a1df434a9f4
X-Git-Newrev: 7494a4c331569336e1a3e9ca34d97ac31916b127
X-Patchwork-Hint: ignore
Message-Id: <20230613070545.DD769828A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/qemu: add patches
 to fix host libc-2.37 compile
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
Content-Type: multipart/mixed; boundary="===============6194885584576704542=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6194885584576704542==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=7494a4c331569336e1a3e9ca34d97ac31916b127
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

- add two upstream patches to fix host libc-2.37 compile
  (see [1], [2] for details)

Fixes:

  In file included from /usr/include/linux/btrfs.h:29,
                   from ../linux-user/syscall.c:163:
  /usr/include/linux/fs.h:50:8: error: redefinition of ‘struct file_clone_range’
     50 | struct file_clone_range {
        |        ^~~~~~~~~~~~~~~~
  ../linux-user/syscall.c:129:8: note: originally defined here
    129 | struct file_clone_range {
        |        ^~~~~~~~~~~~~~~~

[1] https://lists.openembedded.org/g/openembedded-core/message/177322
[2] https://lore.kernel.org/qemu-devel/20230110174901.2580297-1-berrange@redhat.com/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit eac0e9cf82b7189b6bb2f2449a68abbcee2651d2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ux-user-add-more-compat-ioctl-definitions.patch | 73 +++++++++++++++++++
 ...x-user-fix-compat-with-glibc-2.36-sys-mou.patch | 82 ++++++++++++++++++++++
 2 files changed, 155 insertions(+)

diff --git a/package/qemu/0003-Revert-linux-user-add-more-compat-ioctl-definitions.patch b/package/qemu/0003-Revert-linux-user-add-more-compat-ioctl-definitions.patch
new file mode 100644
index 0000000000..2d303cd012
--- /dev/null
+++ b/package/qemu/0003-Revert-linux-user-add-more-compat-ioctl-definitions.patch
@@ -0,0 +1,73 @@
+From 274f00f33411caee51973a9f7701daf194da5a0a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
+Date: Tue, 10 Jan 2023 12:49:00 -0500
+Subject: [PATCH] Revert "linux-user: add more compat ioctl definitions"
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This reverts commit c5495f4ecb0cdaaf2e9dddeb48f1689cdb520ca0.
+
+glibc has fixed (in 2.36.9000-40-g774058d729) the problem
+that caused a clash when both sys/mount.h annd linux/mount.h
+are included, and backported this to the 2.36 stable release
+too:
+
+  https://sourceware.org/glibc/wiki/Release/2.36#Usage_of_.3Clinux.2Fmount.h.3E_and_.3Csys.2Fmount.h.3E
+
+It is saner for QEMU to remove the workaround it applied for
+glibc 2.36 and expect distros to ship the 2.36 maint release
+with the fix. This avoids needing to add a further workaround
+to QEMU to deal with the fact that linux/brtfs.h now also pulls
+in linux/mount.h via linux/fs.h since Linux 6.1
+
+Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
+Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
+Message-Id: <20230110174901.2580297-2-berrange@redhat.com>
+Signed-off-by: Laurent Vivier <laurent@vivier.eu>
+
+Upstream: https://gitlab.com/qemu-project/qemu/-/commit/9f0246539ae84a5e21efd1cc4516fc343f08115a
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ linux-user/syscall.c | 25 -------------------------
+ 1 file changed, 25 deletions(-)
+
+diff --git a/linux-user/syscall.c b/linux-user/syscall.c
+index 24b25759be..10af5e0d8e 100644
+--- a/linux-user/syscall.c
++++ b/linux-user/syscall.c
+@@ -111,31 +111,6 @@
+ #define FS_IOC32_SETFLAGS              _IOW('f', 2, int)
+ #define FS_IOC32_GETVERSION            _IOR('v', 1, int)
+ #define FS_IOC32_SETVERSION            _IOW('v', 2, int)
+-
+-#define BLKGETSIZE64 _IOR(0x12,114,size_t)
+-#define BLKDISCARD _IO(0x12,119)
+-#define BLKIOMIN _IO(0x12,120)
+-#define BLKIOOPT _IO(0x12,121)
+-#define BLKALIGNOFF _IO(0x12,122)
+-#define BLKPBSZGET _IO(0x12,123)
+-#define BLKDISCARDZEROES _IO(0x12,124)
+-#define BLKSECDISCARD _IO(0x12,125)
+-#define BLKROTATIONAL _IO(0x12,126)
+-#define BLKZEROOUT _IO(0x12,127)
+-
+-#define FIBMAP     _IO(0x00,1)
+-#define FIGETBSZ   _IO(0x00,2)
+-
+-struct file_clone_range {
+-        __s64 src_fd;
+-        __u64 src_offset;
+-        __u64 src_length;
+-        __u64 dest_offset;
+-};
+-
+-#define FICLONE         _IOW(0x94, 9, int)
+-#define FICLONERANGE    _IOW(0x94, 13, struct file_clone_range)
+-
+ #else
+ #include <linux/fs.h>
+ #endif
+-- 
+2.25.1
+
diff --git a/package/qemu/0004-Revert-linux-user-fix-compat-with-glibc-2.36-sys-mou.patch b/package/qemu/0004-Revert-linux-user-fix-compat-with-glibc-2.36-sys-mou.patch
new file mode 100644
index 0000000000..2a36a5cbb4
--- /dev/null
+++ b/package/qemu/0004-Revert-linux-user-fix-compat-with-glibc-2.36-sys-mou.patch
@@ -0,0 +1,82 @@
+From e07973ca745958da739f8ece80273da48f94f031 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
+Date: Tue, 10 Jan 2023 12:49:01 -0500
+Subject: [PATCH] Revert "linux-user: fix compat with glibc >= 2.36
+ sys/mount.h"
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This reverts commit 3cd3df2a9584e6f753bb62a0028bd67124ab5532.
+
+glibc has fixed (in 2.36.9000-40-g774058d729) the problem
+that caused a clash when both sys/mount.h annd linux/mount.h
+are included, and backported this to the 2.36 stable release
+too:
+
+  https://sourceware.org/glibc/wiki/Release/2.36#Usage_of_.3Clinux.2Fmount.h.3E_and_.3Csys.2Fmount.h.3E
+
+It is saner for QEMU to remove the workaround it applied for
+glibc 2.36 and expect distros to ship the 2.36 maint release
+with the fix. This avoids needing to add a further workaround
+to QEMU to deal with the fact that linux/brtfs.h now also pulls
+in linux/mount.h via linux/fs.h since Linux 6.1
+
+Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
+Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
+Message-Id: <20230110174901.2580297-3-berrange@redhat.com>
+Signed-off-by: Laurent Vivier <laurent@vivier.eu>
+
+Upstream: https://gitlab.com/qemu-project/qemu/-/commit/6003159ce18faad4e1bc7bf9c85669019cd4950e
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ linux-user/syscall.c | 18 ------------------
+ meson.build          |  2 --
+ 2 files changed, 20 deletions(-)
+
+diff --git a/linux-user/syscall.c b/linux-user/syscall.c
+index 10af5e0d8e..d974c76b60 100644
+--- a/linux-user/syscall.c
++++ b/linux-user/syscall.c
+@@ -95,25 +95,7 @@
+ #include <linux/soundcard.h>
+ #include <linux/kd.h>
+ #include <linux/mtio.h>
+-
+-#ifdef HAVE_SYS_MOUNT_FSCONFIG
+-/*
+- * glibc >= 2.36 linux/mount.h conflicts with sys/mount.h,
+- * which in turn prevents use of linux/fs.h. So we have to
+- * define the constants ourselves for now.
+- */
+-#define FS_IOC_GETFLAGS                _IOR('f', 1, long)
+-#define FS_IOC_SETFLAGS                _IOW('f', 2, long)
+-#define FS_IOC_GETVERSION              _IOR('v', 1, long)
+-#define FS_IOC_SETVERSION              _IOW('v', 2, long)
+-#define FS_IOC_FIEMAP                  _IOWR('f', 11, struct fiemap)
+-#define FS_IOC32_GETFLAGS              _IOR('f', 1, int)
+-#define FS_IOC32_SETFLAGS              _IOW('f', 2, int)
+-#define FS_IOC32_GETVERSION            _IOR('v', 1, int)
+-#define FS_IOC32_SETVERSION            _IOW('v', 2, int)
+-#else
+ #include <linux/fs.h>
+-#endif
+ #include <linux/fd.h>
+ #if defined(CONFIG_FIEMAP)
+ #include <linux/fiemap.h>
+diff --git a/meson.build b/meson.build
+index b88867ca9d..39e83bbafe 100644
+--- a/meson.build
++++ b/meson.build
+@@ -2032,8 +2032,6 @@ config_host_data.set('HAVE_OPTRESET',
+                      cc.has_header_symbol('getopt.h', 'optreset'))
+ config_host_data.set('HAVE_IPPROTO_MPTCP',
+                      cc.has_header_symbol('netinet/in.h', 'IPPROTO_MPTCP'))
+-config_host_data.set('HAVE_SYS_MOUNT_FSCONFIG',
+-                     cc.has_header_symbol('sys/mount.h', 'FSCONFIG_SET_FLAG'))
+ 
+ # has_member
+ config_host_data.set('HAVE_SIGEV_NOTIFY_THREAD_ID',
+-- 
+2.25.1
+

--===============6194885584576704542==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6194885584576704542==--
