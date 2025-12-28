Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B85D3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 13:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2CB5811D3;
	Sun, 28 Dec 2025 13:20:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L5An95wcw1mG; Sun, 28 Dec 2025 13:20:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 191B981274
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766928027;
	bh=5udi6Of/gLZ4vbKuadTn9cKvs6rF+WixXTsK6v2hBFQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mt4lOGu2A10vhBmrptsJE6WW4X/FVpy7JLe4V7vDYWueKr3ph8mCBT4dUMdI/uwxF
	 eMrD6/saUF9RtzH/uSHNeF5RAdayilo3gtMq5xWuR+FPXgl0ryOsIb4jVfR6VRSQHm
	 VeoSHgLGxUSU3AP4oj3DQyn6gwE9nWsPGI/q4j276bKlJeZVmvbgf/+hzbYYmlOdcX
	 gZWYxzjBGg3ZporUR0uAnml9g7AqUOeqnTV1C6y2i43CdMGC96pi13IJCvy2D0QIYE
	 Shoffje9s+iC5dtmsEGQoys/S/w83LbsRFF/u9o/3IaVrAodKtCW37A2dLrqpoAn//
	 sqqAPcEhUX8rg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 191B981274;
	Sun, 28 Dec 2025 13:20:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 410CC1E1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 13:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2759C4013E
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 13:20:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sPx7bwczPF7n for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 13:20:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C94A400E7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C94A400E7
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 13:20:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3797987943; Sun, 28 Dec 2025 13:20:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 14:20:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fda322795ae91f4d3abb72319d1c7b496bacb6e8
X-Git-Newrev: adc2d87190e264b9c55474f56994bf36db92e191
X-Patchwork-Hint: ignore
Message-Id: <20251228132024.3797987943@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sysrepo-cpp: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=adc2d87190e264b9c55474f56994bf36db92e191
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a Buildroot package for sysrepo-cpp, providing modern C++ RAII
bindings for the sysrepo YANG datastore library.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/sysrepo-cpp/Config.in        | 29 +++++++++++++++++++++++++++++
 package/sysrepo-cpp/sysrepo-cpp.hash |  3 +++
 package/sysrepo-cpp/sysrepo-cpp.mk   | 19 +++++++++++++++++++
 5 files changed, 53 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index af596a3847..0296a28280 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3361,6 +3361,7 @@ F:	package/bfscripts/
 F:	package/dpdk/
 F:	package/libecoli/
 F:	package/libyang-cpp/
+F:	package/sysrepo-cpp/
 
 N:	Vincent Prince <vincent.prince.fr@gmail.com>
 F:	package/nss-myhostname/
diff --git a/package/Config.in b/package/Config.in
index a663869f6d..297565ab1b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2145,6 +2145,7 @@ menu "Networking"
 	source "package/sofia-sip/Config.in"
 	source "package/sscep/Config.in"
 	source "package/sysrepo/Config.in"
+	source "package/sysrepo-cpp/Config.in"
 	source "package/thrift/Config.in"
 	source "package/usbredir/Config.in"
 	source "package/wampcc/Config.in"
diff --git a/package/sysrepo-cpp/Config.in b/package/sysrepo-cpp/Config.in
new file mode 100644
index 0000000000..8f836e92fe
--- /dev/null
+++ b/package/sysrepo-cpp/Config.in
@@ -0,0 +1,29 @@
+config BR2_PACKAGE_SYSREPO_CPP
+	bool "sysrepo-cpp"
+	depends on BR2_USE_MMU # sysrepo
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # sysrepo
+	depends on !BR2_STATIC_LIBS # sysrepo, libyang-cpp
+	depends on BR2_INSTALL_LIBSTDCPP # sysrepo, libyang-cpp
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # libyang-cpp
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libyang-cpp
+	# std::timespec build issue
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+	select BR2_PACKAGE_SYSREPO
+	select BR2_PACKAGE_LIBYANG_CPP
+	help
+	  C++20 RAII bindings for the sysrepo YANG datastore library.
+
+	  This library provides modern C++ object-oriented bindings on
+	  top of sysrepo, using RAII for automatic lifetime
+	  management.
+
+	  https://github.com/sysrepo/sysrepo-cpp
+
+comment "sysrepo-cpp needs a glibc or musl toolchain w/ NPTL threads, dynamic libs, C++, gcc >= 10"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+		   BR2_STATIC_LIBS || \
+		   !BR2_INSTALL_LIBSTDCPP || \
+		   !BR2_TOOLCHAIN_GCC_AT_LEAST_10 || \
+		   BR2_TOOLCHAIN_USES_UCLIBC
diff --git a/package/sysrepo-cpp/sysrepo-cpp.hash b/package/sysrepo-cpp/sysrepo-cpp.hash
new file mode 100644
index 0000000000..43a1bc439f
--- /dev/null
+++ b/package/sysrepo-cpp/sysrepo-cpp.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  d7fbeaba7f2fdaf70c67cc70f438943eee636b21f08854e58967d0d97801bacc  sysrepo-cpp-6.tar.gz
+sha256  82e3758011ec44c78e98d0777799d6e12aec5b8a64b32ebb20d0fe50e32488bb  LICENSE
diff --git a/package/sysrepo-cpp/sysrepo-cpp.mk b/package/sysrepo-cpp/sysrepo-cpp.mk
new file mode 100644
index 0000000000..f211357abd
--- /dev/null
+++ b/package/sysrepo-cpp/sysrepo-cpp.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# sysrepo-cpp
+#
+################################################################################
+
+SYSREPO_CPP_VERSION = 6
+SYSREPO_CPP_SITE = $(call github,sysrepo,sysrepo-cpp,v$(SYSREPO_CPP_VERSION))
+SYSREPO_CPP_LICENSE = BSD-3-Clause
+SYSREPO_CPP_LICENSE_FILES = LICENSE
+SYSREPO_CPP_INSTALL_STAGING = YES
+SYSREPO_CPP_SUPPORTS_IN_SOURCE_BUILD = NO
+SYSREPO_CPP_DEPENDENCIES = sysrepo libyang-cpp
+
+SYSREPO_CPP_CONF_OPTS += \
+	-DWITH_DOCS=OFF \
+	-DWITH_EXAMPLES=OFF
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
