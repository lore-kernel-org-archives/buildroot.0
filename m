Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C7BCD37AA
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 20:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03229607CF;
	Tue,  3 Sep 2024 20:16:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q_02jDuh_Qg6; Tue,  3 Sep 2024 20:16:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B435607FE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B435607FE;
	Tue,  3 Sep 2024 20:16:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8ED611BF57B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:16:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89FEA80D58
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:16:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DA9gzIw7sRI7 for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 20:16:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79FF080D55
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79FF080D55
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 20:16:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 680F586C55; Tue,  3 Sep 2024 20:16:36 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 22:14:02 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e1c316bc4018816a5a118d21f98bc3380a52f382
X-Git-Newrev: 4baaf0730581c0f4c31659f8fe69c0e1fb8c3e8e
X-Patchwork-Hint: ignore
Message-Id: <20240903201636.680F586C55@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 toolchain/toolchain-external/toolchain-external-synopsys-arc: bump to
 2024.06
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

commit: https://git.buildroot.net/buildroot/commit/?id=4baaf0730581c0f4c31659f8fe69c0e1fb8c3e8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Until now only one option was shown, and we were automatically
selecting the ARC700/ARChs and LE/BE toolchains based on the
architecture selection. However now, Synopsys offers glibc/uClibc
toolchains, and we can't decide that automatically, so let's add an
explicit choice for the user to chose between the different variants
of Synopsys toolchains available.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998@free.fr: fix glibc toolchain prompt to mention ARC HS]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../toolchain-external-synopsys-arc/Config.in      | 13 +++------
 .../Config.in.options                              | 32 ++++++++++++++++++++++
 .../toolchain-external-synopsys-arc.hash           | 12 ++++----
 .../toolchain-external-synopsys-arc.mk             | 13 ++++++---
 4 files changed, 52 insertions(+), 18 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
index 292e652fb0..dc333f8474 100644
--- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
@@ -1,17 +1,12 @@
 config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
-	bool "Synopsys ARC 2019.09 toolchain"
+	bool "Synopsys ARC 2024.06 toolchain"
 	depends on BR2_arc
 	depends on BR2_HOSTARCH = "x86_64"
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_10
-	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_USE_WCHAR
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	help
 	  Toolchain for the ARC cores, from
 	  https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases
diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.options b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.options
index ceb7dd0081..4b4482106c 100644
--- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.options
@@ -1,5 +1,37 @@
 if BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
 
+choice
+	prompt "Synopsys toolchain variant"
+
+config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC700
+	bool "Linux/uClibc ARC 700"
+	depends on BR2_arc750d || BR2_arc770d
+	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	select BR2_USE_WCHAR
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+
+config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARCHS_UCLIBC
+	bool "Linux/uClibc ARC HS"
+	depends on BR2_archs38_64mpy || BR2_archs38_full || \
+		BR2_archs4x_rel31 || BR2_archs4x
+	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	select BR2_USE_WCHAR
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+
+config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARCHS_GLIBC
+	bool "Linux/glibc ARC HS"
+	depends on BR2_archs38_64mpy || BR2_archs38_full || \
+		BR2_archs4x_rel31 || BR2_archs4x
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+
+endchoice
+
 config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "arc-linux"		 if BR2_arcle
 	default "arceb-linux"		 if BR2_arceb
diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash b/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash
index 3c22723833..52273871ab 100644
--- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash
+++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash
@@ -1,5 +1,7 @@
-# From https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2019.09-release
-sha256  f7cbf68ef251943db7baf63535e0ec98dafbdf5d925017b4e1d4fc64d9b38a26  arc_gnu_2019.09_prebuilt_uclibc_le_arc700_linux_install.tar.gz
-sha256  ac09f0a21f9d50146a5e542f4a6abc93e5a1dcb0a1372cb5c3ba86bbefaaec7d  arc_gnu_2019.09_prebuilt_uclibc_be_arc700_linux_install.tar.gz
-sha256  245ca49fe8ea2456617541b18bb96e52e6c0dc619f00e293fcaad519fc436c35  arc_gnu_2019.09_prebuilt_uclibc_le_archs_linux_install.tar.gz
-sha256  6f039a0158c03af398ada31fae96009e47f0d7b7f7d52e12eb419492fc3f27e7  arc_gnu_2019.09_prebuilt_uclibc_be_archs_linux_install.tar.gz
+# From https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2024.06-release
+sha256  080bbf8c0747d221314d04b0fcef89f91dc82710afa1aa66a88f04c93719663a  arc_gnu_2024.06_prebuilt_uclibc_le_arc700_linux_install.tar.bz2
+sha256  37ad59b2624608cd126fab3a83a188edc18ad9e2bba8bbb778d46cdd49ad2ffe  arc_gnu_2024.06_prebuilt_glibc_le_archs_linux_install.tar.bz2
+sha256  6867bc6f895c29b053020423923ead2054b8474816f1d067f2726b13e8ee16c0  arc_gnu_2024.06_prebuilt_uclibc_le_archs_linux_install.tar.bz2
+sha256  6efd9025e4b226bf1b4a4d448670e00f928e61e0051a0b209b7adaa327945a32  arc_gnu_2024.06_prebuilt_uclibc_be_arc700_linux_install.tar.bz2
+sha256  ae2ffb5fbe8d6002341dd87d005400010e85dfc1df1e8db070a19ab7300d738f  arc_gnu_2024.06_prebuilt_glibc_be_archs_linux_install.tar.bz2
+sha256  892a576acdf962afafde345d2c830317cb14ff8ef95da7cadc79177c226db269  arc_gnu_2024.06_prebuilt_uclibc_be_archs_linux_install.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk b/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk
index c8f141e45d..c88ca35c43 100644
--- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk
+++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk
@@ -4,13 +4,18 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_VERSION = 2019.09
+TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_VERSION = 2024.06
 TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_SITE = https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/download/arc-$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_VERSION)-release
 
-ifeq ($(BR2_arc750d)$(BR2_arc770d),y)
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC700),y)
 TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_CORE = arc700
-else
+TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_LIBC = uclibc
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARCHS_UCLIBC),y)
+TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_CORE = archs
+TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_LIBC = uclibc
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARCHS_GLIBC),y)
 TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_CORE = archs
+TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_LIBC = glibc
 endif
 
 ifeq ($(BR2_arcle),y)
@@ -19,6 +24,6 @@ else
 TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_ENDIANESS = be
 endif
 
-TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_SOURCE = arc_gnu_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_VERSION)_prebuilt_uclibc_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_ENDIANESS)_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_CORE)_linux_install.tar.gz
+TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_SOURCE = arc_gnu_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_VERSION)_prebuilt_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_LIBC)_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_ENDIANESS)_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_CORE)_linux_install.tar.bz2
 
 $(eval $(toolchain-external-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
