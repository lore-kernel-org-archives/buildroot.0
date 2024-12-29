Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4DBBC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 642156FC2A;
	Fri, 28 Feb 2025 16:34:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H0cHZz5wtorF; Fri, 28 Feb 2025 16:33:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AC6C6FB82
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AC6C6FB82;
	Fri, 28 Feb 2025 16:33:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 22BF394F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5B2B6FACE
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rcEu1hAGEl7r for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCCD86068F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCCD86068F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B7E6785B5E; Fri, 28 Feb 2025 16:29:51 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Dec 2024 19:24:25 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4af6fb64f3e8cdfd3a535c62a8402b2bcb1f375b
X-Git-Newrev: 4378f30da3a7beaad9417714268ca5a55cf81e93
X-Patchwork-Hint: ignore
Message-Id: <20250228162951.B7E6785B5E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/linux-fusion: remove
 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=4378f30da3a7beaad9417714268ca5a55cf81e93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

directfb.org is dead, and DirectFB is no longer maintained, so drop
this package.

Note that we are removing BR2_PACKAGE_DIRECTFB_MULTI in this commit,
without adding a Config.in.legacy entry, because a follow-up commit
will remove BR2_PACKAGE_DIRECTFB entirely.

Fixes:

  http://autobuild.buildroot.net/results/f8bc1d09f15362dc60656b517f36efb7ed5cbd1b/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |   4 -
 Config.in.legacy                                   |   7 ++
 package/Config.in                                  |   1 -
 package/directfb/Config.in                         |  11 --
 package/directfb/directfb.mk                       |  11 +-
 .../0001-fix-for-linux-4-and-above.patch           |  25 -----
 ...tched-conversion-spec-and-value-in-printk.patch |  29 -----
 ...fusion-Unknown-symbol-tasklist_lock-err-0.patch |  38 -------
 .../0004-Port-one-one_udp.c-to-Linux-4.1.patch     | 118 ---------------------
 package/linux-fusion/40-fusion.rules               |   1 -
 package/linux-fusion/Config.in                     |  12 ---
 package/linux-fusion/linux-fusion.hash             |   3 -
 package/linux-fusion/linux-fusion.mk               |  43 --------
 13 files changed, 10 insertions(+), 293 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 37b3a1dd76..a91e1c8526 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -760,10 +760,6 @@ package/lighttpd/S50lighttpd Shellcheck lib_sysv.EmptyLastLine lib_sysv.Indent l
 package/linknx/0001-configure-ac-tweak-CPPUNIT-conditional.patch lib_patch.Upstream
 package/linknx/0002-src-Makefile.am-fix-linking-with-log4cpp.patch lib_patch.Upstream
 package/linphone/0001-src-core-paths-paths.cpp-fix-powerpc-build.patch lib_patch.Upstream
-package/linux-fusion/0001-fix-for-linux-4-and-above.patch lib_patch.Upstream
-package/linux-fusion/0002-Fix-mismatched-conversion-spec-and-value-in-printk.patch lib_patch.Upstream
-package/linux-fusion/0003-Fix-fusion-Unknown-symbol-tasklist_lock-err-0.patch lib_patch.Upstream
-package/linux-fusion/0004-Port-one-one_udp.c-to-Linux-4.1.patch lib_patch.Upstream
 package/linux-zigbee/0001-test-serial-Remove-test-serial.patch lib_patch.Upstream
 package/linux-zigbee/0002-addrdb-coord-config-parse.y-add-missing-time.h-inclu.patch lib_patch.Upstream
 package/linuxptp/S65ptp4l Shellcheck lib_sysv.Indent
diff --git a/Config.in.legacy b/Config.in.legacy
index 34e2319949..5ee8fb27d9 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.02"
 
+config BR2_PACKAGE_LINUX_FUSION
+	bool "linux-fusion has been removed"
+	select BR2_LEGACY
+	help
+	  This package was no longer maintained upstream, so it was
+	  dropped from Buildroot.
+
 config BR2_PACKAGE_DIRECTFB_EXAMPLES
 	bool "directfb-examples has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index bbd46bd491..4b0467f3b1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -356,7 +356,6 @@ comment "Graphic libraries"
 	source "package/graphicsmagick/Config.in"
 	source "package/imagemagick/Config.in"
 	source "package/libglvnd/Config.in"
-	source "package/linux-fusion/Config.in"
 	source "package/lite/Config.in"
 	source "package/mesa3d/Config.in"
 	source "package/mesa3d-headers/Config.in"
diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index 20481f56da..055f418da5 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -21,17 +21,6 @@ config BR2_PACKAGE_DIRECTFB
 
 if BR2_PACKAGE_DIRECTFB
 
-config BR2_PACKAGE_DIRECTFB_MULTI
-	bool "directfb multi application"
-	depends on BR2_USE_MMU # madvise()
-	depends on BR2_LINUX_KERNEL
-	select BR2_PACKAGE_LINUX_FUSION
-	help
-	  Enable use of multiple concurrent DirectFB applications
-
-comment "directfb multi application needs a Linux kernel to be built"
-	depends on !BR2_LINUX_KERNEL
-
 config BR2_PACKAGE_DIRECTFB_DEBUG_SUPPORT
 	bool "directfb debugging support"
 	default y
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 094e87e7e7..3ab29994f5 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -23,7 +23,9 @@ DIRECTFB_CONF_OPTS = \
 	--disable-video4linux \
 	--disable-video4linux2 \
 	--without-tools \
-	--disable-x11
+	--disable-x11 \
+	--disable-multi \
+	--disable-multi-kernel
 
 ifeq ($(BR2_STATIC_LIBS),y)
 DIRECTFB_CONF_OPTS += --disable-dynload
@@ -33,13 +35,6 @@ DIRECTFB_CONFIG_SCRIPTS = directfb-config
 
 DIRECTFB_DEPENDENCIES = freetype zlib
 
-ifeq ($(BR2_PACKAGE_DIRECTFB_MULTI),y)
-DIRECTFB_CONF_OPTS += --enable-multi --enable-multi-kernel
-DIRECTFB_DEPENDENCIES += linux-fusion
-else
-DIRECTFB_CONF_OPTS += --disable-multi --disable-multi-kernel
-endif
-
 ifeq ($(BR2_PACKAGE_DIRECTFB_DEBUG_SUPPORT),y)
 DIRECTFB_CONF_OPTS += --enable-debug-support
 ifeq ($(BR2_PACKAGE_DIRECTFB_DEBUG),y)
diff --git a/package/linux-fusion/0001-fix-for-linux-4-and-above.patch b/package/linux-fusion/0001-fix-for-linux-4-and-above.patch
deleted file mode 100644
index bc9e936510..0000000000
--- a/package/linux-fusion/0001-fix-for-linux-4-and-above.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Fix build for linux >= 4.x
-
-Instead of relying on testing for '3' as the linux kernel major version,
-check that it is 2.x to include the proper Makefile, otherwise forcibly
-include the .26 Makefile, that is good for 3.x and 4.x too.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff -durN linux-fusion-9.0.2.orig/Makefile linux-fusion-9.0.2/Makefile
---- linux-fusion-9.0.2.orig/Makefile	2013-07-15 11:58:03.000000000 +0200
-+++ linux-fusion-9.0.2/Makefile	2015-06-06 19:03:04.059842652 +0200
-@@ -62,10 +62,10 @@
-   CPPFLAGS += -DHAVE_LINUX_CONFIG_H
- endif
- 
--ifeq ($(K_VERSION),3)
--  KMAKEFILE = Makefile-2.6
--else
-+ifeq ($(K_VERSION),2)
-   KMAKEFILE = Makefile-2.$(K_PATCHLEVEL)
-+else
-+  KMAKEFILE = Makefile-2.6
- endif
- 
- check-version = $(shell expr \( $(K_VERSION) \* 65536 + $(K_PATCHLEVEL) \* 256 + $(K_SUBLEVEL) \) \>= \( $(1) \* 65536 + $(2) \* 256 + $(3) \))
diff --git a/package/linux-fusion/0002-Fix-mismatched-conversion-spec-and-value-in-printk.patch b/package/linux-fusion/0002-Fix-mismatched-conversion-spec-and-value-in-printk.patch
deleted file mode 100644
index a3f8bb7812..0000000000
--- a/package/linux-fusion/0002-Fix-mismatched-conversion-spec-and-value-in-printk.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From debb9cafe9b7cc2b286399ecc8e3210480061c70 Mon Sep 17 00:00:00 2001
-From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
-Date: Mon, 11 Jan 2016 15:42:16 +0100
-Subject: [PATCH] Fix mismatched conversion spec and value in printk
-
-linux/drivers/char/fusion/fusiondev.c:775:38: warning:
-format '%ld' expects argument of type 'long int', but argument 7 has type 'int'
-
-Subtracting two pointers yields a ptrdiff_t value, and ptrdiff_t is not
-necessarily an alias for long int. Cast the value to long int.
-
-Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
----
- linux/drivers/char/fusion/fusiondev.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/linux/drivers/char/fusion/fusiondev.c b/linux/drivers/char/fusion/fusiondev.c
-index 7003407f7e1e..dfb5f8ecb81a 100644
---- a/linux/drivers/char/fusion/fusiondev.c
-+++ b/linux/drivers/char/fusion/fusiondev.c
-@@ -775,7 +775,7 @@ call_ioctl(FusionDev * dev, Fusionee * fusionee,
-                               printk( KERN_ERR "fusion: FUSION_CALL_EXECUTE3 with errorneous call (failed on previous ioctl call), "
-                                                "call id %d, flags 0x%08x, arg %d, length %u, serial %u,  %ld\n",
-                                       execute3.call_id, execute3.flags, execute3.call_arg, execute3.length, execute3.ret_length,
--                                      (execute3_bin - (FusionCallExecute3 *) arg) );
-+                                      (long int)(execute3_bin - (FusionCallExecute3 *) arg) );
-                               return -EIO;
-                          }
- 
diff --git a/package/linux-fusion/0003-Fix-fusion-Unknown-symbol-tasklist_lock-err-0.patch b/package/linux-fusion/0003-Fix-fusion-Unknown-symbol-tasklist_lock-err-0.patch
deleted file mode 100644
index b14ec9d90a..0000000000
--- a/package/linux-fusion/0003-Fix-fusion-Unknown-symbol-tasklist_lock-err-0.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 9fcd5003c0363af140a06aba94e62c9e1ea0381e Mon Sep 17 00:00:00 2001
-From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
-Date: Mon, 11 Jan 2016 16:45:30 +0100
-Subject: [PATCH] Fix fusion: Unknown symbol tasklist_lock (err 0)
-
-Commit 28f6569ab7d0 renamed TREE_PREEMPT_RCU to PREEMPT_RCU in 3.19
-As a result, the code incorrectly falls back to using tasklist_lock
-(which was made private in 2.6.18)
-
-Always use rcu_read_lock on modern kernels.
-
-Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
----
- linux/drivers/char/fusion/fusionee.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/linux/drivers/char/fusion/fusionee.c b/linux/drivers/char/fusion/fusionee.c
-index ef067f5bc831..70cd0a665f98 100644
---- a/linux/drivers/char/fusion/fusionee.c
-+++ b/linux/drivers/char/fusion/fusionee.c
-@@ -925,7 +925,7 @@ fusionee_kill(FusionDev * dev,
-                if (f != fusionee && (!target || target == f->id)) {
-                     struct task_struct *p;
- 
--#if defined(CONFIG_TREE_RCU) || defined(CONFIG_TREE_PREEMPT_RCU) || defined(CONFIG_TINY_RCU) || defined(rcu_read_lock)
-+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,0)
-                     rcu_read_lock();
- #else
-                     read_lock(&tasklist_lock);
-@@ -946,7 +946,7 @@ fusionee_kill(FusionDev * dev,
-                          }
-                     }
- 
--#if defined(CONFIG_TREE_RCU) || defined(CONFIG_TREE_PREEMPT_RCU) || defined(CONFIG_TINY_RCU) || defined(rcu_read_unlock)
-+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,0)
-                     rcu_read_unlock();
- #else
-                     read_unlock(&tasklist_lock);
diff --git a/package/linux-fusion/0004-Port-one-one_udp.c-to-Linux-4.1.patch b/package/linux-fusion/0004-Port-one-one_udp.c-to-Linux-4.1.patch
deleted file mode 100644
index 3ee4dac487..0000000000
--- a/package/linux-fusion/0004-Port-one-one_udp.c-to-Linux-4.1.patch
+++ /dev/null
@@ -1,118 +0,0 @@
-From be288b60278c78eccfd347aacf4d3dd8771215a9 Mon Sep 17 00:00:00 2001
-From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
-Date: Tue, 12 Jan 2016 14:01:42 +0100
-Subject: [PATCH] Port one/one_udp.c to Linux 4.1
-
-Kernel commit c0371da6047a replaced msg_iov and msg_iovlen with msg_iter
-in struct msghdr since 3.19
-
-one/one_udp.c: In function 'ksocket_send_iov':
-one/one_udp.c:186:9: error: 'struct msghdr' has no member named 'msg_iov'
-one/one_udp.c:187:9: error: 'struct msghdr' has no member named 'msg_iovlen'
-
-one/one_udp.c: In function 'ksocket_receive':
-one/one_udp.c:221:9: error: 'struct msghdr' has no member named 'msg_iov'
-one/one_udp.c:222:9: error: 'struct msghdr' has no member named 'msg_iovlen'
-
-The iov_iter interface
-https://lwn.net/Articles/625077/
-
-Kernel commit d8725c86aeba dropped the len parameter in sock_sendmsg
-since 4.1
-
-one/one_udp.c: In function 'ksocket_send_iov':
-one/one_udp.c:192:13: error: too many arguments to function 'sock_sendmsg'
-
-Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
-
-Kernel commit 2da62906b1e29 dropped the size parameter in sock_recvmsg
-since 4.7
-
-In function 'ksocket_receive'
-one/one_udp.c:235:13: error: too many arguments to function 'sock_recvmsg'
-
-Signed-off-by: Matthew Shyu <matthew.shyu@amlogic.com>
----
- one/one_udp.c | 34 +++++++++++++++++++---------------
- 1 file changed, 19 insertions(+), 15 deletions(-)
-
-diff --git a/one/one_udp.c b/one/one_udp.c
-index 26b9e6a..9b59529 100644
---- a/one/one_udp.c
-+++ b/one/one_udp.c
-@@ -161,7 +161,7 @@ ksocket_send_iov( struct socket      *sock,
-                   const struct iovec *iov,
-                   size_t              iov_count )
- {
--     struct msghdr msg;
-+     struct msghdr msg = { addr, sizeof *addr };
-      mm_segment_t oldfs;
-      int size = 0;
-      size_t len = 0;
-@@ -178,18 +178,20 @@ ksocket_send_iov( struct socket      *sock,
-      for (i=0; i<iov_count; i++)
-           len += iov[i].iov_len;
- 
--     msg.msg_flags = 0;
--     msg.msg_name = addr;
--     msg.msg_namelen  = sizeof(struct sockaddr_in);
--     msg.msg_control = NULL;
--     msg.msg_controllen = 0;
-+#if LINUX_VERSION_CODE < KERNEL_VERSION(3,19,0) // commit c0371da6047a
-      msg.msg_iov = (struct iovec*) iov;
-      msg.msg_iovlen = iov_count;
--     msg.msg_control = NULL;
-+#else
-+     iov_iter_init(&msg.msg_iter, WRITE, iov, iov_count, len);
-+#endif
- 
-      oldfs = get_fs();
-      set_fs(KERNEL_DS);
--     size = sock_sendmsg(sock,&msg,len);
-+#if LINUX_VERSION_CODE < KERNEL_VERSION(4,1,0) // commit d8725c86aeba
-+     size = sock_sendmsg(sock, &msg, len);
-+#else
-+     size = sock_sendmsg(sock, &msg);
-+#endif
-      set_fs(oldfs);
- 
-      return size;
-@@ -198,7 +200,7 @@ ksocket_send_iov( struct socket      *sock,
- static int
- ksocket_receive(struct socket* sock, struct sockaddr_in* addr, void *buf, int len)
- {
--     struct msghdr msg;
-+     struct msghdr msg = { addr, sizeof *addr };
-      struct iovec iov;
-      mm_segment_t oldfs;
-      int size = 0;
-@@ -213,18 +215,20 @@ ksocket_receive(struct socket* sock, struct sockaddr_in* addr, void *buf, int le
-      iov.iov_base = buf;
-      iov.iov_len = len;
- 
--     msg.msg_flags = 0;
--     msg.msg_name = addr;
--     msg.msg_namelen  = sizeof(struct sockaddr_in);
--     msg.msg_control = NULL;
--     msg.msg_controllen = 0;
-+#if LINUX_VERSION_CODE < KERNEL_VERSION(3,19,0) // commit c0371da6047a
-      msg.msg_iov = &iov;
-      msg.msg_iovlen = 1;
--     msg.msg_control = NULL;
-+#else
-+     iov_iter_init(&msg.msg_iter, READ, &iov, 1, len);
-+#endif
- 
-      oldfs = get_fs();
-      set_fs(KERNEL_DS);
-+#if LINUX_VERSION_CODE < KERNEL_VERSION(4,7,0) // commit 2da62906b1e29
-      size = sock_recvmsg(sock,&msg,len,msg.msg_flags);
-+#else
-+     size = sock_recvmsg(sock, &msg,msg.msg_flags);
-+#endif
-      set_fs(oldfs);
- 
-      return size;
--- 
-2.11.0
-
diff --git a/package/linux-fusion/40-fusion.rules b/package/linux-fusion/40-fusion.rules
deleted file mode 100644
index dc7fca19ca..0000000000
--- a/package/linux-fusion/40-fusion.rules
+++ /dev/null
@@ -1 +0,0 @@
-KERNEL=="fusion[0-9]*", NAME="fusion/%n", GROUP="video", MODE="0660"
diff --git a/package/linux-fusion/Config.in b/package/linux-fusion/Config.in
deleted file mode 100644
index 14b4f946af..0000000000
--- a/package/linux-fusion/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-comment "linux-fusion needs a Linux kernel to be built"
-	depends on !BR2_LINUX_KERNEL
-
-config BR2_PACKAGE_LINUX_FUSION
-	bool "linux-fusion communication layer for DirectFB multi"
-	depends on BR2_LINUX_KERNEL
-	select BR2_LINUX_NEEDS_MODULES # not using kernel-module infra
-	help
-	  DirectFB Communication Layer allowing multiple DirectFB
-	  applications to run concurrently
-
-	  https://github.com/deniskropp/linux-fusion
diff --git a/package/linux-fusion/linux-fusion.hash b/package/linux-fusion/linux-fusion.hash
deleted file mode 100644
index 8a90afe2a6..0000000000
--- a/package/linux-fusion/linux-fusion.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  c3c71af364ef774c70d3f6fbc32d14bc786d915df633d6fe733e1fde84ad6e99  linux-fusion-9.0.3.tar.xz
-sha256  51bc14bdef3a064383702e638515824986e5a746de236d46ee904ea15312a198  debian/copyright
diff --git a/package/linux-fusion/linux-fusion.mk b/package/linux-fusion/linux-fusion.mk
deleted file mode 100644
index f30a07aac0..0000000000
--- a/package/linux-fusion/linux-fusion.mk
+++ /dev/null
@@ -1,43 +0,0 @@
-################################################################################
-#
-# linux-fusion
-#
-################################################################################
-
-LINUX_FUSION_VERSION = 9.0.3
-LINUX_FUSION_SITE = http://directfb.org/downloads/Core/linux-fusion
-LINUX_FUSION_SOURCE = linux-fusion-$(LINUX_FUSION_VERSION).tar.xz
-LINUX_FUSION_INSTALL_STAGING = YES
-LINUX_FUSION_DEPENDENCIES = linux
-LINUX_FUSION_LICENSE = GPL-2.0+
-LINUX_FUSION_LICENSE_FILES = debian/copyright
-
-LINUX_FUSION_ETC_DIR = $(TARGET_DIR)/etc/udev/rules.d
-
-LINUX_FUSION_MAKE_OPTS = \
-	KERNEL_VERSION=$(LINUX_VERSION_PROBED) \
-	KERNEL_BUILD=$(LINUX_DIR) \
-	KERNEL_SOURCE=$(LINUX_DIR) \
-	SYSROOT=$(TARGET_DIR) \
-	ARCH=$(KERNEL_ARCH) \
-	CROSS_COMPILE=$(TARGET_CROSS) \
-	KERNEL_MODLIB=/lib/modules/$(LINUX_VERSION_PROBED)/kernel
-
-define LINUX_FUSION_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(LINUX_FUSION_MAKE_OPTS) -C $(@D)
-endef
-
-define LINUX_FUSION_INSTALL_STAGING_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(LINUX_FUSION_MAKE_OPTS) INSTALL_MOD_PATH=$(STAGING_DIR) -C $(@D) headers_install
-endef
-
-define LINUX_FUSION_INSTALL_TARGET_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) \
-		$(LINUX_FUSION_MAKE_OPTS) \
-		INSTALL_MOD_PATH=$(TARGET_DIR) \
-		-C $(@D) install
-	$(INSTALL) -D -m 644 package/linux-fusion/40-fusion.rules \
-		$(LINUX_FUSION_ETC_DIR)/40-fusion.rules
-endef
-
-$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
