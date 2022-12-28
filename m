Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85449C4332F
	for <buildroot@archiver.kernel.org>; Wed, 28 Dec 2022 19:51:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BF04605AE;
	Wed, 28 Dec 2022 19:51:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BF04605AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tTNcPsuJ3K2O; Wed, 28 Dec 2022 19:51:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C80260A9F;
	Wed, 28 Dec 2022 19:51:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C80260A9F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 247991BF59F
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 19:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F34C04027B
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 19:50:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F34C04027B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u1_kjPhMjEkQ for <buildroot@lists.busybox.net>;
 Wed, 28 Dec 2022 19:50:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE11A400B9
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 19:50:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE11A400B9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9A60F86F44; Wed, 28 Dec 2022 19:50:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 28 Dec 2022 20:50:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ad71850aa039e344a1c32cd07876c1a83bdf5d5d
X-Git-Newrev: 5a21d2f356fbcb76dd8f96c8c9476401be104e90
X-Patchwork-Hint: ignore
Message-Id: <20221228195043.9A60F86F44@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: bump to version 7.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=5a21d2f356fbcb76dd8f96c8c9476401be104e90
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes log:
https://wiki.qemu.org/ChangeLog/7.2

Add host-slirp dependency to provide the network backend 'user' that
was included in previous Qemu release by a submodule in Qemu sources [1].

This network backend is currently used by several defconfig that would
fail to boot with:

  "-net user: network backend 'user' is not compiled into this binary"

board/mender/x86_64/readme.txt
board/pc/readme.txt
board/pc/readme.txt
board/qemu/arm-versatile/readme.txt
board/qemu/arm-vexpress/readme.txt
board/qemu/mips32r2-malta/readme.txt
board/qemu/mips32r2el-malta/readme.txt
board/qemu/mips32r6el-malta/readme.txt
board/qemu/ppc-bamboo/readme.txt
board/qemu/ppc-e500mc/readme.txt
board/qemu/ppc-g3beige/readme.txt
board/qemu/ppc-mac99/readme.txt
board/qemu/ppc-mpc8544ds/readme.txt
board/qemu/ppc64-e5500/readme.txt
board/qemu/s390x/readme.txt
board/qemu/sh4-r2d/readme.txt
board/qemu/sh4eb-r2d/readme.txt
board/qemu/sparc-ss10/readme.txt
board/qemu/sparc64-sun4u/readme.txt
board/qemu/x86/readme.txt
board/qemu/x86_64/readme.txt

Update the slirp configure option following the slirp submodule removal
[2].

Runtime tested in gitlab:
https://gitlab.com/kubu93/buildroot/-/pipelines/725509959

Add a backport from upstream, to fix sh4 stability [3].

[1] https://wiki.qemu.org/ChangeLog/7.2#Removal_of_the_.22slirp.22_submodule_.28affects_.22-netdev_user.22.29
[2] https://gitlab.com/qemu-project/qemu/-/commit/5890258aeeba303704ec1adca415e46067800777
[3] https://gitlab.com/kubu93/buildroot/-/jobs/3490258272

Signed-off-by: Romain Naour <romain.naour@gmail.com>
[yann.morin.1998@free.fr: backport fix rather than revert faulty commit]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...4-Mask-restore-of-env-flags-from-tb-flags.patch | 36 ++++++++++++++++++++++
 package/qemu/qemu.hash                             |  2 +-
 package/qemu/qemu.mk                               |  6 ++--
 3 files changed, 41 insertions(+), 3 deletions(-)

diff --git a/package/qemu/0003-target-sh4-Mask-restore-of-env-flags-from-tb-flags.patch b/package/qemu/0003-target-sh4-Mask-restore-of-env-flags-from-tb-flags.patch
new file mode 100644
index 0000000000..8dc2dd8823
--- /dev/null
+++ b/package/qemu/0003-target-sh4-Mask-restore-of-env-flags-from-tb-flags.patch
@@ -0,0 +1,36 @@
+From bc2331635ce18ff068d2bb1e493bc546e1f786e1 Mon Sep 17 00:00:00 2001
+From: Guenter Roeck <linux@roeck-us.net>
+Date: Mon, 12 Dec 2022 09:03:17 -0600
+Subject: [PATCH] target/sh4: Mask restore of env->flags from tb->flags
+
+The values in env->flags are a subset of tb->flags.
+Restore only the bits that belong.
+
+Cc: qemu-stable@nongnu.org
+Fixes: ab419fd8a035 ("target/sh4: Fix TB_FLAG_UNALIGN")
+Signed-off-by: Guenter Roeck <linux@roeck-us.net>
+Message-ID: <20221212011345.GA2235238@roeck-us.net>
+[rth: Reduce to only the the superh_cpu_synchronize_from_tb change]
+Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
+[yann.morin.1998@free.fr: backport from upstream]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+ target/sh4/cpu.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
+index 951eb6b9c8..f0934b20fa 100644
+--- a/target/sh4/cpu.c
++++ b/target/sh4/cpu.c
+@@ -47,7 +47,7 @@ static void superh_cpu_synchronize_from_tb(CPUState *cs,
+     SuperHCPU *cpu = SUPERH_CPU(cs);
+ 
+     cpu->env.pc = tb_pc(tb);
+-    cpu->env.flags = tb->flags;
++    cpu->env.flags = tb->flags & TB_FLAG_ENVFLAGS_MASK;
+ }
+ 
+ static void superh_restore_state_to_opc(CPUState *cs,
+-- 
+2.25.1
+
diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index 06d090bd1d..e671e1d184 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,4 +1,4 @@
 # Locally computed, tarball verified with GPG signature
-sha256  a0634e536bded57cf38ec8a751adb124b89c776fe0846f21ab6c6728f1cbbbe6  qemu-7.1.0.tar.xz
+sha256  5b49ce2687744dad494ae90a898c52204a3406e84d072482a1e1be854eeb2157  qemu-7.2.0.tar.xz
 sha256  6f04ae8364d0079a192b14635f4b1da294ce18724c034c39a6a41d1b09df6100  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index be84452862..8725e7c8c4 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QEMU_VERSION = 7.1.0
+QEMU_VERSION = 7.2.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = http://download.qemu.org
 QEMU_LICENSE = GPL-2.0, LGPL-2.1, MIT, BSD-3-Clause, BSD-2-Clause, Others/BSD-1c
@@ -69,7 +69,7 @@ QEMU_OPTS += --enable-vhost-user
 endif
 
 ifeq ($(BR2_PACKAGE_QEMU_SLIRP),y)
-QEMU_OPTS += --enable-slirp=system
+QEMU_OPTS += --enable-slirp
 QEMU_DEPENDENCIES += slirp
 else
 QEMU_OPTS += --disable-slirp
@@ -258,6 +258,7 @@ HOST_QEMU_DEPENDENCIES = \
 	host-pixman \
 	host-pkgconf \
 	host-python3 \
+	host-slirp \
 	host-zlib
 
 #       BR ARCH         qemu
@@ -402,6 +403,7 @@ define HOST_QEMU_CONFIGURE_CMDS
 		--disable-vnc-jpeg \
 		--disable-png \
 		--disable-vnc-sasl \
+		--enable-slirp \
 		--enable-tools \
 		$(HOST_QEMU_OPTS)
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
