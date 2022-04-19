Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC448C433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 21:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B0C342491;
	Tue, 19 Apr 2022 21:36:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Es0oPaRREcCN; Tue, 19 Apr 2022 21:36:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD9B441E00;
	Tue, 19 Apr 2022 21:36:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CCE491BF3F0
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 21:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A265833C6
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 21:35:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HXcMBwrVF2IG for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 21:35:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E693831C1
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 21:34:59 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 7147AFF805;
 Tue, 19 Apr 2022 21:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650404098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xzKNcEINlHnURPLHLQSvaHQpdqg8b6Za52hekeiGmig=;
 b=SoNgPhyF8RbK2Dx/4viUZxKtpPVPYc08WTRhbqcRbNI4F/5SWHUnp3RnjWSH/sYKFbesA2
 RR/rNry5/xcHhcRg8Ah8Ejh1jxr9cmptVaMYRVsCI0KDSzXOBOagbH9X3RxlCAfNdxuln5
 4+ZEmA3RUWzKG6AXN+kAp8u5xd5ebsp2P8+wBH72aoTBE2tfQ+1DjjTgNwFCKqr6czG0dD
 YsuAIRIo8sHcxIqAHR3zn1KO9vsG4rbUxI6Ri9PC0W4jr07Mk8xtiv8j6IQH2Exwhg7O0i
 DF8md6OOQBMPzmsKCxDK8upnDPkf1Rj35Nxm38/Wjwpvfp10qfdGAs375KXD7A==
To: Buildroot List <buildroot@buildroot.org>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 19 Apr 2022 23:34:48 +0200
Message-Id: <20220419213450.887728-4-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419213450.887728-1-thomas.petazzoni@bootlin.com>
References: <20220419213450.887728-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/5] arch: drop support for SH2A
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Until commit "arch/Config.in.sh: fixup MMU selection" in this series,
SH2A could either be used with BR2_USE_MMU disabled or BR2_USE_MMU
enabled.

The later made absolutely no sense, since SH2A does not have a MMU:
MMU support was introduced starting from SH3 according to
https://en.wikipedia.org/wiki/SuperH#SH-3

Also, since commit 22d5501e03b019218b718b5de7ca74824a8eaf42 ("arch:
tidy up binary formats config"), which was merged in Buildroot
2015.05, the architecture tuple used when BR2_sh2a=y and BR2_USE_MMU
disabled is sh2a-buildroot-uclinux-uclibc, and this was already
unsupported back in the days of Buildroot 2015.08 and binutils 2.24,
causing the build to fail with:

*** BFD does not support target sh2a-buildroot-uclinux-uclibc.

just like it fails to build today with recent version of binutils.

So, this has been broken since 2015.08, and nobody complained. SH2A is
seldomly used, so it's time to kill.

It is worth mentioning that there has been an attempt at resurrecting
SH2 support around 2015 (see https://lwn.net/Articles/647636/) as part
of the J2 core. This effort led to the addition of FDPIC support for
SH2A in the musl C library (and therefore proper ELF binaries, with
shared libraries), but that was never supported in Buildroot. Now that
the J2 project is essentially dead, there is no reason to bother with
this.

Fixes:

  http://autobuild.buildroot.net/results/63d01d33ae30f86b63b9f42a9fea116f2f3e9005/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                        | 7 +++++++
 arch/Config.in.sh                       | 5 +----
 package/uclibc/Config.in                | 1 -
 toolchain/toolchain-buildroot/Config.in | 2 +-
 utils/genrandconfig                     | 9 +++------
 5 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 27f19f14e7..1578ffd016 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2022.05"
 
+config BR2_sh2a
+	bool "sh2a architecture support removed"
+	select BR2_LEGACY
+	help
+	  The SuperH 2A (SH2A) architecture was not maintained, and
+	  broken, so its support was dropped.
+
 config BR2_PACKAGE_BOOST_LAYOUT_VERSIONED
 	bool "boost versioned layout removed"
 	select BR2_LEGACY
diff --git a/arch/Config.in.sh b/arch/Config.in.sh
index a012cbf491..f00954bb5e 100644
--- a/arch/Config.in.sh
+++ b/arch/Config.in.sh
@@ -5,8 +5,6 @@ choice
 	help
 	  Specific CPU variant to use
 
-config BR2_sh2a
-	bool "sh2a (SH2A big endian)"
 config BR2_sh4
 	bool "sh4 (SH4 little endian)"
 	select BR2_ARCH_HAS_MMU_MANDATORY
@@ -22,7 +20,6 @@ config BR2_sh4aeb
 endchoice
 
 config BR2_ARCH
-	default "sh2a"		if BR2_sh2a
 	default "sh4"		if BR2_sh4
 	default "sh4eb"		if BR2_sh4eb
 	default "sh4a"		if BR2_sh4a
@@ -33,7 +30,7 @@ config BR2_NORMALIZED_ARCH
 
 config BR2_ENDIAN
 	default "LITTLE"	if BR2_sh4 || BR2_sh4a
-	default "BIG"		if BR2_sh2a || BR2_sh4eb || BR2_sh4aeb
+	default "BIG"		if BR2_sh4eb || BR2_sh4aeb
 
 config BR2_READELF_ARCH_NAME
 	default "Renesas / SuperH SH"
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 2091166b62..310414bebc 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -124,7 +124,6 @@ config BR2_UCLIBC_MIPS_NAN
 
 config BR2_UCLIBC_SH_TYPE
 	string
-	default "SH2A" if BR2_sh2a
 	default "SH4"  if BR2_sh4 || BR2_sh4eb
 	depends on BR2_UCLIBC_TARGET_ARCH = "sh"
 
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 4004c0edf8..be89f68ab5 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -31,7 +31,7 @@ config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 		   BR2_arm     || BR2_armeb    || \
 		   BR2_i386    || BR2_m68k   || BR2_microblaze || \
 		   BR2_mips    || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
-		   BR2_or1k    || BR2_powerpc || BR2_RISCV_64 || BR2_sh2a   || \
+		   BR2_or1k    || BR2_powerpc || BR2_RISCV_64 || \
 		   BR2_sh4     || BR2_sh4eb   || BR2_sparc || BR2_xtensa || \
 		   BR2_x86_64
 	select BR2_TOOLCHAIN_USES_UCLIBC
diff --git a/utils/genrandconfig b/utils/genrandconfig
index 59fe34e58d..adefb8f502 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -237,12 +237,9 @@ def fixup_config(sysinfo, configfile):
     if 'BR2_PACKAGE_PYTHON3=y\n' in configlines and \
        BR2_TOOLCHAIN_EXTERNAL_URL + 'mips64el-ctng_n64-linux-gnu.tar.xz"\n' in configlines:
         return False
-    # libffi not available on sh2a and ARMv7-M, but propagating libffi
-    # arch dependencies in Buildroot is really too much work, so we
-    # handle this here.
-    if 'BR2_sh2a=y\n' in configlines and \
-       'BR2_PACKAGE_LIBFFI=y\n' in configlines:
-        return False
+    # libffi not available on ARMv7-M, but propagating libffi arch
+    # dependencies in Buildroot is really too much work, so we handle
+    # this here.
     if 'BR2_ARM_CPU_ARMV7M=y\n' in configlines and \
        'BR2_PACKAGE_LIBFFI=y\n' in configlines:
         return False
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
