Return-Path: <SRS0=tQX8=NU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6748CC432BE
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 16:54:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 289A960F23
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 16:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 289A960F23
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB98340104;
	Sun, 29 Aug 2021 16:54:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T7iSSNyv0ues; Sun, 29 Aug 2021 16:54:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF3CC40108;
	Sun, 29 Aug 2021 16:54:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2D3C01BF298
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 16:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18F1E40108
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 16:53:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZZT52rc6pAox for <buildroot@lists.busybox.net>;
 Sun, 29 Aug 2021 16:53:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB49E40104
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 16:53:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id AAB1187598; Sun, 29 Aug 2021 16:51:58 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 29 Aug 2021 18:29:23 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 62b135af5e1e2ad9ea38e33125b40b3ed074cf57
X-Git-Newrev: dd1621b067cf2569198227a25080a127a05f7dc4
X-Patchwork-Hint: ignore
Message-Id: <20210829165158.AAB1187598@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qt5/qt5opcua: new
 package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=dd1621b067cf2569198227a25080a127a05f7dc4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The Qt OPC UA module implements a Qt API to interact with OPC UA on
top of a 3rd party OPC UA stack.
The default is open62541, which is bundled by qt5opcua in version 1.0,
so we dont need to provide/depend on br's own open62541 package.

Another dependency is mbedtls, but it's optional.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                         |  1 +
 package/qt5/Config.in              |  1 +
 package/qt5/qt5opcua/Config.in     |  9 +++++++++
 package/qt5/qt5opcua/qt5opcua.hash | 10 ++++++++++
 package/qt5/qt5opcua/qt5opcua.mk   | 19 +++++++++++++++++++
 5 files changed, 40 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 66c5a6703c..1bc4a1370c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1962,6 +1962,7 @@ N:	Naumann Andreas <ANaumann@ultratronik.de>
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
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
