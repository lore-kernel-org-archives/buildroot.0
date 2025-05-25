Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD49AC71141
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 08:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3E866166C;
	Thu, 12 Jun 2025 08:40:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XHtX9m6yBopx; Thu, 12 Jun 2025 08:40:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DD3561657
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DD3561657;
	Thu, 12 Jun 2025 08:40:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AA1A1BD
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:39:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6576F4214D
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DH5pZj2KDUtR for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 08:38:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 441C6405A2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 441C6405A2
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 41AAB804B1; Thu, 12 Jun 2025 08:38:29 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 25 May 2025 14:53:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b492372436a17ad626ed2a5eff7a5c4f2ed83605
X-Git-Newrev: 066f6088723f03cc3fec863d0d48a6e9cf214582
X-Patchwork-Hint: ignore
Message-Id: <20250612083829.41AAB804B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uuu: add target support
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

commit: https://git.buildroot.net/buildroot/commit/?id=066f6088723f03cc3fec863d0d48a6e9cf214582
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Amer Alshanawany <amer.alshanawany@openpixelsystems.org>
[Julien:
 - sort Config.in dependencies alphabetically
 - fix "conditional override of variable UUU_CONF_OPTS"
   check-package error
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/Config.in     |  1 +
 package/uuu/Config.in | 23 +++++++++++++++++++++++
 package/uuu/uuu.mk    |  6 ++++++
 3 files changed, 30 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 579b5ffc87..ac8951abc2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2817,6 +2817,7 @@ comment "Utilities"
 	source "package/tini/Config.in"
 	source "package/tmux/Config.in"
 	source "package/ttyd/Config.in"
+	source "package/uuu/Config.in"
 	source "package/which/Config.in"
 	source "package/wlr-randr/Config.in"
 	source "package/wtfutil/Config.in"
diff --git a/package/uuu/Config.in b/package/uuu/Config.in
new file mode 100644
index 0000000000..6085183ea7
--- /dev/null
+++ b/package/uuu/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_UUU
+	bool "uuu"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_WCHAR # libuuu uses wchar_t
+	select BR2_PACKAGE_BZIP2
+	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_TINYXML2
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_ZSTD
+	help
+	  UUU (Universal Update Utility) is Freescale/NXP I.MX Chip
+	  image deploy tool. UUU is an evolution of MFGTools
+	  (aka MFGTools v3).
+
+	  https://github.com/nxp-imx/mfgtools
+
+comment "uuu needs a toolchain w/ C++14, threads, atomic, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_ATOMIC \
+	        || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index 4683cbeec1..93d0b97b13 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -9,6 +9,7 @@ UUU_SOURCE = uuu_source-uuu_$(UUU_VERSION).tar.gz
 UUU_SITE = https://github.com/nxp-imx/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
 UUU_LICENSE_FILES = LICENSE
+UUU_DEPENDENCIES = bzip2 libusb openssl tinyxml2 zlib zstd
 HOST_UUU_DEPENDENCIES = \
 	host-bzip2 \
 	host-libusb \
@@ -17,4 +18,9 @@ HOST_UUU_DEPENDENCIES = \
 	host-zlib \
 	host-zstd
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+UUU_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
+endif
+
+$(eval $(cmake-package))
 $(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
