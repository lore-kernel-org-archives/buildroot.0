Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A06BC433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 20:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2053480F5D;
	Thu, 30 Dec 2021 20:56:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ECKgFrumCz9u; Thu, 30 Dec 2021 20:56:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C9D480DB4;
	Thu, 30 Dec 2021 20:56:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D48A01BF361
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3FBA40442
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:56:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pcbARjVUiXwg for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 20:56:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC0364032C
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 20:56:26 +0000 (UTC)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
 by mailout11.t-online.de (Postfix) with SMTP id 0CD1E159BE;
 Thu, 30 Dec 2021 21:55:46 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.202.128]) by fwd71.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1n32Se-1Nyo7N0; Thu, 30 Dec 2021 21:55:45 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:43666)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1n32Se-0003fx-G7;
 Thu, 30 Dec 2021 21:55:44 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 21:55:42 +0100
Message-Id: <20211230205544.2056341-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211230205544.2056341-1-bernd.kuhls@t-online.de>
References: <20211230205544.2056341-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1640897745-00001674-7278697E/0/0 CLEAN NORMAL
X-TOI-MSGID: 318c9e36-c12b-4af5-b5b3-b700ff1133f3
Subject: [Buildroot] [PATCH 2/4] package/libexecinfo: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Provides execinfo.h for non-glibc toolchains.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                    |  1 +
 package/libexecinfo/Config.in        |  7 +++++++
 package/libexecinfo/libexecinfo.hash |  3 +++
 package/libexecinfo/libexecinfo.mk   | 30 ++++++++++++++++++++++++++++
 4 files changed, 41 insertions(+)
 create mode 100644 package/libexecinfo/Config.in
 create mode 100644 package/libexecinfo/libexecinfo.hash
 create mode 100644 package/libexecinfo/libexecinfo.mk

diff --git a/package/Config.in b/package/Config.in
index 8c336ba85a..fb56c9ce75 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1966,6 +1966,7 @@ menu "Other"
 	source "package/libev/Config.in"
 	source "package/libevdev/Config.in"
 	source "package/libevent/Config.in"
+	source "package/libexecinfo/Config.in"
 	source "package/libffi/Config.in"
 	source "package/libgee/Config.in"
 	source "package/libgeos/Config.in"
diff --git a/package/libexecinfo/Config.in b/package/libexecinfo/Config.in
new file mode 100644
index 0000000000..473a4f7181
--- /dev/null
+++ b/package/libexecinfo/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBEXECINFO
+	bool "libexecinfo"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
+	help
+	  Library for inspecting program's backtrace
+
+	  https://github.com/mikroskeem/libexecinfo
diff --git a/package/libexecinfo/libexecinfo.hash b/package/libexecinfo/libexecinfo.hash
new file mode 100644
index 0000000000..4719b7699e
--- /dev/null
+++ b/package/libexecinfo/libexecinfo.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  0462304192fab38c39a376594db1c8bdab4ebda2736bf54f01715917f430611e  libexecinfo-1.1-3.tar.gz
+sha256  46fbc8e6849a164c4ba8fd5875748bde302bf3cd713622af0e51b4e10344f516  execinfo.h
diff --git a/package/libexecinfo/libexecinfo.mk b/package/libexecinfo/libexecinfo.mk
new file mode 100644
index 0000000000..85f4fd8c10
--- /dev/null
+++ b/package/libexecinfo/libexecinfo.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# libexecinfo
+#
+################################################################################
+
+LIBEXECINFO_VERSION = 1.1-3
+LIBEXECINFO_SITE = $(call github,mikroskeem,libexecinfo,$(LIBEXECINFO_VERSION))
+LIBEXECINFO_LICENSE = BSD-2-Clause
+LIBEXECINFO_LICENSE_FILES = execinfo.h
+LIBEXECINFO_INSTALL_STAGING = YES
+
+define LIBEXECINFO_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+		EXECINFO_CFLAGS="$(TARGET_CFLAGS) -c"
+endef
+
+define LIBEXECINFO_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+		EXECINFO_CFLAGS="$(TARGET_CFLAGS) -c" \
+		DESTDIR="$(STAGING_DIR)" PREFIX=/usr install
+endef
+
+define LIBEXECINFO_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+		EXECINFO_CFLAGS="$(TARGET_CFLAGS) -c" \
+		DESTDIR="$(TARGET_DIR)" PREFIX=/usr install
+endef
+
+$(eval $(generic-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
