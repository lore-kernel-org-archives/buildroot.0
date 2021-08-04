Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45EC3C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 14:02:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0C5060F14
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 14:02:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A0C5060F14
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ultratronik.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6652F60650;
	Wed,  4 Aug 2021 14:02:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id INY1Ug_sNVSJ; Wed,  4 Aug 2021 14:02:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 095F7608A3;
	Wed,  4 Aug 2021 14:02:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 51FE01BF82C
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 14:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BCB940650
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 14:02:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QFARkxpQMC9f for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 14:02:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from dd5108.kasserver.com (dd5108.kasserver.com [85.13.130.47])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C0DC14062F
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 14:02:36 +0000 (UTC)
Received: from wslxew902.fritz.box (ipb21bd527.dynamic.kabel-deutschland.de
 [178.27.213.39])
 by dd5108.kasserver.com (Postfix) with ESMTPA id 2611D5240FF5;
 Wed,  4 Aug 2021 16:02:34 +0200 (CEST)
From: Andreas Naumann <anaumann@ultratronik.de>
To: buildroot@buildroot.org
Date: Wed,  4 Aug 2021 16:02:11 +0200
Message-Id: <20210804140211.12849-1-anaumann@ultratronik.de>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/qt5/qt5opcua: new package
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Andreas Naumann <anaumann@ultratronik.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

The Qt OPC UA module implements a Qt API to interact with OPC UA on
top of a 3rd party OPC UA stack.
The default is open62541, which is bundled by qt5opcua in version 1.0,
so we dont need to provide/depend on br's own open62541 package.

Another dependency is mbedtls, but it's optional.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 DEVELOPERS                         |  1 +
 package/qt5/Config.in              |  1 +
 package/qt5/qt5opcua/Config.in     |  9 +++++++++
 package/qt5/qt5opcua/qt5opcua.hash | 10 ++++++++++
 package/qt5/qt5opcua/qt5opcua.mk   | 19 +++++++++++++++++++
 5 files changed, 40 insertions(+)
 create mode 100644 package/qt5/qt5opcua/Config.in
 create mode 100644 package/qt5/qt5opcua/qt5opcua.hash
 create mode 100644 package/qt5/qt5opcua/qt5opcua.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1547ff123b..7427f3cc82 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1985,6 +1985,7 @@ N:	Naumann Andreas <ANaumann@ultratronik.de>
 F:	package/evemu/
 F:	package/libevdev/
 F:	package/pkg-qmake.mk
+F:	package/qt5/qt5opcua/
 
 N:	Nicola Di Lieto <nicola.dilieto@gmail.com>
 F:	package/uacme/
diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 6714c6271d..6f2428d800 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -51,6 +51,7 @@ source "package/qt5/qt5location/Config.in"
 source "package/qt5/qt5lottie/Config.in"
 source "package/qt5/qt5mqtt/Config.in"
 source "package/qt5/qt5multimedia/Config.in"
+source "package/qt5/qt5opcua/Config.in"
 source "package/qt5/qt5quickcontrols/Config.in"
 source "package/qt5/qt5quickcontrols2/Config.in"
 source "package/qt5/qt5quicktimeline/Config.in"
diff --git a/package/qt5/qt5opcua/Config.in b/package/qt5/qt5opcua/Config.in
new file mode 100644
index 0000000000..2b0ba37af3
--- /dev/null
+++ b/package/qt5/qt5opcua/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_QT5OPCUA
+	bool "qt5opcua"
+	depends on BR2_PACKAGE_QT5
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  The Qt OPC UA module implements a Qt API to interact with
+	  OPC UA on top of a 3rd party OPC UA stack.
diff --git a/package/qt5/qt5opcua/qt5opcua.hash b/package/qt5/qt5opcua/qt5opcua.hash
new file mode 100644
index 0000000000..e55fb17743
--- /dev/null
+++ b/package/qt5/qt5opcua/qt5opcua.hash
@@ -0,0 +1,10 @@
+# Hash locally calculated
+sha256  562171c6dfd6f4f072316ddb6d7c5bcc8907a68ba31005cb8c20ed75beff34fb  qt5opcua-5.15.2-br1.tar.gz
+
+# Hashes for license files:
+sha256  d93cc415382f0013088fa276d9cf82373badf244c78220a926f15ee46f0fe3c4  LICENSE-CC0
+sha256  f827ad079686ba92cc94811e35492d0e8966f704008b6da9eeda0b659fb58a8d  LICENSE.FDL
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
+sha256  0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
+sha256  6c3f3c31b93985f1b93bfbb35fb609d37281697d0efc220c9f91cf4b59eaabde  LICENSE.GPLv2
+sha256  75d800e60c8d58c2e7f0338e8552ea6123a9ce7e5dd8e1cdf2095e013b737488  LICENSE.LGPLv3
diff --git a/package/qt5/qt5opcua/qt5opcua.mk b/package/qt5/qt5opcua/qt5opcua.mk
new file mode 100644
index 0000000000..a58c4c5e14
--- /dev/null
+++ b/package/qt5/qt5opcua/qt5opcua.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# qt5opcua
+#
+################################################################################
+
+QT5OPCUA_VERSION = $(QT5_VERSION)
+QT5OPCUA_SITE = https://code.qt.io/qt/qtopcua.git
+QT5OPCUA_SITE_METHOD = git
+QT5OPCUA_INSTALL_STAGING = YES
+QT5OPCUA_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs) CC0-1.0
+QT5OPCUA_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL LICENSE-CC0
+QT5OPCUA_SYNC_QT_HEADERS = YES
+
+ifeq ($(BR2_PACKAGE_MBEDTLS),y)
+QT5OPCUA_DEPENDENCIES += mbedtls
+endif
+
+$(eval $(qmake-package))
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
