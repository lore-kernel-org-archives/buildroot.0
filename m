Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C28FC4332F
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 20:32:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D4A541902;
	Tue, 22 Nov 2022 20:32:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D4A541902
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yWvHQuzFWCb0; Tue, 22 Nov 2022 20:32:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7E2541903;
	Tue, 22 Nov 2022 20:32:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7E2541903
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C2A031BF285
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 20:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B15461169
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 20:32:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B15461169
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NBsX2hQYUq-3 for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 20:32:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CCD961035
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8CCD961035
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 20:32:19 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.169.84.171])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id BD76EB0052C;
 Tue, 22 Nov 2022 21:32:11 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 22 Nov 2022 21:31:28 +0100
Message-Id: <20221122203130.184496-5-ju.o@free.fr>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221122203130.184496-1-ju.o@free.fr>
References: <20221122203130.184496-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1669149137;
 bh=EHfEpGjtqFVlvQREmSPr0uA4CRD2F2Xl5r3qo+xC2xc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZetJScpxOs0dJ8l9F05YRE7N/mkzG3vxfXnd824s56CEZr+Qfbp41dQtKVQnpAx08
 meCw3flk6ah4utWp8b7m8zXyU3GRU1zq/b/7dlAIc7dW4FG83k/WjL4rdaWjOCMxIf
 a/YcX4Qknd0gStTy2ZnRKfr8k68/L17zgKwtf32InPpJYjx1l//ghhPOfwfEbvhh9h
 p9kP7+6VElo+RCfAzHfrmNcXFkR7xGA1xVbU2Fnd50m+kc3vYXwW4Yol/15OwGdQOe
 sMragMpDk5CbjEnHV2HQoN1vwLCclowvtD3/QilIy3qfDXbF0QS/aLtlw6LlYQJuK9
 cJYl2ISFR418A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZetJScpx
Subject: [Buildroot] [PATCH next v2 5/7]
 package/python-magic-wormhole-mailbox-server: new package
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
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package is the main server that Magic-Wormhole clients connect to.
The server performs store-and-forward delivery for small key-exchange
and control messages. Bulk data is sent over a direct TCP connection,
or through a transit-relay.

https://github.com/magic-wormhole/magic-wormhole-mailbox-server

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...the-U-open-mode-removed-in-Python-3..patch | 38 +++++++++++++++++++
 .../Config.in                                 | 15 ++++++++
 .../python-magic-wormhole-mailbox-server.hash |  5 +++
 .../python-magic-wormhole-mailbox-server.mk   | 14 +++++++
 6 files changed, 74 insertions(+)
 create mode 100644 package/python-magic-wormhole-mailbox-server/0001-setup.py-remove-the-U-open-mode-removed-in-Python-3..patch
 create mode 100644 package/python-magic-wormhole-mailbox-server/Config.in
 create mode 100644 package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.hash
 create mode 100644 package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b898d3a70b..5497eb412c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1696,6 +1696,7 @@ F:	package/python-distro/
 F:	package/python-gnupg/
 F:	package/python-hkdf/
 F:	package/python-magic-wormhole/
+F:	package/python-magic-wormhole-mailbox-server/
 F:	package/python-pyalsa/
 F:	package/python-spake2/
 F:	package/riscv-isa-sim/
diff --git a/package/Config.in b/package/Config.in
index 302ffbe4cb..0d95225080 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1110,6 +1110,7 @@ menu "External python modules"
 	source "package/python-m2crypto/Config.in"
 	source "package/python-m2r/Config.in"
 	source "package/python-magic-wormhole/Config.in"
+	source "package/python-magic-wormhole-mailbox-server/Config.in"
 	source "package/python-mako/Config.in"
 	source "package/python-markdown/Config.in"
 	source "package/python-markdown2/Config.in"
diff --git a/package/python-magic-wormhole-mailbox-server/0001-setup.py-remove-the-U-open-mode-removed-in-Python-3..patch b/package/python-magic-wormhole-mailbox-server/0001-setup.py-remove-the-U-open-mode-removed-in-Python-3..patch
new file mode 100644
index 0000000000..bf98537ae8
--- /dev/null
+++ b/package/python-magic-wormhole-mailbox-server/0001-setup.py-remove-the-U-open-mode-removed-in-Python-3..patch
@@ -0,0 +1,38 @@
+From df6126ee86c1f84c7e0c25fcf69543b83b1b32c6 Mon Sep 17 00:00:00 2001
+From: Julien Olivain <ju.o@free.fr>
+Date: Sat, 5 Nov 2022 13:06:07 +0100
+Subject: [PATCH] setup.py: remove the 'U' open mode removed in Python 3.11
+
+The 'U' open mode was removed in Python 3.11. See:
+https://docs.python.org/3.11/library/functions.html#open
+
+Installing with Python 3.11 fails with:
+
+    /path/to/python-magic-wormhole-mailbox-server-0.4.1/setup.py", line 20, in <module>
+        long_description=open('README.md', 'rU').read(),
+                         ^^^^^^^^^^^^^^^^^^^^^^^
+    ValueError: invalid mode: 'rU'
+
+This patch removes the 'U' open mode.
+
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 6ef292f..ad9ff5a 100644
+--- a/setup.py
++++ b/setup.py
+@@ -17,7 +17,7 @@ trove_classifiers = [
+ setup(name="magic-wormhole-mailbox-server",
+       version=versioneer.get_version(),
+       description="Securely transfer data between computers",
+-      long_description=open('README.md', 'rU').read(),
++      long_description=open('README.md', 'r').read(),
+       long_description_content_type='text/markdown',
+       author="Brian Warner",
+       author_email="warner-magic-wormhole@lothar.com",
+-- 
+2.38.1
+
diff --git a/package/python-magic-wormhole-mailbox-server/Config.in b/package/python-magic-wormhole-mailbox-server/Config.in
new file mode 100644
index 0000000000..db20d3e7b6
--- /dev/null
+++ b/package/python-magic-wormhole-mailbox-server/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER
+	bool "python-magic-wormhole-mailbox-server"
+	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
+	select BR2_PACKAGE_PYTHON_ATTRS # runtime
+	select BR2_PACKAGE_PYTHON_AUTOBAHN # runtime
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	select BR2_PACKAGE_PYTHON_TWISTED # runtime
+	help
+	  This package is the main server that Magic-Wormhole clients
+	  connect to. The server performs store-and-forward delivery
+	  for small key-exchange and control messages. Bulk data is
+	  sent over a direct TCP connection, or through a
+	  transit-relay.
+
+	  https://github.com/magic-wormhole/magic-wormhole-mailbox-server
diff --git a/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.hash b/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.hash
new file mode 100644
index 0000000000..c714712641
--- /dev/null
+++ b/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/magic-wormhole-mailbox-server/json
+md5  3da441df1f354a8399a728da3421ac8f  magic-wormhole-mailbox-server-0.4.1.tar.gz
+sha256  1af10592909caaf519c00e706eac842c5e77f8d4356215fe9c61c7b2258a88fb  magic-wormhole-mailbox-server-0.4.1.tar.gz
+# Locally computed sha256 checksums
+sha256  4a9cc2415c52cef591b6822eee68fed36d7e6d80284b09638cff61d762d99060  LICENSE
diff --git a/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.mk b/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.mk
new file mode 100644
index 0000000000..a3394c7dcd
--- /dev/null
+++ b/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-magic-wormhole-mailbox-server
+#
+################################################################################
+
+PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_VERSION = 0.4.1
+PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_SOURCE = magic-wormhole-mailbox-server-$(PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_VERSION).tar.gz
+PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_SITE = https://files.pythonhosted.org/packages/5b/ba/cbb211bc8f8bfdf7fb620d33331f07bcd889c7a28e7fd8a0de9029bb5a2f
+PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_SETUP_TYPE = setuptools
+PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_LICENSE = MIT
+PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
