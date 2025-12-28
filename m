Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77730E784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 13:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17A8C40565;
	Sun, 28 Dec 2025 13:20:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NagQaL8Td-6T; Sun, 28 Dec 2025 13:20:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29C1140566
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766928028;
	bh=KYR7fMJxjpLEbPKEdPfm38A1C0tUiEVp3FDV4n1rnkE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JEIJg5oTOi70bfC2f0VHAOiSi6gcnSdD2bnXqFzjwahtZPzTb+cySYbyHTGiJQ2bl
	 iXcrGhrsxyL6RsQUatOkrBRDfBTO+icvK9R+6At7+U0c/0Nk/cN2XcA+4VL2r9DfM4
	 3YktCGhCEsmkmextMnkCfAevuxXj5QRvatledIEWz7y2eGLLA+JbVWjdkWw8ttS/zu
	 UeWxrdnSLjoHDAWnjFwXleMf/kFz7bPLQ/tRPhB+BphkOz5/nKcy0GDPJTvx/VzSm2
	 O2ZuOo6BV8nvv9/RKe+R3CCBU5F/PK+oz4a62b7vq00xyA07bKM0vWRguo2OoEtJ4Q
	 GE2uOT70y96iQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29C1140566;
	Sun, 28 Dec 2025 13:20:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AA2030D
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 13:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2DE5160837
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 13:20:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 14lfUj4IWLSJ for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 13:20:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3752D6075E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3752D6075E
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 13:20:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 23FDA87942; Sun, 28 Dec 2025 13:20:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 14:20:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b42bfbc5e11c638955e2f0619ee888754eb2c627
X-Git-Newrev: fda322795ae91f4d3abb72319d1c7b496bacb6e8
X-Patchwork-Hint: ignore
Message-Id: <20251228132024.23FDA87942@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libyang-cpp: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=fda322795ae91f4d3abb72319d1c7b496bacb6e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add C++ RAII bindings for libyang (v4).

Signed-off-by: Vincent Jardin <vjardin@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/libyang-cpp/Config.in        | 20 ++++++++++++++++++++
 package/libyang-cpp/libyang-cpp.hash |  3 +++
 package/libyang-cpp/libyang-cpp.mk   | 17 +++++++++++++++++
 5 files changed, 42 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 228311beeb..af596a3847 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3360,6 +3360,7 @@ F:	configs/nvidia_bf3_defconfig
 F:	package/bfscripts/
 F:	package/dpdk/
 F:	package/libecoli/
+F:	package/libyang-cpp/
 
 N:	Vincent Prince <vincent.prince.fr@gmail.com>
 F:	package/nss-myhostname/
diff --git a/package/Config.in b/package/Config.in
index 499c59a52e..a663869f6d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2106,6 +2106,7 @@ menu "Networking"
 	source "package/libvncserver/Config.in"
 	source "package/libwebsockets/Config.in"
 	source "package/libyang/Config.in"
+	source "package/libyang-cpp/Config.in"
 	source "package/libzenoh-c/Config.in"
 	source "package/libzenoh-pico/Config.in"
 	source "package/lksctp-tools/Config.in"
diff --git a/package/libyang-cpp/Config.in b/package/libyang-cpp/Config.in
new file mode 100644
index 0000000000..87b31ea713
--- /dev/null
+++ b/package/libyang-cpp/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_LIBYANG_CPP
+	bool "libyang-cpp"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libyang
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libyang
+	depends on !BR2_STATIC_LIBS # libyang
+	select BR2_PACKAGE_LIBYANG
+	help
+	  C++ bindings for the libyang library (v4).
+
+	  libyang-cpp implements modern C++ RAII wrappers around the
+	  libyang C API, used by sysrepo, Kea + NETCONF, etc.
+
+	  https://github.com/CESNET/libyang-cpp
+
+comment "libyang-cpp needs a toolchain w/ threads, dynamic library, C++, gcc >= 10"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_10
diff --git a/package/libyang-cpp/libyang-cpp.hash b/package/libyang-cpp/libyang-cpp.hash
new file mode 100644
index 0000000000..cf4dc8085d
--- /dev/null
+++ b/package/libyang-cpp/libyang-cpp.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  70fd0df940026fb930d5407abe679e064caf4701bff35d79465b9ad2c0915808  libyang-cpp-4.tar.gz
+sha256  82e3758011ec44c78e98d0777799d6e12aec5b8a64b32ebb20d0fe50e32488bb  LICENSE
diff --git a/package/libyang-cpp/libyang-cpp.mk b/package/libyang-cpp/libyang-cpp.mk
new file mode 100644
index 0000000000..5dff240305
--- /dev/null
+++ b/package/libyang-cpp/libyang-cpp.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# libyang-cpp
+#
+################################################################################
+
+LIBYANG_CPP_VERSION = 4
+LIBYANG_CPP_SITE = $(call github,CESNET,libyang-cpp,v$(LIBYANG_CPP_VERSION))
+LIBYANG_CPP_LICENSE = BSD-3-Clause
+LIBYANG_CPP_LICENSE_FILES = LICENSE
+LIBYANG_CPP_INSTALL_STAGING = YES
+LIBYANG_CPP_SUPPORTS_IN_SOURCE_BUILD = NO
+LIBYANG_CPP_DEPENDENCIES = libyang
+
+LIBYANG_CPP_CONF_OPTS = -DWITH_DOCS=OFF
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
