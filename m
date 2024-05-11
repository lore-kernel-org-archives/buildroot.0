Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3207C04FFE
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 20:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C9B1423A6;
	Sat, 11 May 2024 20:15:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RY32G7x97CIR; Sat, 11 May 2024 20:15:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46614423A9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46614423A9;
	Sat, 11 May 2024 20:15:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8C9731BF57C
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 20:15:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7986F40449
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 20:15:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0JG0CpsY_MJc for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 20:15:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A025E400E5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A025E400E5
 for <buildroot@buildroot.org>; Sat, 11 May 2024 20:15:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 963ED86FB4; Sat, 11 May 2024 20:15:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 11 May 2024 22:15:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 23d71be5a985a03a3cc29f2507243488889c244c
X-Git-Newrev: 8d5b3aac435880333833d4a3909b1818fe8af045
X-Patchwork-Hint: ignore
Message-Id: <20240511201528.963ED86FB4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tbtools: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=8d5b3aac435880333833d4a3909b1818fe8af045
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a collection of tools for Linux Thunderbolt/USB4 development,
debugging and validation.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Aapo Vienamo <aapo.vienamo@linux.intel.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                 |  3 +++
 package/Config.in          |  1 +
 package/tbtools/Config.in  | 18 ++++++++++++++++++
 package/tbtools/tbtools.mk | 13 +++++++++++++
 4 files changed, 35 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1c0cd336ca..67ce43e9cc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2300,6 +2300,9 @@ N:	Michel Stempin <michel.stempin@wanadoo.fr>
 F:	board/sipeed/licheepi_zero/
 F:	configs/sipeed_licheepi_zero_defconfig
 
+N:	Mika Westerberg <mika.westerberg@linux.intel.com>
+F:	package/tbtools/
+
 N:	Mike Frampton <mikeframpo@gmail.com>
 F:	package/qcom-db410c-firmware/
 
diff --git a/package/Config.in b/package/Config.in
index edc56290ea..2af63c124e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -156,6 +156,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/stress-ng/Config.in"
 	source "package/sysdig/Config.in"
 	source "package/sysprof/Config.in"
+	source "package/tbtools/Config.in"
 	source "package/tcf-agent/Config.in"
 	source "package/trace-cmd/Config.in"
 	source "package/trinity/Config.in"
diff --git a/package/tbtools/Config.in b/package/tbtools/Config.in
new file mode 100644
index 0000000000..9c27bf0e30
--- /dev/null
+++ b/package/tbtools/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_TBTOOLS
+	bool "tbtools"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_PACKAGE_HAS_UDEV
+	# Fails to build on 32-bit systems
+	depends on BR2_ARCH_IS_64
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  tbtools is a collection of tools for Linux Thunderbolt/USB4
+	  development, debugging and validation.
+
+	  https://github.com/intel/tbtools
+
+comment "tbtools needs udev /dev management w/ glibc toolchain"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_ARCH_IS_64
+	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/tbtools/tbtools.mk b/package/tbtools/tbtools.mk
new file mode 100644
index 0000000000..94340616db
--- /dev/null
+++ b/package/tbtools/tbtools.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# tbtools
+#
+################################################################################
+
+TBTOOLS_VERSION = v0.3.2
+TBTOOLS_SITE = $(call github,intel,tbtools,$(TBTOOLS_VERSION))
+TBTOOLS_LICENSE = MIT
+TBTOOLS_LICENSE_FILES = LICENSE
+TBTOOLS_DEPENDENCIES = udev
+
+$(eval $(cargo-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
