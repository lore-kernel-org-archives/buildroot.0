Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C60CC25B10
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 16:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DD034038C;
	Thu,  9 May 2024 16:34:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hYFNcnvMUYsw; Thu,  9 May 2024 16:33:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22B0B404D0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22B0B404D0;
	Thu,  9 May 2024 16:33:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 816DF1BF337
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E5FF41D7C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:33:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C8m9RUdumBQi for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 16:33:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D62E64039D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D62E64039D
 for <buildroot@buildroot.org>; Thu,  9 May 2024 16:33:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB5BC86CB7; Thu,  9 May 2024 16:33:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 18:32:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0c9ea82ea805fe00ca69836b0ca785af2728ec08
X-Git-Newrev: a8be4a04ade8e695c5c4d4a825253d69e80693f9
X-Patchwork-Hint: ignore
Message-Id: <20240509163355.BB5BC86CB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/config-fragments: replace
 br-i386-pentium-mmx-musl
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

commit: https://git.buildroot.net/buildroot/commit/?id=a8be4a04ade8e695c5c4d4a825253d69e80693f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace br-i386-pentium-mmx-musl by bootlin-x86-i686-musl to avoid the
following build failure with efivar and musl < 1.2.3 as suggested in
https://patchwork.ozlabs.org/project/buildroot/patch/20240303171115.1140763-1-ju.o@free.fr:

/home/buildroot/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld: ./libefisec.so: undefined reference to `qsort_r'

Fixes:
 - http://autobuild.buildroot.org/results/a0ed3970da8a84d884b26c081b49b8d2b7208829

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../config-fragments/autobuild/bootlin-x86-i686-musl.config    |  4 ++++
 .../config-fragments/autobuild/br-i386-pentium-mmx-musl.config | 10 ----------
 support/config-fragments/autobuild/toolchain-configs.csv       |  2 +-
 3 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/support/config-fragments/autobuild/bootlin-x86-i686-musl.config b/support/config-fragments/autobuild/bootlin-x86-i686-musl.config
new file mode 100644
index 0000000000..2afe096f32
--- /dev/null
+++ b/support/config-fragments/autobuild/bootlin-x86-i686-musl.config
@@ -0,0 +1,4 @@
+BR2_i386=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_STABLE=y
diff --git a/support/config-fragments/autobuild/br-i386-pentium-mmx-musl.config b/support/config-fragments/autobuild/br-i386-pentium-mmx-musl.config
deleted file mode 100644
index 1b3c45fe9b..0000000000
--- a/support/config-fragments/autobuild/br-i386-pentium-mmx-musl.config
+++ /dev/null
@@ -1,10 +0,0 @@
-BR2_x86_pentium_mmx=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-i386-pentium-mmx-musl-2020.11.2.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
-# BR2_TOOLCHAIN_EXTERNAL_HAS_SSP is not set
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 47d5fddfbd..654f11e28b 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -39,6 +39,7 @@ support/config-fragments/autobuild/bootlin-s390x-z13-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-sh4-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-sparc-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-sparc64-glibc.config,x86_64
+support/config-fragments/autobuild/bootlin-x86-i686-musl.config,x86_64
 support/config-fragments/autobuild/bootlin-x86-64-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-x86-64-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-xtensa-uclibc.config,x86_64
@@ -50,7 +51,6 @@ support/config-fragments/autobuild/br-arm-internal-full.config,any
 support/config-fragments/autobuild/br-arm-internal-glibc.config,any
 support/config-fragments/autobuild/br-arm-internal-musl.config,any
 support/config-fragments/autobuild/br-i386-pentium4-full.config,x86_64
-support/config-fragments/autobuild/br-i386-pentium-mmx-musl.config,x86_64
 support/config-fragments/autobuild/br-microblazeel-full-internal.config,any
 support/config-fragments/autobuild/br-mips64-n64-full.config,x86_64
 support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config,x86_64
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
