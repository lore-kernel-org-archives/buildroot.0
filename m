Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C75C61D97
	for <buildroot@archiver.kernel.org>; Thu, 23 Nov 2023 17:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 316E940148;
	Thu, 23 Nov 2023 17:40:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 316E940148
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kvuxRp5jLtpC; Thu, 23 Nov 2023 17:40:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 204E940590;
	Thu, 23 Nov 2023 17:40:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 204E940590
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 962DC1BF3DD
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 17:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D70E40590
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 17:40:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D70E40590
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BTgPqX4oVSsA for <buildroot@lists.busybox.net>;
 Thu, 23 Nov 2023 17:40:30 +0000 (UTC)
X-Greylist: delayed 3301 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 23 Nov 2023 17:40:30 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2AD8840148
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2AD8840148
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 17:40:29 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4Sblkg5RTtz9srM;
 Thu, 23 Nov 2023 18:40:27 +0100 (CET)
From: Ralf Dragon <hypnotoad@lindra.de>
To: buildroot@buildroot.org
Date: Thu, 23 Nov 2023 18:40:24 +0100
Message-Id: <20231123174024.2435683-1-hypnotoad@lindra.de>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4Sblkg5RTtz9srM
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lindra.de; s=MBO0001; t=1700761227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=oDNSnmYpGSVhx+ZBu2mAiSe+hEYAs3RPgaXyrSImD+o=;
 b=h2EC/BTL6qR0emg4xiqHDLIw0lVOkh7S1wHVTciNxWKl++nZXip0CCHCH5YhOwe4l1UvBl
 x+PMimRKslh6Y5bKGUVVY+tm+rdGJo0QhabjBWLXFf+Mcrg35dV1I2Q+fDlOdylLfSnbDm
 fFrV3Y7ED0zjRm0d8KTcKUoqUutHdERHALqzvsHPotE8n4SIyK1hL4ZxrGfCyBe6lSKbC5
 HcygpKz9KQRTXwtuJUVD/4hJqC/VH6Z0g7lKUmfSvqOKiynFHbs5+kIVEEH/QvF711py3M
 EgdYUE0fL+/Ca+rDm/GDnYQYflHPSE6GOwKY4D/daQusOt1LsVya0F2qzUGFCg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=lindra.de header.i=@lindra.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=h2EC/BTL
Subject: [Buildroot] [PATCH 1/1] python-qt5: add PyQt5.sip module
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
Cc: Ralf Dragon <hypnotoad@lindra.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes the following runtime error when importing PyQt5 in python:

from PyQt5.QtCore import *
ModuleNotFoundError: No module named 'PyQt5.sip'

Signed-off-by: Ralf Dragon <hypnotoad@lindra.de>
---
 package/Config.in                          |  1 +
 package/python-pyqt5/Config.in             |  1 +
 package/python-sip-qt5/Config.in           | 10 ++++++++++
 package/python-sip-qt5/python-sip-qt5.hash |  4 ++++
 package/python-sip-qt5/python-sip-qt5.mk   | 15 +++++++++++++++
 5 files changed, 31 insertions(+)
 create mode 100644 package/python-sip-qt5/Config.in
 create mode 100644 package/python-sip-qt5/python-sip-qt5.hash
 create mode 100644 package/python-sip-qt5/python-sip-qt5.mk

diff --git a/package/Config.in b/package/Config.in
index e9e8d93d6b..1549339ec3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1292,6 +1292,7 @@ menu "External python modules"
 	source "package/python-simplelogging/Config.in"
 	source "package/python-simplesqlite/Config.in"
 	source "package/python-sip/Config.in"
+	source "package/python-sip-qt5/Config.in"
 	source "package/python-six/Config.in"
 	source "package/python-slob/Config.in"
 	source "package/python-smbprotocol/Config.in"
diff --git a/package/python-pyqt5/Config.in b/package/python-pyqt5/Config.in
index 9fa7676f98..479403dfa0 100644
--- a/package/python-pyqt5/Config.in
+++ b/package/python-pyqt5/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_PYTHON_PYQT5
 	bool "python-pyqt5"
 	depends on BR2_PACKAGE_QT5
 	select BR2_PACKAGE_PYTHON_SIP
+	select BR2_PACKAGE_PYTHON_SIP_QT5
 	select BR2_PACKAGE_QT5BASE_GUI
 	help
 	  Python bindings for Qt 5
diff --git a/package/python-sip-qt5/Config.in b/package/python-sip-qt5/Config.in
new file mode 100644
index 0000000000..e52a46a9e5
--- /dev/null
+++ b/package/python-sip-qt5/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_SIP_QT5
+	bool "python-sip-qt5"
+	depends on BR2_PACKAGE_PYTHON_PYQT5
+	depends on BR2_PACKAGE_PYTHON_SIP
+	help
+	  SIP is a tool that makes it very easy to create Python
+	  bindings for C and C++ libraries. It was originally
+	  developed to create PyQt, the Python bindings for the Qt
+	  toolkit, but can be used to create bindings for any C or C++
+	  library.
diff --git a/package/python-sip-qt5/python-sip-qt5.hash b/package/python-sip-qt5/python-sip-qt5.hash
new file mode 100644
index 0000000000..8039cdafd9
--- /dev/null
+++ b/package/python-sip-qt5/python-sip-qt5.hash
@@ -0,0 +1,4 @@
+# from https://pypi.org/project/PyQt5-sip/12.12.1
+
+sha256  8fdc6e0148abd12d977a1d3828e7b79aae958e83c6cb5adae614916d888a6b10  PyQt5_sip-12.12.1.tar.gz
+md5  c2117da3b4c0e081c1c5a9088b8a4d55  PyQt5_sip-12.12.1.tar.gz
diff --git a/package/python-sip-qt5/python-sip-qt5.mk b/package/python-sip-qt5/python-sip-qt5.mk
new file mode 100644
index 0000000000..e71ad9bf5b
--- /dev/null
+++ b/package/python-sip-qt5/python-sip-qt5.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-SIP-QT5
+#
+################################################################################
+
+PYTHON_SIP_QT5_VERSION = 12.12.1
+PYTHON_SIP_QT5_SITE = https://files.pythonhosted.org/packages/c1/61/4055e7a0f36339964956ff415e36f4abf82561904cc49c021da32949fc55
+PYTHON_SIP_QT5_SOURCE = PyQt5_sip-$(PYTHON_SIP_QT5_VERSION).tar.gz
+PYTHON_SIP_QT5_LICENSE = MIT
+PYTHON_SIP_QT5_LICENSE_FILES = LICENSE
+PYTHON_SIP_QT5_SETUP_TYPE = setuptools
+PYTHON_SIP_QT5_DEPENDENCIES += python-sip
+
+$(eval $(python-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
