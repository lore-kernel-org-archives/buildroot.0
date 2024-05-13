Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E22CC25B10
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 19:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD8718207C;
	Mon, 13 May 2024 19:29:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SPpHtIfGpfI8; Mon, 13 May 2024 19:29:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2EB68208D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2EB68208D;
	Mon, 13 May 2024 19:29:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5E92B1BF2CA
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 19:29:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 57ED48207C
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 19:29:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vc-vAPoQFIqv for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 19:29:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54A118206D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54A118206D
 for <buildroot@buildroot.org>; Mon, 13 May 2024 19:29:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3DCDC870EF; Mon, 13 May 2024 19:29:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 May 2024 21:28:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f147e3b16a41324a9097ff17b002fd3c445e0f4c
X-Git-Newrev: 9fcf0fd80180c6568c0516fa3b8a0d2cf5f1078e
X-Patchwork-Hint: ignore
Message-Id: <20240513192936.3DCDC870EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/basu: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=9fcf0fd80180c6568c0516fa3b8a0d2cf5f1078e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

basu is the sd-bus library, extracted from systemd.

Some projects rely on the sd-bus library for DBus support. However not
all systems have systemd or elogind installed. This library provides
just sd-bus (and the busctl utility).

Signed-off-by: Sergey Bobrenok <bobrofon@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 ...-Disable-stack-protection-for-Buildroot-p.patch | 39 ++++++++++++++++++++++
 ...c-Use-F_ADD_SEALS-definition-from-missing.patch | 34 +++++++++++++++++++
 package/basu/Config.in                             | 23 +++++++++++++
 package/basu/basu.hash                             |  4 +++
 package/basu/basu.mk                               | 28 ++++++++++++++++
 7 files changed, 130 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d653648718..ad03c26ea4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2835,6 +2835,7 @@ F:	package/systemd
 F:	support/scripts/pkg-stats
 
 N:	Sergey Bobrenok <bobrofon@gmail.com>
+F:	package/basu/
 F:	package/sdbus-cpp/
 
 N:	Sergey Matyukevich <geomatsi@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index c29b4a5101..768103e0c4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2103,6 +2103,7 @@ menu "Other"
 	source "package/armadillo/Config.in"
 	source "package/atf/Config.in"
 	source "package/avro-c/Config.in"
+	source "package/basu/Config.in"
 	source "package/bctoolbox/Config.in"
 	source "package/bdwgc/Config.in"
 	source "package/belr/Config.in"
diff --git a/package/basu/0001-meson.build-Disable-stack-protection-for-Buildroot-p.patch b/package/basu/0001-meson.build-Disable-stack-protection-for-Buildroot-p.patch
new file mode 100644
index 0000000000..34dd3b16b9
--- /dev/null
+++ b/package/basu/0001-meson.build-Disable-stack-protection-for-Buildroot-p.patch
@@ -0,0 +1,39 @@
+From 6133c87299bce32c13dcf1692842ea5f2890c5ad Mon Sep 17 00:00:00 2001
+From: Sergey Bobrenok <bobrofon@gmail.com>
+Date: Wed, 28 Feb 2024 16:29:17 +0300
+Subject: [PATCH] meson.build: Disable stack protection for Buildroot packaging
+
+In Buildroot, the SSP flags are passed via the wrapper, and only flags
+supported by the toolchain will be used. So the SSP flags can be
+safely removed from the build files.
+
+Fixes:
+  src/basic/libbasic.a.p/log.c.o: in function `write_to_console.isra.0':
+  log.c:(.text.write_to_console.isra.0+0x154): undefined reference to `__stack_chk_fail_local'
+
+Upstream: N/A [Buildroot specific]
+
+Signed-off-by: Sergey Bobrenok <bobrofon@gmail.com>
+---
+ meson.build | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 6f79707..51fd400 100644
+--- a/meson.build
++++ b/meson.build
+@@ -75,9 +75,6 @@ possible_cc_flags = [
+         '-fdiagnostics-show-option',
+         '-fno-strict-aliasing',
+         '-fvisibility=hidden',
+-        '-fstack-protector',
+-        '-fstack-protector-strong',
+-        '--param=ssp-buffer-size=4',
+ ]
+ 
+ # --as-needed and --no-undefined are provided by meson by default,
+
+base-commit: 684a41d68cfbb05e38aacb60a8548e21ddfbecdb
+-- 
+2.43.2
+
diff --git a/package/basu/0002-memfd-util.c-Use-F_ADD_SEALS-definition-from-missing.patch b/package/basu/0002-memfd-util.c-Use-F_ADD_SEALS-definition-from-missing.patch
new file mode 100644
index 0000000000..69e899279f
--- /dev/null
+++ b/package/basu/0002-memfd-util.c-Use-F_ADD_SEALS-definition-from-missing.patch
@@ -0,0 +1,34 @@
+From 8e4960e8b9d11d9be96e83b02bd3b08178ddce1b Mon Sep 17 00:00:00 2001
+From: Sergey Bobrenok <bobrofon@gmail.com>
+Date: Wed, 28 Feb 2024 20:42:19 +0300
+Subject: [PATCH basu] memfd-util.c: Use F_ADD_SEALS definition from missing.h
+
+uClibc and glibc (until version 2.27, 2018) implementations don't
+support F_ADD_SEALS and other F_SEAL_xxx flags.
+'missing.h' was removed from 'memfd-util.c' in 37dbb2fcb ("Remove
+useless includes").
+
+Upstream: https://lists.sr.ht/~emersion/public-inbox/patches/49899
+
+Signed-off-by: Sergey Bobrenok <bobrofon@gmail.com>
+---
+ src/basic/memfd-util.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/basic/memfd-util.c b/src/basic/memfd-util.c
+index 89893ba..7e535c6 100644
+--- a/src/basic/memfd-util.c
++++ b/src/basic/memfd-util.c
+@@ -7,6 +7,7 @@
+ 
+ #include "alloc-util.h"
+ #include "memfd-util.h"
++#include "missing.h"
+ 
+ int memfd_set_sealed(int fd) {
+ #if defined(__FreeBSD__) && __FreeBSD__ < 13
+
+base-commit: 684a41d68cfbb05e38aacb60a8548e21ddfbecdb
+-- 
+2.44.0
+
diff --git a/package/basu/Config.in b/package/basu/Config.in
new file mode 100644
index 0000000000..5875aa7775
--- /dev/null
+++ b/package/basu/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_BASU
+	bool "basu"
+	depends on BR2_USE_MMU # dbus
+	depends on BR2_USE_WCHAR # uchar.h
+	depends on BR2_ENABLE_LOCALE # locale_t
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # __sync_add_and_fetch
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # F_ADD_SEALS
+	select BR2_PACKAGE_DBUS if !BR2_PACKAGE_DBUS_BROKER # runtime
+	help
+	  basu is the sd-bus library, extracted from systemd.
+
+	  Some projects rely on the sd-bus library for DBus support.
+	  However not all systems have systemd or elogind installed.
+	  This library provides just sd-bus (and the busctl utility).
+
+	  https://git.sr.ht/~emersion/basu
+
+comment "basu needs a toolchain w/ wchar, locale, threads, headers >= 3.17"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_USE_WCHAR || !BR2_ENABLE_LOCALE || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
diff --git a/package/basu/basu.hash b/package/basu/basu.hash
new file mode 100644
index 0000000000..f369286337
--- /dev/null
+++ b/package/basu/basu.hash
@@ -0,0 +1,4 @@
+# From https://git.sr.ht/~emersion/basu/refs/v0.2.1
+sha256  d9b373a9fcb5d5eb5f6c1c56355f76edb7f2f52bc744570e80604e83455a19bd  basu-0.2.1.tar.gz
+# Locally computed:
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
diff --git a/package/basu/basu.mk b/package/basu/basu.mk
new file mode 100644
index 0000000000..7bd1923646
--- /dev/null
+++ b/package/basu/basu.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# basu
+#
+################################################################################
+
+BASU_VERSION = 0.2.1
+BASU_SITE = https://git.sr.ht/~emersion/basu/refs/download/v$(BASU_VERSION)
+BASU_INSTALL_STAGING = YES
+BASU_LICENSE = LGPL-2.1+
+BASU_LICENSE_FILES = LICENSE.LGPL2.1
+BASU_DEPENDENCIES = host-gperf
+
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+BASU_DEPENDENCIES += libcap
+BASU_CONF_OPTS += -Dlibcap=enabled
+else
+BASU_CONF_OPTS += -Dlibcap=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_AUDIT),y)
+BASU_DEPENDENCIES += audit
+BASU_CONF_OPTS += -Daudit=enabled
+else
+BASU_CONF_OPTS += -Daudit=disabled
+endif
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
