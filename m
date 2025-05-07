Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581ECC3ABC0
	for <buildroot@archiver.kernel.org>; Wed,  7 May 2025 21:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DECB40E22;
	Wed,  7 May 2025 21:00:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OULm2ZCiTMJo; Wed,  7 May 2025 21:00:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 927BD40569
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 927BD40569;
	Wed,  7 May 2025 21:00:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B1CA2439
 for <buildroot@buildroot.org>; Wed,  7 May 2025 21:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9792C41C9F
 for <buildroot@buildroot.org>; Wed,  7 May 2025 21:00:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SHsjq4r31hMa for <buildroot@buildroot.org>;
 Wed,  7 May 2025 21:00:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B52DD41AA9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B52DD41AA9
 for <buildroot@buildroot.org>; Wed,  7 May 2025 21:00:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E3728653A; Wed,  7 May 2025 21:00:31 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 7 May 2025 22:25:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 835b5659ea576290458aa17d2119b2ec13ebf0a0
X-Git-Newrev: dd2d62a36e091ad745fbacbef810709b2f597396
X-Patchwork-Hint: ignore
Message-Id: <20250507210031.9E3728653A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: bump to version 10.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=dd2d62a36e091ad745fbacbef810709b2f597396
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes log:
https://wiki.qemu.org/ChangeLog/10.0

Remove upstream patches:

- 0002-stubs-only-build-stubs-for-QAPI-events-when-needed.patch
  https://gitlab.com/qemu-project/qemu/-/commit/8113dbbcdaee05f319a7e48272416d918cb2b04a
- 0003-sched_attr-Do-not-define-for-glibc-2.41.patch
  https://gitlab.com/qemu-project/qemu/-/commit/27a8d899c7a100fd5aa040a8b993bb257687c393

Note:
  32-bit host support is now deprecated for all platforms and will be
  removed in a future QEMU release.
  https://gitlab.com/qemu-project/qemu/-/commit/6d701c9bac1d3571e9ad511e01b27df7237f0b13

Qemu defconfigs were runtime tested on Gitlab-CI:
https://gitlab.com/kubu93/buildroot/-/pipelines/1805672685

qemu_s390x_defconfig, qemu_arm_vexpress_tz_defconfig,
qemu_aarch64_ebbr_defconfig were tested locally.

Runtime tests using host-qemu were locally tested:
TestXvisor, TestFwts, TestEdk2, TestGrubAArch64EFI.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...y-build-stubs-for-QAPI-events-when-needed.patch | 45 --------------------
 ...3-sched_attr-Do-not-define-for-glibc-2.41.patch | 49 ----------------------
 package/qemu/qemu.hash                             |  2 +-
 package/qemu/qemu.mk                               |  2 +-
 4 files changed, 2 insertions(+), 96 deletions(-)

diff --git a/package/qemu/0002-stubs-only-build-stubs-for-QAPI-events-when-needed.patch b/package/qemu/0002-stubs-only-build-stubs-for-QAPI-events-when-needed.patch
deleted file mode 100644
index e31eb11909..0000000000
--- a/package/qemu/0002-stubs-only-build-stubs-for-QAPI-events-when-needed.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From ffd5e7cbc0cf2d1c0984bb453cc9e125c7259436 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Tue, 7 Jan 2025 21:52:51 +0100
-Subject: [PATCH] stubs: only build stubs for QAPI events when needed
-
-Since commit "stubs: avoid duplicate symbols in libqemuutil.a" [1],
-Qemu doesn't build with:
-
-  ./configure --enable-user --disable-system --enable-tools
-
-  /usr/bin/ld: libhwcore.a.p/hw_core_qdev.c.o: in function 'device_finalize':
-  [...]output/build/host-qemu-9.2.0/build/../hw/core/qdev.c:689:(.text+0x75c): undefined reference to 'qapi_event_send_device_deleted'
-  collect2: error: ld returned 1 exit status
-
-Indeed, with have_system = false and have_tools = true, Qemu needs the
-stubs for QAPI events added by stub_ss.add(files('qdev.c')) to provide
-qapi_event_send_device_deleted().
-
-Fixes: 388b849fb6c33882b481123568995a749a54f648.
-
-[1] https://gitlab.com/qemu-project/qemu/-/commit/388b849fb6c33882b481123568995a749a54f648
-
-Upstream: https://gitlab.com/qemu-project/qemu/-/issues/2766
-
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- stubs/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/stubs/meson.build b/stubs/meson.build
-index e91614a874..838a8ca3e3 100644
---- a/stubs/meson.build
-+++ b/stubs/meson.build
-@@ -58,7 +58,7 @@ if have_user
- 
-   # Stubs for QAPI events.  Those can always be included in the build, but
-   # they are not built at all for --disable-system --disable-tools builds.
--  if not (have_system or have_tools)
-+  if not have_system and have_tools
-     stub_ss.add(files('qdev.c'))
-   endif
- endif
--- 
-2.47.1
-
diff --git a/package/qemu/0003-sched_attr-Do-not-define-for-glibc-2.41.patch b/package/qemu/0003-sched_attr-Do-not-define-for-glibc-2.41.patch
deleted file mode 100644
index 11edc27c2f..0000000000
--- a/package/qemu/0003-sched_attr-Do-not-define-for-glibc-2.41.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 66b1926d72ef51d4d59d0f97061f26a75651e265 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 11 Oct 2024 12:31:40 -0700
-Subject: [PATCH] sched_attr: Do not define for glibc >= 2.41
-
-glibc 2.41+ has added [1] definitions for sched_setattr and sched_getattr functions
-and struct sched_attr. Therefore, it needs to be checked for here as well before
-defining sched_attr
-
-Define sched_attr conditionally on SCHED_ATTR_SIZE_VER0
-
-Fixes builds with glibc/trunk
-
-[1] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=21571ca0d70302909cf72707b2a7736cf12190a0;hp=298bc488fdc047da37482f4003023cb9adef78f8
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Cc: Laurent Vivier <laurent@vivier.eu>
-Cc: Paolo Bonzini <pbonzini@redhat.com>
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-Upstream: https://patchwork.kernel.org/project/qemu-devel/patch/20241011193140.1047648-1-raj.khem@gmail.com/
----
- linux-user/syscall.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/linux-user/syscall.c b/linux-user/syscall.c
-index 1ce4c79784..a407d4a023 100644
---- a/linux-user/syscall.c
-+++ b/linux-user/syscall.c
-@@ -358,7 +358,8 @@ _syscall3(int, sys_sched_getaffinity, pid_t, pid, unsigned int, len,
- #define __NR_sys_sched_setaffinity __NR_sched_setaffinity
- _syscall3(int, sys_sched_setaffinity, pid_t, pid, unsigned int, len,
-           unsigned long *, user_mask_ptr);
--/* sched_attr is not defined in glibc */
-+/* sched_attr is not defined in glibc < 2.41 */
-+#ifndef SCHED_ATTR_SIZE_VER0
- struct sched_attr {
-     uint32_t size;
-     uint32_t sched_policy;
-@@ -371,6 +372,7 @@ struct sched_attr {
-     uint32_t sched_util_min;
-     uint32_t sched_util_max;
- };
-+#endif
- #define __NR_sys_sched_getattr __NR_sched_getattr
- _syscall4(int, sys_sched_getattr, pid_t, pid, struct sched_attr *, attr,
-           unsigned int, size, unsigned int, flags);
--- 
-2.34.1
-
diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index 9be69ffbbc..a8b7d688e8 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,4 +1,4 @@
 # Locally computed, tarball verified with GPG signature
-sha256  f859f0bc65e1f533d040bbe8c92bcfecee5af2c921a6687c652fb44d089bd894  qemu-9.2.0.tar.xz
+sha256  22c075601fdcf8c7b2671a839ebdcef1d4f2973eb6735254fd2e1bd0f30b3896  qemu-10.0.0.tar.xz
 sha256  6f04ae8364d0079a192b14635f4b1da294ce18724c034c39a6a41d1b09df6100  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 3a2f69ea3c..fdc8591e54 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, check whether the list of supported targets
 # needs to be updated.
-QEMU_VERSION = 9.2.0
+QEMU_VERSION = 10.0.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = https://download.qemu.org
 QEMU_SELINUX_MODULES = qemu virt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
