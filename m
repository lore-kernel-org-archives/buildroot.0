Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BC05C433F5
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 11:11:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06E2C610E9
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 11:11:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 06E2C610E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB8FE82741;
	Sat,  6 Nov 2021 11:11:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wR2v2pvhl316; Sat,  6 Nov 2021 11:11:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21225825CA;
	Sat,  6 Nov 2021 11:11:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0DBD71BF83E
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 11:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09A71400CC
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 11:11:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iz-0KhUjoJVW for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 11:11:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B365F40010
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 11:11:49 +0000 (UTC)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
 by mailout10.t-online.de (Postfix) with SMTP id C287CFBB0;
 Sat,  6 Nov 2021 12:11:46 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.204.142]) by fwd83.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mjJbu-24FwIr0; Sat, 6 Nov 2021 12:11:46 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:40884)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mjJbt-0001oX-RU;
 Sat, 06 Nov 2021 12:11:46 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  6 Nov 2021 12:11:43 +0100
Message-Id: <20211106111145.1648068-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1636197106-00001454-E6BC7669/0/0 CLEAN NORMAL
X-TOI-MSGID: 159266a2-4ec1-4b70-98fe-80685eec6ce8
Subject: [Buildroot] [PATCH 1/3] package/libks: new package
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
Cc: Gregory Dymarek <gregd72002@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Needed to bump freeswitch to 1.10.7.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/libks/Config.in  | 17 +++++++++++++++++
 package/libks/libks.hash |  3 +++
 package/libks/libks.mk   | 14 ++++++++++++++
 5 files changed, 36 insertions(+)
 create mode 100644 package/libks/Config.in
 create mode 100644 package/libks/libks.hash
 create mode 100644 package/libks/libks.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index cae9e27a65..56b1a4601f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -367,6 +367,7 @@ F:	package/libglfw/
 F:	package/libglu/
 F:	package/libhdhomerun/
 F:	package/libilbc/
+F:	package/libks/
 F:	package/libldns/
 F:	package/libmicrohttpd/
 F:	package/libminiupnpc/
diff --git a/package/Config.in b/package/Config.in
index 17204504a4..bcc1e3e737 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1955,6 +1955,7 @@ menu "Other"
 	source "package/libglob/Config.in"
 	source "package/libical/Config.in"
 	source "package/libite/Config.in"
+	source "package/libks/Config.in"
 	source "package/liblinear/Config.in"
 	source "package/libloki/Config.in"
 	source "package/libnpth/Config.in"
diff --git a/package/libks/Config.in b/package/libks/Config.in
new file mode 100644
index 0000000000..b3252db554
--- /dev/null
+++ b/package/libks/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_LIBKS
+	bool "libks"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS # dlfcn.h
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	help
+	  Foundational support for signalwire C products
+
+	  https://github.com/signalwire/libks
+
+comment "libks needs a toolchain w/ C++, threads, dynamic library"
+	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_HAS_THREADS
+
diff --git a/package/libks/libks.hash b/package/libks/libks.hash
new file mode 100644
index 0000000000..5acbcd1ea6
--- /dev/null
+++ b/package/libks/libks.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  73c5751eadad4d3390d61b9765e9b860e0aba7336044ecf8b007dfc1818baa69  libks-1.7.0.tar.gz
+sha256  1d1327f37b58a4c9ce520fcf9dd3f348c7c639229ee7aed41c47164a8f7836cd  copyright
diff --git a/package/libks/libks.mk b/package/libks/libks.mk
new file mode 100644
index 0000000000..adf0107b30
--- /dev/null
+++ b/package/libks/libks.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# libks
+#
+################################################################################
+
+LIBKS_VERSION = 1.7.0
+LIBKS_SITE = $(call github,signalwire,libks,v$(LIBKS_VERSION))
+LIBKS_LICENSE = MIT
+LIBKS_LICENSE_FILES = copyright
+LIBKS_INSTALL_STAGING = YES
+LIBKS_DEPENDENCIES = openssl util-linux
+
+$(eval $(cmake-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
