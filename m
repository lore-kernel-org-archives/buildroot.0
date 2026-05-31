Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76390CD6E52
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 11:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DA8A84CBA;
	Sun, 31 May 2026 11:36:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R8nHAYgvskYU; Sun, 31 May 2026 11:36:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABC4385061
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780227385;
	bh=9b4m56tNbrp5+4kL+UMLX1ngJJWyc5faJViKPuZEH08=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=e2Z/TQfpf1VP9fWouHECw/skseOk612gXCEqgz5KJAWbXlNwhQuANAG8lVaUH19wF
	 4mjHG1F0fCLtUYTvt8qEeT+3LkUnmsGcbmnbHFGUgmdesyrNb3kCFT8EjivxDeesJ4
	 fGu5PcZMWtd4Y06rZcyLpvixmesb8uLqLgzIcHBYGCsJMm15Ya49Gvf4LK8iewhdKR
	 JUhIRIKHpRtw98MItnqekBLGjKJWoxptzrXPvAK/IbgzAbNdfPO0f1XOIkt3igmcDv
	 8uS+vz1uJKUydKjCepTtKPiLbbyjwV6bPEAC6zivFHySHr3B/PRti5/A8yLBmExk6F
	 ZEuQeIBWoYMWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABC4385061;
	Sun, 31 May 2026 11:36:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C24FF4
 for <buildroot@buildroot.org>; Sun, 31 May 2026 11:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 717AB85061
 for <buildroot@buildroot.org>; Sun, 31 May 2026 11:36:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bx8zSUo9FUM7 for <buildroot@buildroot.org>;
 Sun, 31 May 2026 11:36:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DCDA84CBA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2DCDA84CBA
 for <buildroot@buildroot.org>; Sun, 31 May 2026 11:36:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 99E3B876C1; Sun, 31 May 2026 11:36:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 31 May 2026 13:12:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 160ef0b27a824fbd8f44a9514d5ad7762c3be560
X-Git-Newrev: 44b7435c7a2e11ac2c52398c66cc3f5ae6ef854a
X-Patchwork-Hint: ignore
Message-Id: <20260531113607.99E3B876C1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xen: bump to v4.19.5
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
Content-Type: multipart/mixed; boundary="===============8399298160130572172=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8399298160130572172==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/44b7435c7a2e11ac2c52398c66cc3f5ae6ef854a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Remove some patches that have been applied upstream, or adapt them
for upstream files that have been moved around.

Patch 0001 is no longer needed: a similar upstream patch is fixing this
issue. See [1]. The .checkpackageignore entry is also removed.

The COPYING license file was updated in [2]. This commit updates this
license file hash. Since the GPL-2.0 license text was moved to the
package file LICENSES/GPL-2.0, this commit also adds this new file in
XEN_LICENSE_FILES and its hash.

This commit also adds --disable-werror in XEN_CONF_OPTS. The code is
generating warnings with newer gcc version. This makes the compilation
works in all configurations.

This commit adds a comment in hash file about pgp signature check.

This fixes many vulnerabilities:
- CVE-2021-28687
- CVE-2021-28690
- CVE-2021-28693
- CVE-2021-28697
- CVE-2021-28702
- CVE-2021-28704
- CVE-2021-28707
- CVE-2021-28708
- CVE-2022-26357
- CVE-2022-33746
- CVE-2022-42331
- CVE-2022-42333
- CVE-2022-42334
- CVE-2023-34321
- CVE-2023-34322
- CVE-2023-34323
- CVE-2023-46837
- CVE-2024-31142
- CVE-2025-27466
- CVE-2025-58142
- CVE-2025-58143
- CVE-2025-58144
- CVE-2025-58145

Note: xen version 4.19.5 is not the latest at the time of this commit.
It is an intermediate bump because: 1. the xen build has significantly
changed after this 4.19.5 version, so this intermediate step will help
future updates; 2. this intermediate version includes many CVE
security fixes; and 3. it also reduces the number of package patches.

[1] https://xenbits.xen.org/gitweb/?p=qemu-xen.git;a=commitdiff;h=03556ea920b23c466ce7c1283199033de33ee671
[2] https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=7b068ac89024308862c4f448dd248645d2b8e882

Co-authored-by: Vincent Stehlé <vincent.stehle@arm.com>
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Tested-by: Julien Olivain <ju.o@free.fr>
Reviewed-by: Julien Olivain <ju.o@free.fr>
[Julien:
 - reorder XEN_DEPENDENCIES alphabetically
 - fix COPYING license hash
 - add LICENSES/GPL-2.0 in XEN_LICENSE_FILES
 - add commit log comment about --disable-werror
 - add commit log note about the intermediate version
 - drop patch 0001
 - renumber patches
 - remove all .checkpackageignore entries
 - add "Upstream:" tag in all remaining patches
 - add pgp signature check comment in hash file
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |   4 -
 ...include-linux-limits.h-for-XATTR_SIZE_MAX.patch |  43 ----
 package/xen/0001-No-trace-backend.patch            |  36 +++
 ... 0002-Arm-platforms-fix-build-with-gcc15.patch} |  16 +-
 .../xen/0002-Fix-build-with-64-bits-time_t.patch   |  95 --------
 package/xen/0003-Update-linker-flags.patch         |  81 +++++++
 .../0003-libs-light-fix-tv_sec-printf-format.patch |  63 -----
 ...0004-libs-light-fix-tv_sec-fprintf-format.patch |  30 ---
 ...tools-drop-bogus-and-obsolete-ptyfuncs.m4.patch | 253 ---------------------
 ...ust-__irq_to_desc-to-fix-build-with-gcc14.patch |  62 -----
 ...-avoid-.rodata-to-be-marked-as-executable.patch |  58 -----
 ...sing-solaris-syntax-for-.section-directiv.patch |  73 ------
 package/xen/Config.in                              |   1 +
 package/xen/xen.hash                               |   9 +-
 package/xen/xen.mk                                 |   9 +-
 15 files changed, 137 insertions(+), 696 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 91443abd73..7e813c370d 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -978,10 +978,6 @@ package/x11r7/xdriver_xf86-video-mach64/0001-cross-compile.patch lib_patch.Upstr
 package/x11r7/xdriver_xf86-video-tdfx/0001-cross.patch lib_patch.Upstream
 package/x11r7/xserver_xorg-server/0001-include-misc.h-fix-uClibc-build.patch lib_patch.Upstream
 package/x11r7/xserver_xorg-server/S40xorg Shellcheck lib_sysv.Variables
-package/xen/0001-9pfs-include-linux-limits.h-for-XATTR_SIZE_MAX.patch lib_patch.Upstream
-package/xen/0002-Fix-build-with-64-bits-time_t.patch lib_patch.Upstream
-package/xen/0003-libs-light-fix-tv_sec-printf-format.patch lib_patch.Upstream
-package/xen/0004-libs-light-fix-tv_sec-fprintf-format.patch lib_patch.Upstream
 package/xl2tp/xl2tpd lib_shellscript.TrailingSpace
 package/yajl/0001-Let-the-shared-and-the-static-library-have-the-same-.patch lib_patch.Upstream
 package/yajl/0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch lib_patch.Upstream
diff --git a/package/xen/0001-9pfs-include-linux-limits.h-for-XATTR_SIZE_MAX.patch b/package/xen/0001-9pfs-include-linux-limits.h-for-XATTR_SIZE_MAX.patch
deleted file mode 100644
index b681b941f7..0000000000
--- a/package/xen/0001-9pfs-include-linux-limits.h-for-XATTR_SIZE_MAX.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-Message-Id: <07010a2ad79559c412949f0005dbe3cb03d8416e.1498504812.git.ps@pks.im>
-From: Patrick Steinhardt <ps@pks.im>
-Date: Mon, 26 Jun 2017 21:20:45 +0200
-Subject: [PATCH] 9pfs: include <linux/limits.h> for XATTR_SIZE_MAX
-
-The function `v9fs_xattrcreate` makes use of the define `XATTR_SIZE_MAX`
-to reject attempts of creating xattrs with an invalid size, which is
-defined in <linux/limits.h>. On glibc-based systems, this header is
-indirectly included via <limits.h>, <bits/posix1_lim.h>,
-<bitts/local_lim.h>, but on other platforms this is not guaranteed due
-to not being part of the POSIX standard. One examples are systems based
-on musl libc, which do not include the <linux/limits.h> indirectly,
-which leads to `XATTR_SIZE_MAX` being undefined.
-
-Fix this error by directly include <linux/limits.h>. As the 9P fs code
-is being Linux-based either way, we can simply do so without breaking
-other platforms. This enables building 9pfs on musl-based systems.
-
-Signed-off-by: Patrick Steinhardt <ps@pks.im>
-[ Changes by AF
- - Apply to the QEMU tree inside of Xen
-]
-Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
----
-Upstream Status: Pending review and acceptance
-
- tools/qemu-xen/hw/9pfs/9p.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tools/qemu-xen/hw/9pfs/9p.c b/tools/qemu-xen/hw/9pfs/9p.c
-index 96d2683348..48cd558e96 100644
---- a/tools/qemu-xen/hw/9pfs/9p.c
-+++ b/tools/qemu-xen/hw/9pfs/9p.c
-@@ -13,6 +13,7 @@
- 
- #include "qemu/osdep.h"
- #include <glib/gprintf.h>
-+#include <linux/limits.h>
- #include "hw/virtio/virtio.h"
- #include "qapi/error.h"
- #include "qemu/error-report.h"
--- 
-2.13.2
diff --git a/package/xen/0001-No-trace-backend.patch b/package/xen/0001-No-trace-backend.patch
new file mode 100644
index 0000000000..dd9924645e
--- /dev/null
+++ b/package/xen/0001-No-trace-backend.patch
@@ -0,0 +1,36 @@
+From b3bca9b696b64cced62f6fe6d8b40058c9779409 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
+Date: Mon, 16 Jun 2025 17:16:39 +0200
+Subject: [PATCH] No trace backend
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream: Buildroot specific. This is a temporary patch for an intermediate bump.
+Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
+---
+ tools/Makefile | 8 +-------
+ 1 file changed, 1 insertion(+), 7 deletions(-)
+
+diff --git a/tools/Makefile b/tools/Makefile
+index 7d172117..a9a3196e 100644
+--- a/tools/Makefile
++++ b/tools/Makefile
+@@ -217,13 +217,7 @@ subdir-all-qemu-xen-dir: qemu-xen-dir-find
+ 	fi; \
+ 	mkdir -p qemu-xen-build; \
+ 	cd qemu-xen-build; \
+-	if $$source/scripts/tracetool.py --check-backend --backend log ; then \
+-		enable_trace_backend="--enable-trace-backends=log"; \
+-	elif $$source/scripts/tracetool.py --check-backend --backend stderr ; then \
+-		enable_trace_backend='--enable-trace-backends=stderr'; \
+-	else \
+-		enable_trace_backend='' ; \
+-	fi ; \
++	enable_trace_backend='' ; \
+ 	if [ "$(CONFIG_9PFS)" = "y" ]; then \
+ 		virtfs='--enable-virtfs' ; \
+ 	elif [ "$(CONFIG_9PFS)" = "n" ]; then \
+-- 
+2.51.0
+
diff --git a/package/xen/0009-Arm-platforms-fix-build-with-gcc15.patch b/package/xen/0002-Arm-platforms-fix-build-with-gcc15.patch
similarity index 72%
rename from package/xen/0009-Arm-platforms-fix-build-with-gcc15.patch
rename to package/xen/0002-Arm-platforms-fix-build-with-gcc15.patch
index fb95ca9fa5..1b48026276 100644
--- a/package/xen/0009-Arm-platforms-fix-build-with-gcc15.patch
+++ b/package/xen/0002-Arm-platforms-fix-build-with-gcc15.patch
@@ -15,14 +15,14 @@ Acked-by: Michal Orzel <michal.orzel@amd.com>
 Upstream: https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=39f95089e2ba15c5438ce904c0cbbd8d79d3e6e7
 Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
 ---
- xen/include/asm-arm/platforms/midway.h | 2 +-
- xen/include/asm-arm/platforms/omap5.h  | 2 +-
+ xen/arch/arm/include/asm/platforms/midway.h | 2 +-
+ xen/arch/arm/include/asm/platforms/omap5.h  | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/xen/include/asm-arm/platforms/midway.h b/xen/include/asm-arm/platforms/midway.h
+diff --git a/xen/arch/arm/include/asm/platforms/midway.h b/xen/arch/arm/include/asm/platforms/midway.h
 index 099e435..6914393 100644
---- a/xen/include/asm-arm/platforms/midway.h
-+++ b/xen/include/asm-arm/platforms/midway.h
+--- a/xen/arch/arm/include/asm/platforms/midway.h
++++ b/xen/arch/arm/include/asm/platforms/midway.h
 @@ -1,5 +1,5 @@
  #ifndef __ASM_ARM_PLATFORMS_MIDWAY_H
 -#define __ASM_ASM_PLATFORMS_MIDWAY_H
@@ -30,10 +30,10 @@ index 099e435..6914393 100644
  
  /* addresses of SREG registers for resetting the SoC */
  #define MW_SREG_PWR_REQ             0xfff3cf00
-diff --git a/xen/include/asm-arm/platforms/omap5.h b/xen/include/asm-arm/platforms/omap5.h
+diff --git a/xen/arch/arm/include/asm/platforms/omap5.h b/xen/arch/arm/include/asm/platforms/omap5.h
 index c559c84..8867b45 100644
---- a/xen/include/asm-arm/platforms/omap5.h
-+++ b/xen/include/asm-arm/platforms/omap5.h
+--- a/xen/arch/arm/include/asm/platforms/omap5.h
++++ b/xen/arch/arm/include/asm/platforms/omap5.h
 @@ -1,5 +1,5 @@
  #ifndef __ASM_ARM_PLATFORMS_OMAP5_H
 -#define __ASM_ASM_PLATFORMS_OMAP5_H
diff --git a/package/xen/0002-Fix-build-with-64-bits-time_t.patch b/package/xen/0002-Fix-build-with-64-bits-time_t.patch
deleted file mode 100644
index 8559aece2d..0000000000
--- a/package/xen/0002-Fix-build-with-64-bits-time_t.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-From f7a6df5f5bf3acc219352a1b25573ae2082d7e42 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 3 Dec 2020 20:58:19 +0100
-Subject: [PATCH] Fix build with 64 bits time_t
-
-time element is deprecated on new input_event structure in kernel's
-input.h [1]
-
-This will avoid the following build failure:
-
-hw/input/virtio-input-host.c: In function 'virtio_input_host_handle_status':
-hw/input/virtio-input-host.c:198:28: error: 'struct input_event' has no member named 'time'
-  198 |     if (gettimeofday(&evdev.time, NULL)) {
-      |                            ^
-
-Fixes:
- - http://autobuild.buildroot.org/results/a538167e288c14208d557cd45446df86d3d599d5
- - http://autobuild.buildroot.org/results/efd4474fb4b6c0ce0ab3838ce130429c51e43bbb
-
-[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=152194fe9c3f
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Message-Id: <20201203195819.583626-1-fontaine.fabrice@gmail.com>
-Fixes: https://gitlab.com/qemu-project/qemu/-/issues/246
-Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
-Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
-
-[Retrieved (and updated for qemu-xen) from:
-https://github.com/qemu/qemu/commit/f7a6df5f5bf3acc219352a1b25573ae2082d7e42]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- contrib/vhost-user-input/main.c | 8 ++++++--
- hw/input/virtio-input-host.c    | 5 ++++-
- 2 files changed, 10 insertions(+), 3 deletions(-)
-
-diff --git a/tools/qemu-xen/contrib/vhost-user-input/main.c b/tools/qemu-xen/contrib/vhost-user-input/main.c
-index c15d18c33f0c..081230da548a 100644
---- a/tools/qemu-xen/contrib/vhost-user-input/main.c
-+++ b/tools/qemu-xen/contrib/vhost-user-input/main.c
-@@ -6,13 +6,14 @@
- #include "qemu/osdep.h"
- 
- #include <glib.h>
--#include <linux/input.h>
-+#include <sys/ioctl.h>
- 
- #include "qemu/iov.h"
- #include "qemu/bswap.h"
- #include "qemu/sockets.h"
- #include "contrib/libvhost-user/libvhost-user.h"
- #include "contrib/libvhost-user/libvhost-user-glib.h"
-+#include "standard-headers/linux/input.h"
- #include "standard-headers/linux/virtio_input.h"
- #include "qapi/error.h"
- 
-@@ -113,13 +114,16 @@ vi_evdev_watch(VuDev *dev, int condition, void *data)
- static void vi_handle_status(VuInput *vi, virtio_input_event *event)
- {
-     struct input_event evdev;
-+    struct timeval tval;
-     int rc;
- 
--    if (gettimeofday(&evdev.time, NULL)) {
-+    if (gettimeofday(&tval, NULL)) {
-         perror("vi_handle_status: gettimeofday");
-         return;
-     }
- 
-+    evdev.input_event_sec = tval.tv_sec;
-+    evdev.input_event_usec = tval.tv_usec;
-     evdev.type = le16toh(event->type);
-     evdev.code = le16toh(event->code);
-     evdev.value = le32toh(event->value);
-diff --git a/tools/qemu-xen/hw/input/virtio-input-host.c b/tools/qemu-xen/hw/input/virtio-input-host.c
-index 85daf73f1a80..137efba57b0f 100644
---- a/tools/qemu-xen/hw/input/virtio-input-host.c
-+++ b/tools/qemu-xen/hw/input/virtio-input-host.c
-@@ -193,13 +193,16 @@ static void virtio_input_host_handle_status(VirtIOInput *vinput,
- {
-     VirtIOInputHost *vih = VIRTIO_INPUT_HOST(vinput);
-     struct input_event evdev;
-+    struct timeval tval;
-     int rc;
- 
--    if (gettimeofday(&evdev.time, NULL)) {
-+    if (gettimeofday(&tval, NULL)) {
-         perror("virtio_input_host_handle_status: gettimeofday");
-         return;
-     }
- 
-+    evdev.input_event_sec = tval.tv_sec;
-+    evdev.input_event_usec = tval.tv_usec;
-     evdev.type = le16_to_cpu(event->type);
-     evdev.code = le16_to_cpu(event->code);
-     evdev.value = le32_to_cpu(event->value);
diff --git a/package/xen/0003-Update-linker-flags.patch b/package/xen/0003-Update-linker-flags.patch
new file mode 100644
index 0000000000..7e91c6d2e5
--- /dev/null
+++ b/package/xen/0003-Update-linker-flags.patch
@@ -0,0 +1,81 @@
+From 2ba2eef5b11d81b801265ae92df91571c19cc8a3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
+Date: Tue, 30 Sep 2025 11:39:54 +0200
+Subject: [PATCH] Update linker flags
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream: Buildroot specific. This is a temporary patch for an intermediate bump.
+Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
+---
+ tools/Makefile                             | 29 +++++++++++++++++++++-
+ tools/qemu-xen/include/hw/xen/xen_native.h |  2 +-
+ 2 files changed, 29 insertions(+), 2 deletions(-)
+
+diff --git a/tools/Makefile b/tools/Makefile
+index a9a3196e..5d289651 100644
+--- a/tools/Makefile
++++ b/tools/Makefile
+@@ -37,8 +37,12 @@ SUBDIRS-$(CONFIG_X86) += xenpaging
+ SUBDIRS-$(CONFIG_X86) += debugger
+ SUBDIRS-$(CONFIG_TESTS) += tests
+ 
++# These don't cross-compile
++ifeq ($(XEN_COMPILE_ARCH),$(XEN_TARGET_ARCH))
+ SUBDIRS-y += python
+ SUBDIRS-$(CONFIG_PYGRUB) += pygrub
++endif
++
+ SUBDIRS-$(OCAML_TOOLS) += ocaml
+ 
+ ifeq ($(CONFIG_RUMP),y)
+@@ -236,8 +240,31 @@ subdir-all-qemu-xen-dir: qemu-xen-dir-find
+ 		-DXC_WANT_COMPAT_GNTTAB_API=1 \
+ 		-DXC_WANT_COMPAT_MAP_FOREIGN_API=1 \
+ 		-DXC_WANT_COMPAT_DEVICEMODEL_API=1 \
++		-I$(XEN_ROOT)/tools/include \
+ 		$(EXTRA_CFLAGS_QEMU_XEN)" \
+-		--extra-ldflags="$(QEMU_UPSTREAM_RPATH)" \
++		--extra-ldflags=" \
++		-L$(XEN_ROOT)/tools/libs/call \
++		-L$(XEN_ROOT)/tools/libs/ctrl \
++		-L$(XEN_ROOT)/tools/libs/devicemodel \
++		-L$(XEN_ROOT)/tools/libs/evtchn \
++		-L$(XEN_ROOT)/tools/libs/foreignmemory \
++		-L$(XEN_ROOT)/tools/libs/gnttab \
++		-L$(XEN_ROOT)/tools/libs/guest \
++		-L$(XEN_ROOT)/tools/libs/store \
++		-L$(XEN_ROOT)/tools/libs/toolcore \
++		-L$(XEN_ROOT)/tools/libs/toollog \
++		-L$(XEN_ROOT)/tools/xenstore \
++		-Wl,-rpath-link=$(XEN_ROOT)/tools/libs/call \
++		-Wl,-rpath-link=$(XEN_ROOT)/tools/libs/ctrl \
++		-Wl,-rpath-link=$(XEN_ROOT)/tools/libs/devicemodel \
++		-Wl,-rpath-link=$(XEN_ROOT)/tools/libs/evtchn \
++		-Wl,-rpath-link=$(XEN_ROOT)/tools/libs/foreignmemory \
++		-Wl,-rpath-link=$(XEN_ROOT)/tools/libs/gnttab \
++		-Wl,-rpath-link=$(XEN_ROOT)/tools/libs/guest \
++		-Wl,-rpath-link=$(XEN_ROOT)/tools/libs/store \
++		-Wl,-rpath-link=$(XEN_ROOT)/tools/libs/toolcore \
++		-Wl,-rpath-link=$(XEN_ROOT)/tools/libs/toollog \
++		$(QEMU_UPSTREAM_RPATH)" \
+ 		--bindir=$(LIBEXEC_BIN) \
+ 		--datadir=$(SHAREDIR)/qemu-xen \
+ 		--localstatedir=$(localstatedir) \
+diff --git a/tools/qemu-xen/include/hw/xen/xen_native.h b/tools/qemu-xen/include/hw/xen/xen_native.h
+index 6bcc83ba..2590904e 100644
+--- a/tools/qemu-xen/include/hw/xen/xen_native.h
++++ b/tools/qemu-xen/include/hw/xen/xen_native.h
+@@ -2,7 +2,7 @@
+ #define QEMU_HW_XEN_NATIVE_H
+ 
+ #ifdef __XEN_INTERFACE_VERSION__
+-#error In Xen native files, include xen_native.h before other Xen headers
++#warning In Xen native files, include xen_native.h before other Xen headers
+ #endif
+ 
+ /*
+-- 
+2.51.0
+
diff --git a/package/xen/0003-libs-light-fix-tv_sec-printf-format.patch b/package/xen/0003-libs-light-fix-tv_sec-printf-format.patch
deleted file mode 100644
index fffc8d7307..0000000000
--- a/package/xen/0003-libs-light-fix-tv_sec-printf-format.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From a8ac01aa3e3ea5e6a9a1620aa8fa7e9da3458120 Mon Sep 17 00:00:00 2001
-From: Manuel Bouyer <bouyer@netbsd.org>
-Date: Tue, 26 Jan 2021 23:47:55 +0100
-Subject: [PATCH] libs/light: fix tv_sec printf format
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Don't assume tv_sec is a unsigned long, it is 64 bits on NetBSD 32 bits.
-Use %jd and cast to (intmax_t) instead
-
-Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
-Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
-[Retrieved (and backported) from:
-https://gitlab.com/xen-project/xen/-/commit/a8ac01aa3e3ea5e6a9a1620aa8fa7e9da3458120]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- tools/libs/light/libxl_create.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_create.c
-index 8616113e72..9848d65f36 100644
---- a/tools/libxl/libxl_create.c
-+++ b/tools/libxl/libxl_create.c
-@@ -496,7 +496,7 @@ int libxl__domain_build(libxl__gc *gc,
-         vments[2] = "image/ostype";
-         vments[3] = "hvm";
-         vments[4] = "start_time";
--        vments[5] = GCSPRINTF("%lu.%02d", start_time.tv_sec,(int)start_time.tv_usec/10000);
-+        vments[5] = GCSPRINTF("%jd.%02d", (intmax_t)start_time.tv_sec,(int)start_time.tv_usec/10000);
- 
-         localents = libxl__calloc(gc, 13, sizeof(char *));
-         i = 0;
-@@ -535,7 +535,7 @@ int libxl__domain_build(libxl__gc *gc,
-         vments[i++] = "image/kernel";
-         vments[i++] = (char *) state->pv_kernel.path;
-         vments[i++] = "start_time";
--        vments[i++] = GCSPRINTF("%lu.%02d", start_time.tv_sec,(int)start_time.tv_usec/10000);
-+        vments[i++] = GCSPRINTF("%jd.%02d", (intmax_t)start_time.tv_sec,(int)start_time.tv_usec/10000);
-         if (state->pv_ramdisk.path) {
-             vments[i++] = "image/ramdisk";
-             vments[i++] = (char *) state->pv_ramdisk.path;
-@@ -1502,7 +1502,7 @@ static void domcreate_stream_done(libxl__egc *egc,
-         vments[2] = "image/ostype";
-         vments[3] = "hvm";
-         vments[4] = "start_time";
--        vments[5] = GCSPRINTF("%lu.%02d", start_time.tv_sec,(int)start_time.tv_usec/10000);
-+        vments[5] = GCSPRINTF("%jd.%02d", (intmax_t)start_time.tv_sec,(int)start_time.tv_usec/10000);
-         break;
-     case LIBXL_DOMAIN_TYPE_PV:
-         vments = libxl__calloc(gc, 11, sizeof(char *));
-@@ -1512,7 +1512,7 @@ static void domcreate_stream_done(libxl__egc *egc,
-         vments[i++] = "image/kernel";
-         vments[i++] = (char *) state->pv_kernel.path;
-         vments[i++] = "start_time";
--        vments[i++] = GCSPRINTF("%lu.%02d", start_time.tv_sec,(int)start_time.tv_usec/10000);
-+        vments[i++] = GCSPRINTF("%jd.%02d", (intmax_t)start_time.tv_sec,(int)start_time.tv_usec/10000);
-         if (state->pv_ramdisk.path) {
-             vments[i++] = "image/ramdisk";
-             vments[i++] = (char *) state->pv_ramdisk.path;
--- 
-GitLab
-
diff --git a/package/xen/0004-libs-light-fix-tv_sec-fprintf-format.patch b/package/xen/0004-libs-light-fix-tv_sec-fprintf-format.patch
deleted file mode 100644
index d677dce4fc..0000000000
--- a/package/xen/0004-libs-light-fix-tv_sec-fprintf-format.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 4881285bcfd8f2e2c913c6e9f011b1e90652f414 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 28 Aug 2021 11:00:07 +0200
-Subject: [PATCH] libs/light: fix tv_sec fprintf format
-
-Don't assume tv_sec is a unsigned long, it is 64 bits on NetBSD 32 bits.
-Use %jd and cast to (intmax_t) instead
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: sent to xen-devel@lists.xenproject.org]
----
- tools/libs/light/libxl_domain.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/libxl/libxl_domain.c b/tools/libxl/libxl_domain.c
-index c00c36c928..51a6127552 100644
---- a/tools/libxl/libxl_domain.c
-+++ b/tools/libxl/libxl_domain.c
-@@ -1444,7 +1444,7 @@ static int libxl__mark_domid_recent(libxl__gc *gc, uint32_t domid)
-         }
-     }
- 
--    r = fprintf(nf, "%lu %u\n", ctxt.ts.tv_sec, domid);
-+    r = fprintf(nf, "%jd %u\n", (intmax_t)ctxt.ts.tv_sec, domid);
-     if (r < 0) {
-         LOGED(ERROR, domid, "failed to write to '%s'", new);
-         goto out;
--- 
-2.32.0
-
diff --git a/package/xen/0005-tools-drop-bogus-and-obsolete-ptyfuncs.m4.patch b/package/xen/0005-tools-drop-bogus-and-obsolete-ptyfuncs.m4.patch
deleted file mode 100644
index ce13f454f3..0000000000
--- a/package/xen/0005-tools-drop-bogus-and-obsolete-ptyfuncs.m4.patch
+++ /dev/null
@@ -1,253 +0,0 @@
-From 13a088627ae0c99f6c7c763ce0883dc804b54b66 Mon Sep 17 00:00:00 2001
-From: Olaf Hering <olaf@aepfle.de>
-Date: Fri, 12 May 2023 12:26:14 +0000
-Subject: [PATCH] tools: drop bogus and obsolete ptyfuncs.m4
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-According to openpty(3) it is required to include <pty.h> to get the
-prototypes for openpty() and login_tty(). But this is not what the
-function AX_CHECK_PTYFUNCS actually does. It makes no attempt to include
-the required header.
-
-The two source files which call openpty() and login_tty() already contain
-the conditionals to include the required header.
-
-Remove the bogus m4 file to fix build with clang, which complains about
-calls to undeclared functions.
-
-Remove usage of INCLUDE_LIBUTIL_H in libxl_bootloader.c, it is already
-covered by inclusion of libxl_osdep.h.
-
-Remove usage of PTYFUNCS_LIBS in libxl/Makefile, it is already covered
-by UTIL_LIBS from config/StdGNU.mk.
-
-Signed-off-by: Olaf Hering <olaf@aepfle.de>
-Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
-[Vincent: backported to 4.14.6]
-Signed-off-by: Vincent Stehlé <vincent.stehle@laposte.net>
-Upstream: https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=42abf5b9c53eb1b1a902002fcda68708234152c3
----
- config/Tools.mk.in             |  2 -
- m4/ptyfuncs.m4                 | 35 -----------------
- tools/config.h.in              |  3 --
- tools/configure                | 68 ----------------------------------
- tools/configure.ac             |  2 -
- tools/libxl/Makefile           |  2 +-
- tools/libxl/libxl_bootloader.c |  4 --
- 7 files changed, 1 insertion(+), 115 deletions(-)
- delete mode 100644 m4/ptyfuncs.m4
-
-diff --git a/config/Tools.mk.in b/config/Tools.mk.in
-index 23df47af8d..4971c3f526 100644
---- a/config/Tools.mk.in
-+++ b/config/Tools.mk.in
-@@ -31,8 +31,6 @@ PTHREAD_CFLAGS      := @PTHREAD_CFLAGS@
- PTHREAD_LDFLAGS     := @PTHREAD_LDFLAGS@
- PTHREAD_LIBS        := @PTHREAD_LIBS@
- 
--PTYFUNCS_LIBS       := @PTYFUNCS_LIBS@
--
- LIBNL3_LIBS         := @LIBNL3_LIBS@
- LIBNL3_CFLAGS       := @LIBNL3_CFLAGS@
- XEN_TOOLS_RPATH     := @rpath@
-diff --git a/m4/ptyfuncs.m4 b/m4/ptyfuncs.m4
-deleted file mode 100644
-index 3e37b5a23c..0000000000
---- a/m4/ptyfuncs.m4
-+++ /dev/null
-@@ -1,35 +0,0 @@
--AC_DEFUN([AX_CHECK_PTYFUNCS], [
--    dnl This is a workaround for a bug in Debian package
--    dnl libbsd-dev-0.3.0-1. Once we no longer support that
--    dnl package we can remove the addition of -Werror to
--    dnl CPPFLAGS.
--    AX_SAVEVAR_SAVE(CPPFLAGS)
--    CPPFLAGS="$CPPFLAGS -Werror"
--    AC_CHECK_HEADER([libutil.h],[
--      AC_DEFINE([INCLUDE_LIBUTIL_H],[<libutil.h>],[libutil header file name])
--    ])
--    AX_SAVEVAR_RESTORE(CPPFLAGS)
--    AC_CACHE_CHECK([for openpty et al], [ax_cv_ptyfuncs_libs], [
--        for ax_cv_ptyfuncs_libs in -lutil "" NOT_FOUND; do
--            if test "x$ax_cv_ptyfuncs_libs" = "xNOT_FOUND"; then
--                AC_MSG_FAILURE([Unable to find library for openpty and login_tty])
--            fi
--            AX_SAVEVAR_SAVE(LIBS)
--            LIBS="$LIBS $ax_cv_ptyfuncs_libs"
--            AC_LINK_IFELSE([AC_LANG_SOURCE([
--#ifdef INCLUDE_LIBUTIL_H
--#include INCLUDE_LIBUTIL_H
--#endif
--int main(void) {
--  openpty(0,0,0,0,0);
--  login_tty(0);
--}
--])],[
--                break
--            ],[])
--            AX_SAVEVAR_RESTORE(LIBS)
--        done
--    ])
--    PTYFUNCS_LIBS="$ax_cv_ptyfuncs_libs"
--    AC_SUBST(PTYFUNCS_LIBS)
--])
-diff --git a/tools/config.h.in b/tools/config.h.in
-index 5abf6092de..6b9a479928 100644
---- a/tools/config.h.in
-+++ b/tools/config.h.in
-@@ -87,9 +87,6 @@
- /* Define extfs header to use */
- #undef INCLUDE_EXTFS_H
- 
--/* libutil header file name */
--#undef INCLUDE_LIBUTIL_H
--
- /* IPXE path */
- #undef IPXE_PATH
- 
-diff --git a/tools/configure b/tools/configure
-index cf937c9b7a..5102297210 100755
---- a/tools/configure
-+++ b/tools/configure
-@@ -636,7 +636,6 @@ LIBNL3_LIBS
- LIBNL3_CFLAGS
- argp_ldflags
- libiconv
--PTYFUNCS_LIBS
- PTHREAD_LIBS
- PTHREAD_LDFLAGS
- PTHREAD_CFLAGS
-@@ -3739,8 +3738,6 @@ esac
- 
- 
- 
--
--
- # Fetched from http://git.savannah.gnu.org/gitweb/?p=autoconf-archive.git;a=blob_plain;f=m4/ax_compare_version.m4
- # Commit ID: 27948f49ca30e4222bb7cdd55182bd7341ac50c5
- # ===========================================================================
-@@ -8871,71 +8868,6 @@ $as_echo "$ax_cv_pthread_flags" >&6; }
- 
- 
- 
--
--
--    saved_CPPFLAGS="$CPPFLAGS"
--
--    CPPFLAGS="$CPPFLAGS -Werror"
--    ac_fn_c_check_header_mongrel "$LINENO" "libutil.h" "ac_cv_header_libutil_h" "$ac_includes_default"
--if test "x$ac_cv_header_libutil_h" = xyes; then :
--
--
--$as_echo "#define INCLUDE_LIBUTIL_H <libutil.h>" >>confdefs.h
--
--
--fi
--
--
--
--    CPPFLAGS="$saved_CPPFLAGS"
--
--    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for openpty et al" >&5
--$as_echo_n "checking for openpty et al... " >&6; }
--if ${ax_cv_ptyfuncs_libs+:} false; then :
--  $as_echo_n "(cached) " >&6
--else
--
--        for ax_cv_ptyfuncs_libs in -lutil "" NOT_FOUND; do
--            if test "x$ax_cv_ptyfuncs_libs" = "xNOT_FOUND"; then
--                { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
--$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
--as_fn_error $? "Unable to find library for openpty and login_tty
--See \`config.log' for more details" "$LINENO" 5; }
--            fi
--
--    saved_LIBS="$LIBS"
--
--            LIBS="$LIBS $ax_cv_ptyfuncs_libs"
--            cat confdefs.h - <<_ACEOF >conftest.$ac_ext
--/* end confdefs.h.  */
--
--#ifdef INCLUDE_LIBUTIL_H
--#include INCLUDE_LIBUTIL_H
--#endif
--int main(void) {
--  openpty(0,0,0,0,0);
--  login_tty(0);
--}
--
--_ACEOF
--if ac_fn_c_try_link "$LINENO"; then :
--
--                break
--
--fi
--rm -f core conftest.err conftest.$ac_objext \
--    conftest$ac_exeext conftest.$ac_ext
--
--    LIBS="$saved_LIBS"
--
--        done
--
--fi
--{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ax_cv_ptyfuncs_libs" >&5
--$as_echo "$ax_cv_ptyfuncs_libs" >&6; }
--    PTYFUNCS_LIBS="$ax_cv_ptyfuncs_libs"
--
--
- { $as_echo "$as_me:${as_lineno-$LINENO}: checking for yajl_alloc in -lyajl" >&5
- $as_echo_n "checking for yajl_alloc in -lyajl... " >&6; }
- if ${ac_cv_lib_yajl_yajl_alloc+:} false; then :
-diff --git a/tools/configure.ac b/tools/configure.ac
-index 1808cffafb..9e5cf3aae0 100644
---- a/tools/configure.ac
-+++ b/tools/configure.ac
-@@ -67,7 +67,6 @@ m4_include([../m4/uuid.m4])
- m4_include([../m4/pkg.m4])
- m4_include([../m4/curses.m4])
- m4_include([../m4/pthread.m4])
--m4_include([../m4/ptyfuncs.m4])
- m4_include([../m4/extfs.m4])
- m4_include([../m4/fetcher.m4])
- m4_include([../m4/ax_compare_version.m4])
-@@ -417,7 +416,6 @@ AC_SUBST(zlib)
- AC_SUBST(system_aio)
- AX_CHECK_EXTFS
- AX_CHECK_PTHREAD
--AX_CHECK_PTYFUNCS
- AC_CHECK_LIB([yajl], [yajl_alloc], [],
-     [AC_MSG_ERROR([Could not find yajl])])
- AC_CHECK_LIB([z], [deflateCopy], [], [AC_MSG_ERROR([Could not find zlib])])
-diff --git a/tools/libxl/Makefile b/tools/libxl/Makefile
-index 38cd43abae..0f09be1624 100644
---- a/tools/libxl/Makefile
-+++ b/tools/libxl/Makefile
-@@ -20,7 +20,7 @@ LIBUUID_LIBS += -luuid
- endif
- 
- LIBXL_LIBS =
--LIBXL_LIBS = $(LDLIBS_libxentoollog) $(LDLIBS_libxenevtchn) $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(LDLIBS_libxenhypfs) $(LDLIBS_libxenstore) $(LDLIBS_libxentoolcore) $(PTYFUNCS_LIBS) $(LIBUUID_LIBS)
-+LIBXL_LIBS = $(LDLIBS_libxentoollog) $(LDLIBS_libxenevtchn) $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(LDLIBS_libxenhypfs) $(LDLIBS_libxenstore) $(LDLIBS_libxentoolcore) $(UTIL_LIBS) $(LIBUUID_LIBS)
- ifeq ($(CONFIG_LIBNL),y)
- LIBXL_LIBS += $(LIBNL3_LIBS)
- endif
-diff --git a/tools/libxl/libxl_bootloader.c b/tools/libxl/libxl_bootloader.c
-index 18e9ebd714..1bc6e51827 100644
---- a/tools/libxl/libxl_bootloader.c
-+++ b/tools/libxl/libxl_bootloader.c
-@@ -19,10 +19,6 @@
- #include <utmp.h>
- #endif
- 
--#ifdef INCLUDE_LIBUTIL_H
--#include INCLUDE_LIBUTIL_H
--#endif
--
- #include "libxl_internal.h"
- 
- #define BOOTLOADER_BUF_OUT 65536
--- 
-2.45.2
-
diff --git a/package/xen/0006-Arm64-adjust-__irq_to_desc-to-fix-build-with-gcc14.patch b/package/xen/0006-Arm64-adjust-__irq_to_desc-to-fix-build-with-gcc14.patch
deleted file mode 100644
index ea810ed3f8..0000000000
--- a/package/xen/0006-Arm64-adjust-__irq_to_desc-to-fix-build-with-gcc14.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From a17dda1d2bf9c25b91f9e72625696cf26b32673a Mon Sep 17 00:00:00 2001
-From: Jan Beulich <jbeulich@suse.com>
-Date: Thu, 29 Aug 2024 10:03:53 +0200
-Subject: [PATCH] Arm64: adjust __irq_to_desc() to fix build with gcc14
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-With the original code I observe
-
-In function ‘__irq_to_desc’,
-    inlined from ‘route_irq_to_guest’ at arch/arm/irq.c:465:12:
-arch/arm/irq.c:54:16: error: array subscript -2 is below array bounds of ‘irq_desc_t[32]’ {aka ‘struct irq_desc[32]’} [-Werror=array-bounds=]
-   54 |         return &this_cpu(local_irq_desc)[irq];
-      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-which looks pretty bogus: How in the world does the compiler arrive at
--2 when compiling route_irq_to_guest()? Yet independent of that the
-function's parameter wants to be of unsigned type anyway, as shown by
-a vast majority of callers (others use plain int when they really mean
-non-negative quantities). With that adjustment the code compiles fine
-again.
-
-Signed-off-by: Jan Beulich <jbeulich@suse.com>
-Acked-by: Michal Orzel <michal.orzel@amd.com>
-[Vincent: backported to 4.14.6]
-Signed-off-by: Vincent Stehlé <vincent.stehle@laposte.net>
-Upstream: https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=99f942f3d410059dc223ee0a908827e928ef3592
----
- xen/arch/arm/irq.c        | 2 +-
- xen/include/asm-arm/irq.h | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
-index 3877657a52..2862de00d9 100644
---- a/xen/arch/arm/irq.c
-+++ b/xen/arch/arm/irq.c
-@@ -66,7 +66,7 @@ hw_irq_controller no_irq_type = {
- static irq_desc_t irq_desc[NR_IRQS];
- static DEFINE_PER_CPU(irq_desc_t[NR_LOCAL_IRQS], local_irq_desc);
- 
--irq_desc_t *__irq_to_desc(int irq)
-+irq_desc_t *__irq_to_desc(unsigned int irq)
- {
-     if ( irq < NR_LOCAL_IRQS )
-         return &this_cpu(local_irq_desc)[irq];
-diff --git a/xen/include/asm-arm/irq.h b/xen/include/asm-arm/irq.h
-index e45d574598..33fbbadb34 100644
---- a/xen/include/asm-arm/irq.h
-+++ b/xen/include/asm-arm/irq.h
-@@ -57,7 +57,7 @@ extern const unsigned int nr_irqs;
- struct irq_desc;
- struct irqaction;
- 
--struct irq_desc *__irq_to_desc(int irq);
-+struct irq_desc *__irq_to_desc(unsigned int irq);
- 
- #define irq_to_desc(irq)    __irq_to_desc(irq)
- 
--- 
-2.45.2
-
diff --git a/package/xen/0007-xen-arm32-avoid-.rodata-to-be-marked-as-executable.patch b/package/xen/0007-xen-arm32-avoid-.rodata-to-be-marked-as-executable.patch
deleted file mode 100644
index 9c484698ca..0000000000
--- a/package/xen/0007-xen-arm32-avoid-.rodata-to-be-marked-as-executable.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 99314e08c6450a841d4f7155b7ce364e0990df1c Mon Sep 17 00:00:00 2001
-From: Jan Beulich <jbeulich@suse.com>
-Date: Fri, 11 Jun 2021 11:19:15 +0200
-Subject: [PATCH] xen/arm32: avoid .rodata to be marked as executable
-
-The section .proc.info lives in .rodata as it doesn't contain any
-executable code. However, the section is still marked as executable
-as the consequence .rodata will also be marked executable.
-
-Xen doesn't use the ELF permissions to decide the page-table mapping
-permission. However, this will confuse disassemblers.
-
-'#execinstr' is now removed on all the pushsection dealing with
-.proc.info
-
-Signed-off-by: Jan Beulich <jbeulich@suse.com>
-[julieng: Rework the commit message]
-Acked-by: Julien Grall <jgrall@amazon.com>
-Upstream: https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=163f47c14737cfa9dfb3240deea356b08caf7614
-Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
----
- xen/arch/arm/arm32/proc-v7.S | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/xen/arch/arm/arm32/proc-v7.S b/xen/arch/arm/arm32/proc-v7.S
-index 46bfc7a..8b418ed 100644
---- a/xen/arch/arm/arm32/proc-v7.S
-+++ b/xen/arch/arm/arm32/proc-v7.S
-@@ -30,7 +30,7 @@ brahma15mp_init:
-         mcr   CP32(r0, ACTLR)
-         mov   pc, lr
- 
--        .section ".proc.info", #alloc, #execinstr
-+        .section ".proc.info", #alloc
-         .type __v7_ca15mp_proc_info, #object
- __v7_ca15mp_proc_info:
-         .long 0x410FC0F0             /* Cortex-A15 */
-@@ -39,7 +39,7 @@ __v7_ca15mp_proc_info:
-         .long caxx_processor
-         .size __v7_ca15mp_proc_info, . - __v7_ca15mp_proc_info
- 
--        .section ".proc.info", #alloc, #execinstr
-+        .section ".proc.info", #alloc
-         .type __v7_ca7mp_proc_info, #object
- __v7_ca7mp_proc_info:
-         .long 0x410FC070             /* Cortex-A7 */
-@@ -48,7 +48,7 @@ __v7_ca7mp_proc_info:
-         .long caxx_processor
-         .size __v7_ca7mp_proc_info, . - __v7_ca7mp_proc_info
- 
--        .section ".proc.info", #alloc, #execinstr
-+        .section ".proc.info", #alloc
-         .type __v7_brahma15mp_proc_info, #object
- __v7_brahma15mp_proc_info:
-         .long 0x420F00F0             /* Broadcom Brahma-B15 */
--- 
-2.48.1
-
diff --git a/package/xen/0008-arm-Avoid-using-solaris-syntax-for-.section-directiv.patch b/package/xen/0008-arm-Avoid-using-solaris-syntax-for-.section-directiv.patch
deleted file mode 100644
index 127c126f99..0000000000
--- a/package/xen/0008-arm-Avoid-using-solaris-syntax-for-.section-directiv.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From be0ff8586e38823d6ee08e031c28e5831bbb0991 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 1 Aug 2023 10:49:30 -0700
-Subject: [PATCH] arm: Avoid using solaris syntax for .section directive
-
-Assembler from binutils 2.41 will rejects ([1], [2]) the following
-syntax
-
-.section "name", #alloc
-
-for any other any target other than ELF SPARC. This means we can't use
-it in the Arm code.
-
-So switch to the GNU syntax
-
-.section name [, "flags"[, @type]]
-
-[1] https://sourceware.org/bugzilla/show_bug.cgi?id=11601
-[2] https://sourceware.org/binutils/docs-2.41/as.html#Section
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Reviewed-by: Michal Orzel <michal.orzel@amd.com>
-[jgrall: Reword commit message]
-Acked-by: Julien Grall <jgrall@amazon.com>
-Upstream: https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=dfc490a3740bb7d6889939934afadcb58891fbce
-Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
----
- xen/arch/arm/arm32/proc-v7.S | 6 +++---
- xen/arch/arm/dtb.S           | 2 +-
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/xen/arch/arm/arm32/proc-v7.S b/xen/arch/arm/arm32/proc-v7.S
-index 8b418ed..9869780 100644
---- a/xen/arch/arm/arm32/proc-v7.S
-+++ b/xen/arch/arm/arm32/proc-v7.S
-@@ -30,7 +30,7 @@ brahma15mp_init:
-         mcr   CP32(r0, ACTLR)
-         mov   pc, lr
- 
--        .section ".proc.info", #alloc
-+        .section .proc.info, "a"
-         .type __v7_ca15mp_proc_info, #object
- __v7_ca15mp_proc_info:
-         .long 0x410FC0F0             /* Cortex-A15 */
-@@ -39,7 +39,7 @@ __v7_ca15mp_proc_info:
-         .long caxx_processor
-         .size __v7_ca15mp_proc_info, . - __v7_ca15mp_proc_info
- 
--        .section ".proc.info", #alloc
-+        .section .proc.info, "a"
-         .type __v7_ca7mp_proc_info, #object
- __v7_ca7mp_proc_info:
-         .long 0x410FC070             /* Cortex-A7 */
-@@ -48,7 +48,7 @@ __v7_ca7mp_proc_info:
-         .long caxx_processor
-         .size __v7_ca7mp_proc_info, . - __v7_ca7mp_proc_info
- 
--        .section ".proc.info", #alloc
-+        .section .proc.info, "a"
-         .type __v7_brahma15mp_proc_info, #object
- __v7_brahma15mp_proc_info:
-         .long 0x420F00F0             /* Broadcom Brahma-B15 */
-diff --git a/xen/arch/arm/dtb.S b/xen/arch/arm/dtb.S
-index c703aef..8771daf 100644
---- a/xen/arch/arm/dtb.S
-+++ b/xen/arch/arm/dtb.S
-@@ -1,2 +1,2 @@
--        .section .dtb,#alloc
-+        .section .dtb, "a"
-         .incbin CONFIG_DTB_FILE
--- 
-2.48.1
-
diff --git a/package/xen/Config.in b/package/xen/Config.in
index e8168ca8c8..dc4d434810 100644
--- a/package/xen/Config.in
+++ b/package/xen/Config.in
@@ -31,6 +31,7 @@ config BR2_PACKAGE_XEN_TOOLS
 	select BR2_PACKAGE_SLIRP
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_UTIL_LINUX_BINARIES # runtime (prlimit)
 	select BR2_PACKAGE_YAJL
 	select BR2_PACKAGE_ARGP_STANDALONE if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_BASH # runtime (scripts)
diff --git a/package/xen/xen.hash b/package/xen/xen.hash
index d2350ac515..035f876ee1 100644
--- a/package/xen/xen.hash
+++ b/package/xen/xen.hash
@@ -1,3 +1,6 @@
-# Locally computed
-sha256  7917681bc6e744789815131fcf7799e6b83a0d45b5801ac654322b037ce472f8  xen-4.14.6.tar.gz
-sha256  ecca9538e9d3f7e3c2bff827502f4495e2ef9e22c451298696ea08886b176c2c  COPYING
+# Locally computed after checking pgp signature from:
+# https://downloads.xenproject.org/release/xen/4.19.5/xen-4.19.5.tar.gz.sig
+# with key 23E3222C145F4475FA8060A783FE14C957E82BD9
+sha256  8143ccc38982193142cc2e537a82d4e6b72d9053084372429e1d7ff0ed41ae2e  xen-4.19.5.tar.gz
+sha256  9eeacf4e4f91bdbcd16b3282bb86779e3122da032953ebccad4fccdfcf4cb3ac  COPYING
+sha256  aeab99f147957cd25fe8cc008992d5e5426ea73fb7d429923b5428a1ef1a59ce  LICENSES/GPL-2.0
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 80412cca97..5756dfc68c 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-XEN_VERSION = 4.14.6
+XEN_VERSION = 4.19.5
 XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
 XEN_SELINUX_MODULES = systemd udev xen
 XEN_LICENSE = GPL-2.0
-XEN_LICENSE_FILES = COPYING
+XEN_LICENSE_FILES = COPYING LICENSES/GPL-2.0
 XEN_CPE_ID_VENDOR = xen
 XEN_CPE_ID_PREFIX = cpe:2.3:o
-XEN_DEPENDENCIES = host-acpica host-python3
+XEN_DEPENDENCIES = host-acpica host-meson host-pkgconf host-python3
 
 # Calculate XEN_ARCH
 ifeq ($(ARCH),aarch64)
@@ -23,7 +23,8 @@ endif
 XEN_CONF_OPTS = \
 	--disable-golang \
 	--disable-ocamltools \
-	--with-initddir=/etc/init.d
+	--with-initddir=/etc/init.d \
+	--disable-werror
 
 XEN_CONF_ENV = PYTHON=$(HOST_DIR)/bin/python3
 XEN_MAKE_ENV = \

--===============8399298160130572172==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8399298160130572172==--
