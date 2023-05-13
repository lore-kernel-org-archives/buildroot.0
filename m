Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF54C77B7C
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 08:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D42B42CB3;
	Sat, 13 May 2023 08:17:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D42B42CB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sokmJPamg3eg; Sat, 13 May 2023 08:17:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8AEF42E99;
	Sat, 13 May 2023 08:16:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8AEF42E99
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C4DB91BF5DF
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 08:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9996B42CB3
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 08:16:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9996B42CB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sZ-UklYBhXrs for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 08:16:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AD0142CB7
 for <buildroot@buildroot.org>; Sat, 13 May 2023 08:16:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AD0142CB7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5559C84142; Sat, 13 May 2023 08:16:14 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 May 2023 10:04:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 33bb76627b4bb8c70b90ebf78dbe24b3eceff729
X-Git-Newrev: 99bc8f4abe42fe9358c9dff8706f17203c6ffa3e
X-Patchwork-Hint: ignore
Message-Id: <20230513081614.5559C84142@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: bump version to 7.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=99bc8f4abe42fe9358c9dff8706f17203c6ffa3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- remove 0003-target-sh4-Mask-restore-of-env-flags-from-tb-flags.patch
  (from upstream, see [1])

[1] https://gitlab.com/qemu-project/qemu/-/commit/e34f86a2f91c39d610d58baa6f4c9ed9a5a5d791

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[yann.morin.1998@free.fr: regenerate .checkpackageignore]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                                |  1 -
 ...4-Mask-restore-of-env-flags-from-tb-flags.patch | 36 ----------------------
 package/qemu/qemu.hash                             |  2 +-
 package/qemu/qemu.mk                               |  2 +-
 4 files changed, 2 insertions(+), 39 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 9b72a780d3..d7a1df1a74 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1332,7 +1332,6 @@ package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.patch Upstre
 package/python3/0031-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch Upstream
 package/qemu/0001-tests-fp-disable-fp-bench-build-by-default.patch Upstream
 package/qemu/0002-softmmu-qemu-seccomp.c-add-missing-header-for-CLONE_.patch Upstream
-package/qemu/0003-target-sh4-Mask-restore-of-env-flags-from-tb-flags.patch Upstream
 package/qextserialport/0001-Create-a-main-include-file-QExtSerialPort.patch Upstream
 package/qextserialport/0002-Tell-qmake-to-add-a-pkgconfig-file-to-ease-usage-wit.patch Upstream
 package/qt5/qt5base/0001-qtbase-Fix-build-error-when-using-EGL.patch Upstream
diff --git a/package/qemu/0003-target-sh4-Mask-restore-of-env-flags-from-tb-flags.patch b/package/qemu/0003-target-sh4-Mask-restore-of-env-flags-from-tb-flags.patch
deleted file mode 100644
index 8dc2dd8823..0000000000
--- a/package/qemu/0003-target-sh4-Mask-restore-of-env-flags-from-tb-flags.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From bc2331635ce18ff068d2bb1e493bc546e1f786e1 Mon Sep 17 00:00:00 2001
-From: Guenter Roeck <linux@roeck-us.net>
-Date: Mon, 12 Dec 2022 09:03:17 -0600
-Subject: [PATCH] target/sh4: Mask restore of env->flags from tb->flags
-
-The values in env->flags are a subset of tb->flags.
-Restore only the bits that belong.
-
-Cc: qemu-stable@nongnu.org
-Fixes: ab419fd8a035 ("target/sh4: Fix TB_FLAG_UNALIGN")
-Signed-off-by: Guenter Roeck <linux@roeck-us.net>
-Message-ID: <20221212011345.GA2235238@roeck-us.net>
-[rth: Reduce to only the the superh_cpu_synchronize_from_tb change]
-Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
-[yann.morin.1998@free.fr: backport from upstream]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
- target/sh4/cpu.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
-index 951eb6b9c8..f0934b20fa 100644
---- a/target/sh4/cpu.c
-+++ b/target/sh4/cpu.c
-@@ -47,7 +47,7 @@ static void superh_cpu_synchronize_from_tb(CPUState *cs,
-     SuperHCPU *cpu = SUPERH_CPU(cs);
- 
-     cpu->env.pc = tb_pc(tb);
--    cpu->env.flags = tb->flags;
-+    cpu->env.flags = tb->flags & TB_FLAG_ENVFLAGS_MASK;
- }
- 
- static void superh_restore_state_to_opc(CPUState *cs,
--- 
-2.25.1
-
diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index e671e1d184..93f7c98f1c 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,4 +1,4 @@
 # Locally computed, tarball verified with GPG signature
-sha256  5b49ce2687744dad494ae90a898c52204a3406e84d072482a1e1be854eeb2157  qemu-7.2.0.tar.xz
+sha256  8c85699acf9d7a43a5fe29a64cdd56370b0c2d1ad074baf7098a824d17aad73b  qemu-7.2.1.tar.xz
 sha256  6f04ae8364d0079a192b14635f4b1da294ce18724c034c39a6a41d1b09df6100  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 3f51cb572b..12d52f61bf 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, check whether the list of supported targets
 # needs to be updated.
-QEMU_VERSION = 7.2.0
+QEMU_VERSION = 7.2.1
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = https://download.qemu.org
 QEMU_LICENSE = GPL-2.0, LGPL-2.1, MIT, BSD-3-Clause, BSD-2-Clause, Others/BSD-1c
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
