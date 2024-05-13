Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2101C25B10
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 20:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36DEC40596;
	Mon, 13 May 2024 20:49:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QBHX4PFaq7Tn; Mon, 13 May 2024 20:49:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A81840772
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A81840772;
	Mon, 13 May 2024 20:49:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1CCBD1BF2C0
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 20:49:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 088434054B
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 20:49:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I5uF5n8oY-Cj for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 20:49:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A35EB40526
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A35EB40526
 for <buildroot@buildroot.org>; Mon, 13 May 2024 20:49:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8CE9187174; Mon, 13 May 2024 20:49:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 May 2024 22:47:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 36e417efc85141001df13a1e50f73dae682da4f3
X-Git-Newrev: 103a55028c75dace312470ba05a197886c6b6100
X-Patchwork-Hint: ignore
Message-Id: <20240513204901.8CE9187174@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: update to 9.0.0
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
Content-Type: multipart/mixed; boundary="===============3614656424857871513=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3614656424857871513==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=103a55028c75dace312470ba05a197886c6b6100
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See here the changes:
https://wiki.qemu.org/ChangeLog/9.0

Disable plugins because of compile errors.
Patches 0002/0003 are Upstream.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 ...u-seccomp.c-add-missing-header-for-CLONE_.patch | 42 ----------------------
 ...stall-trace-events-file-only-if-necessary.patch | 30 ----------------
 package/qemu/qemu.hash                             |  2 +-
 package/qemu/qemu.mk                               |  4 ++-
 5 files changed, 4 insertions(+), 75 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index f145e0bd11..7057f91925 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1340,7 +1340,6 @@ package/python3/0023-Add-an-option-to-disable-uuid-module.patch lib_patch.Upstre
 package/python3/0024-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch lib_patch.Upstream
 package/python3/0025-Add-an-option-to-disable-the-berkeleydb-module.patch lib_patch.Upstream
 package/python3/0026-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch lib_patch.Upstream
-package/qemu/0002-softmmu-qemu-seccomp.c-add-missing-header-for-CLONE_.patch lib_patch.Upstream
 package/qextserialport/0001-Create-a-main-include-file-QExtSerialPort.patch lib_patch.Upstream
 package/qextserialport/0002-Tell-qmake-to-add-a-pkgconfig-file-to-ease-usage-wit.patch lib_patch.Upstream
 package/qt5/qt5base/0001-qtbase-Fix-build-error-when-using-EGL.patch lib_patch.Upstream
diff --git a/package/qemu/0002-softmmu-qemu-seccomp.c-add-missing-header-for-CLONE_.patch b/package/qemu/0002-softmmu-qemu-seccomp.c-add-missing-header-for-CLONE_.patch
deleted file mode 100644
index 91506b14d9..0000000000
--- a/package/qemu/0002-softmmu-qemu-seccomp.c-add-missing-header-for-CLONE_.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From df07d3754bdf15e0efac244cfee290c9bac86352 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Mon, 2 May 2022 23:17:46 +0200
-Subject: [PATCH] softmmu/qemu-seccomp.c: add missing header for CLONE_NEWGROUP
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-With seccomp support enabled Qemu 7.0.0 fail to build with the
-following error:
-
-../softmmu/qemu-seccomp.c:116:19: error: ‘CLONE_NEWCGROUP’ undeclared here (not in a function)
-  116 | FORBID_CLONE_FLAG(CLONE_NEWCGROUP);
-      |                   ^~~~~~~~~~~~~~~
-../softmmu/qemu-seccomp.c:73:18: note: in definition of macro ‘FORBID_CLONE_FLAG’
-   73 |       .datum_a = flag, .datum_b = flag } }
-      |                  ^~~~
-
-CLONE_NEWCGROUP has been added in Qemu 7.0.0 by commit [1].
-
-[1] https://git.qemu.org/?p=qemu.git;a=commitdiff;h=5a2f693f07a1e93ada5277b2fb1530b2698be0fa
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- softmmu/qemu-seccomp.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/softmmu/qemu-seccomp.c b/softmmu/qemu-seccomp.c
-index deaf8a4ef5..96c83e121f 100644
---- a/softmmu/qemu-seccomp.c
-+++ b/softmmu/qemu-seccomp.c
-@@ -21,6 +21,7 @@
- #include <sys/prctl.h>
- #include <seccomp.h>
- #include "sysemu/seccomp.h"
-+#include <linux/sched.h>
- #include <linux/seccomp.h>
- 
- /* For some architectures (notably ARM) cacheflush is not supported until
--- 
-2.35.1
-
diff --git a/package/qemu/0003-tracing-install-trace-events-file-only-if-necessary.patch b/package/qemu/0003-tracing-install-trace-events-file-only-if-necessary.patch
deleted file mode 100644
index 36bdaa4978..0000000000
--- a/package/qemu/0003-tracing-install-trace-events-file-only-if-necessary.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 5c43da1e4983cc3c209b325a5228b6149e0a0ccf Mon Sep 17 00:00:00 2001
-From: Carlos Santos <casantos@redhat.com>
-Date: Fri, 24 Mar 2023 21:40:22 -0300
-Subject: [PATCH] tracing: install trace events file only if necessary
-
-It is not useful when configuring with --enable-trace-backends=nop.
-
-Upstream: https://patchwork.kernel.org/project/qemu-devel/patch/20230408010410.281263-1-casantos@redhat.com/
-Signed-off-by: Carlos Santos <casantos@redhat.com>
-Signed-off-by: Carlos Santos <unixmania@gmail.com>
----
- trace/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/trace/meson.build b/trace/meson.build
-index 8e80be895c..30b1d942eb 100644
---- a/trace/meson.build
-+++ b/trace/meson.build
-@@ -64,7 +64,7 @@ trace_events_all = custom_target('trace-events-all',
-                                  input: trace_events_files,
-                                  command: [ 'cat', '@INPUT@' ],
-                                  capture: true,
--                                 install: true,
-+                                 install: get_option('trace_backends') != [ 'nop' ],
-                                  install_dir: qemu_datadir)
- 
- if 'ust' in get_option('trace_backends')
--- 
-2.31.1
-
diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index 61e51a923f..2c905d2e77 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,4 +1,4 @@
 # Locally computed, tarball verified with GPG signature
-sha256  37ce2ef5e500fb752f681117c68b45118303ea49a7e26bd54080ced54fab7def  qemu-8.1.1.tar.xz
+sha256  32708ac66c30d8c892633ea968c771c1c76d597d70ddead21a0d22ccf386da69  qemu-9.0.0.tar.xz
 sha256  6f04ae8364d0079a192b14635f4b1da294ce18724c034c39a6a41d1b09df6100  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index ef406dc8e9..8de803dd25 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, check whether the list of supported targets
 # needs to be updated.
-QEMU_VERSION = 8.1.1
+QEMU_VERSION = 9.0.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = https://download.qemu.org
 QEMU_SELINUX_MODULES = qemu virt
@@ -320,6 +320,7 @@ define QEMU_CONFIGURE_CMDS
 			--disable-opengl \
 			--disable-oss \
 			--disable-pa \
+			--disable-plugins \
 			--disable-rbd \
 			--disable-sanitizers \
 			--disable-selinux \
@@ -504,6 +505,7 @@ define HOST_QEMU_CONFIGURE_CMDS
 		--disable-vde \
 		--disable-vhost-user-blk-server \
 		--disable-vnc-jpeg \
+		--disable-plugins \
 		--disable-png \
 		--disable-vnc-sasl \
 		--enable-slirp \

--===============3614656424857871513==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3614656424857871513==--
