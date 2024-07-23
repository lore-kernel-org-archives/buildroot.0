Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8D0C3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 10:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 211A24043A;
	Tue, 23 Jul 2024 10:41:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EVNX8LYItDy1; Tue, 23 Jul 2024 10:41:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95A754019E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95A754019E;
	Tue, 23 Jul 2024 10:41:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E506F1BF20F
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 10:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D2A1D60809
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 10:41:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2mhMBZNNWu8c for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 10:41:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.241.56.151;
 helo=mout-p-101.mailbox.org; envelope-from=ruepp.simon@mailbox.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4CC0A607D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CC0A607D5
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4CC0A607D5
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 10:41:11 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4WStwh1JH6z9sQr;
 Tue, 23 Jul 2024 12:41:08 +0200 (CEST)
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 12:32:40 +0200
Message-Id: <20240723103238.704924-1-ruepp.simon@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-ID: f11c640e374c0da9bc9
X-MBO-RS-META: 5ti7rfneotto75uyi11pfwjppxzpunfk
X-Rspamd-Queue-Id: 4WStwh1JH6z9sQr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailbox.org; s=mail20150812; 
 t=1721731268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=WIf0aiCueFl3/XipSGoxFWfZRs8bhMnh76HvBLTM1k8=;
 b=n7HKcoZ/b+j9YGgh2kuHt87BJ2Y8kDQ151FWaAVvOl7GWAdbyCCNlCe/DfZViEHoPXU/7F
 C52VdyE5kvxqlQQVahuc9H6MQeVndctWTPAr1yY0GcOo1Qk5L41EnhqoK54BYsy8HqG/Ol
 fx0Jbwtwm6+phUXHuMD+cxqUzNs0ELJvKD2yUFlg1a0W6uuTvBtGzMNuWTlfu/hLVl6lhS
 6sFuW7/24AaO2XA3dfHsoiqRWsLAs+sx4e1Q34iCveQqJZezLFxzZGYGN5LsxumdUrufHb
 klRzOEsNNBSuVvg6bODGLn0Eqy+sFE/s2v8DVwXrpGOTCTNKlFr8lnudYXluSQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailbox.org; s=mail20150812; 
 t=1721731266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=WIf0aiCueFl3/XipSGoxFWfZRs8bhMnh76HvBLTM1k8=;
 b=of145Uo6WmbM8HkZfRxnZSdWk8SUZjAEJo/MOvWef6oRyxw5RtUZJ8mPDeQJ4HKh8ZCzjY
 1MaMQZVXTgzL8OETLqZkr/wWD6t2jYyV2pGblCx/GCB5evnspYDLWBc29vcFQ23Z7Hinhu
 WtEUNzZ5PeJg1JjW5x5wsIFj5MnOAshn2LfkYhoOSdpMOZVqFKi2+Jqt419fC/bxD8Xe4L
 rE8pX2VZKy2o5townBye7Cm72AK+F6LZGAOKh8sEz1csWj7NO0OYERxss2YvtVKkTjty3D
 MJHjbkE5xNFDl/GS/c0HlLXzlpYHalGsTdP45DCHZegLBjUGKi6/RD39ECBj2g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=mailbox.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=mailbox.org
 header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812
 header.b=n7HKcoZ/; 
 dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org
 header.a=rsa-sha256 header.s=mail20150812 header.b=of145Uo6
Subject: [Buildroot] [PATCH 1/1] package/qt5/qt53d: fix compilation error
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
From: Simon Ruepp via buildroot <buildroot@buildroot.org>
Reply-To: Simon Ruepp <ruepp.simon@mailbox.org>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Simon Ruepp <ruepp.simon@mailbox.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently when building the qt3d package it errors out the following message:
make[5]: *** No rule to make target '/home/sr20608/src/buildroot/output/build/qt53d-9bf4d03e2515f7c454647d54542330b6e90f8191/src/3rdparty/assimp/src/code/Common/Assimp.cpp', needed by '.obj/Assimp.o'.  Stop.

This is because the assimp source files are missing which where previously
part of the qt3d package.
Because of this, the new package qt53d-assimp is introduced to separately
download these files which are then copied into the qt3d sources, similar
on how its done with the qt5webengine and the qt5webengine-chromium.

Signed-off-by: Simon Ruepp <ruepp.simon@mailbox.org>
---
 package/qt5/Config.in                      |  1 +
 package/qt5/qt53d-assimp/Config.in         |  4 ++++
 package/qt5/qt53d-assimp/qt53d-assimp.hash |  5 +++++
 package/qt5/qt53d-assimp/qt53d-assimp.mk   | 15 +++++++++++++++
 package/qt5/qt53d/Config.in                |  1 +
 package/qt5/qt53d/qt53d.mk                 |  8 +++++++-
 6 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 package/qt5/qt53d-assimp/Config.in
 create mode 100644 package/qt5/qt53d-assimp/qt53d-assimp.hash
 create mode 100644 package/qt5/qt53d-assimp/qt53d-assimp.mk

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index f1b16ff39b..879378e057 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -35,6 +35,7 @@ menuconfig BR2_PACKAGE_QT5
 
 if BR2_PACKAGE_QT5
 source "package/qt5/qt53d/Config.in"
+source "package/qt5/qt53d-assimp/Config.in"
 source "package/qt5/qt5base/Config.in"
 source "package/qt5/qt5charts/Config.in"
 source "package/qt5/qt5coap/Config.in"
diff --git a/package/qt5/qt53d-assimp/Config.in b/package/qt5/qt53d-assimp/Config.in
new file mode 100644
index 0000000000..421e424f8d
--- /dev/null
+++ b/package/qt5/qt53d-assimp/Config.in
@@ -0,0 +1,4 @@
+# Not user-selectable, it is only needed to be copied
+# into the qt53d source tree.
+config QT53D_ASSIMP
+	bool
diff --git a/package/qt5/qt53d-assimp/qt53d-assimp.hash b/package/qt5/qt53d-assimp/qt53d-assimp.hash
new file mode 100644
index 0000000000..43f36f7f5c
--- /dev/null
+++ b/package/qt5/qt53d-assimp/qt53d-assimp.hash
@@ -0,0 +1,5 @@
+# Locally calculated:
+sha256  00ec879857f511bed0c8b04ea4e7882a282051ec299245af487183c790e65539  qt3d-assimp-8f0c6b04b2257a520aaab38421b2e090204b69df.tar.bz2
+
+# Hashes for license files:
+sha256  a26ccc3dbf2f58ea99c100945a8a126fa0f9f4d7fd2b49aa8bdb8e09355864d8  LICENSE
diff --git a/package/qt5/qt53d-assimp/qt53d-assimp.mk b/package/qt5/qt53d-assimp/qt53d-assimp.mk
new file mode 100644
index 0000000000..c5211fdd5c
--- /dev/null
+++ b/package/qt5/qt53d-assimp/qt53d-assimp.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# qt53d-assimp
+#
+################################################################################
+
+QT53D_ASSIMP_VERSION = 8f0c6b04b2257a520aaab38421b2e090204b69df
+QT53D_ASSIMP_SITE = $(QT5_SITE)/qtquick3d-assimp/-/archive/$(QT53D_ASSIMP_VERSION)
+QT53D_ASSIMP_SOURCE = qt3d-assimp-$(QT53D_ASSIMP_VERSION).tar.bz2
+QT53D_ASSIMP_INSTALL_TARGET = NO
+
+QT53D_ASSIMP_LICENSE = BSD-3-Clause
+QT53D_ASSIMP_LICENSE_FILES = LICENSE
+
+$(eval $(generic-package))
diff --git a/package/qt5/qt53d/Config.in b/package/qt5/qt53d/Config.in
index 9187bee82b..805dfa2d94 100644
--- a/package/qt5/qt53d/Config.in
+++ b/package/qt5/qt53d/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_QT53D
 	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5DECLARATIVE
 	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
+	select BR2_PACKAGE_QT53D_ASSIMP
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
index 8d9babd704..54f8191fb5 100644
--- a/package/qt5/qt53d/qt53d.mk
+++ b/package/qt5/qt53d/qt53d.mk
@@ -7,7 +7,7 @@
 QT53D_VERSION = 9bf4d03e2515f7c454647d54542330b6e90f8191
 QT53D_SITE = $(QT5_SITE)/qt3d/-/archive/$(QT53D_VERSION)
 QT53D_SOURCE = qt3d-$(QT53D_VERSION).tar.bz2
-QT53D_DEPENDENCIES = qt5declarative
+QT53D_DEPENDENCIES = qt5declarative qt53d-assimp
 QT53D_INSTALL_STAGING = YES
 QT53D_SYNC_QT_HEADERS = YES
 
@@ -18,4 +18,10 @@ endif
 QT53D_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0
 QT53D_LICENSE_FILES = LICENSE.GPL LICENSE.GPLv3 LICENSE.LGPLv3
 
+define QT53D_COPY_ASSIMP
+	rm -rf $(@D)/src/3rdparty/assimp/src
+	cp -a $(QT53D_ASSIMP_DIR) $(@D)/src/3rdparty/assimp/src
+endef
+QT53D_POST_PATCH_HOOKS += QT53D_COPY_ASSIMP
+
 $(eval $(qmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
