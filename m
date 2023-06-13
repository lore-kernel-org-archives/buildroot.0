Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20AA2C7EE29
	for <buildroot@archiver.kernel.org>; Tue, 13 Jun 2023 07:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9A9C410D2;
	Tue, 13 Jun 2023 07:06:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9A9C410D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KUyIXGTSP9VR; Tue, 13 Jun 2023 07:06:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3303B408A2;
	Tue, 13 Jun 2023 07:06:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3303B408A2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D37461BF341
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 07:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA4F460B05
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 07:05:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA4F460B05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KYHJ2Oxa0yzf for <buildroot@lists.busybox.net>;
 Tue, 13 Jun 2023 07:05:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E639D60E48
 for <buildroot@buildroot.org>; Tue, 13 Jun 2023 07:05:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E639D60E48
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D5702828A5; Tue, 13 Jun 2023 07:05:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 13 Jun 2023 08:57:18 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 07e3ba7ecc553c8a2a1c7e1241971180cd436adb
X-Git-Newrev: 73ff3453af0dbadc02ec58dc849c0a1df434a9f4
X-Patchwork-Hint: ignore
Message-Id: <20230613070545.D5702828A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/qemu: bump
 version to 7.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=73ff3453af0dbadc02ec58dc849c0a1df434a9f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

- remove 0003-target-sh4-Mask-restore-of-env-flags-from-tb-flags.patch
  (from upstream, see [1])

[1] https://gitlab.com/qemu-project/qemu/-/commit/e34f86a2f91c39d610d58baa6f4c9ed9a5a5d791

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[yann.morin.1998@free.fr: regenerate .checkpackageignore]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 99bc8f4abe42fe9358c9dff8706f17203c6ffa3e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...4-Mask-restore-of-env-flags-from-tb-flags.patch | 36 ----------------------
 package/qemu/qemu.hash                             |  2 +-
 package/qemu/qemu.mk                               |  2 +-
 3 files changed, 2 insertions(+), 38 deletions(-)

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
index 47ea75681f..82858ca6a8 100644
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
