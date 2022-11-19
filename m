Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98364C433FE
	for <buildroot@archiver.kernel.org>; Sat, 19 Nov 2022 22:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B9EE404EF;
	Sat, 19 Nov 2022 22:43:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B9EE404EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fmx5ItyBhNND; Sat, 19 Nov 2022 22:43:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3175140543;
	Sat, 19 Nov 2022 22:43:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3175140543
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4931C1BF4E7
 for <buildroot@lists.busybox.net>; Sat, 19 Nov 2022 22:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2543860DF9
 for <buildroot@lists.busybox.net>; Sat, 19 Nov 2022 22:43:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2543860DF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fVgoGNAP_tQ7 for <buildroot@lists.busybox.net>;
 Sat, 19 Nov 2022 22:43:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DD3B60D80
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0DD3B60D80
 for <buildroot@buildroot.org>; Sat, 19 Nov 2022 22:43:21 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.167.43.158])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 5065D7802D6;
 Sat, 19 Nov 2022 23:43:14 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 19 Nov 2022 23:42:23 +0100
Message-Id: <20221119224225.589941-5-ju.o@free.fr>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221119224225.589941-1-ju.o@free.fr>
References: <20221119224225.589941-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1668897800;
 bh=hi383xxJkF8j/dPjgvtinnPzgEh1i2FR0Y2v9/w3b1Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mLLACbUCEat43VIBMYDVIbrrtw/jtBtIX2V57jODuMrSrbXDWyPFaosQQvzbyFz7l
 JXHnQsUmkrKOW/JHbfKOoetq1S6LYpPhxDV/dcZsQWEjAJpZt3VhlJGqIkSj0Kgtn7
 YOlQHJl94Pe9VDz/CHxQr/f6a2I32O+pg1moDk4bekj2KFeQAca5JTTjr01NcAnvm1
 VnMPk6X5jcaToleXZ88d2rTcXcClXEv1SqdRs3G1aCTo51r4H22DXO5dvsPen46HGX
 rgWfDo4Z50sjpCZK4nPoVX44UiSS8F60j3571VvGwZZvigMvzFk71NVKeFok3sz6nt
 d6/1rXoF9unhQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mLLACbUC
Subject: [Buildroot] [PATCH next 5/7]
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
index 3d0738b367..b49c58f8d3 100644
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
index 80cb9dc3f2..ee0cf54b7e 100644
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
