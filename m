Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46BEEC4332F
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 20:32:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E451840B80;
	Tue, 22 Nov 2022 20:32:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E451840B80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NBCvriVtCLam; Tue, 22 Nov 2022 20:32:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3C6B40B78;
	Tue, 22 Nov 2022 20:32:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3C6B40B78
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 00B801BF285
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 20:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D052961166
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 20:32:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D052961166
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lKdCYy2kHMih for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 20:32:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A244961163
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A244961163
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 20:32:13 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.169.84.171])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 9B278B00571;
 Tue, 22 Nov 2022 21:32:05 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 22 Nov 2022 21:31:27 +0100
Message-Id: <20221122203130.184496-4-ju.o@free.fr>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221122203130.184496-1-ju.o@free.fr>
References: <20221122203130.184496-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1669149131;
 bh=72mNZkLEJ6xUcijEWhSZnVLWD9gjPUFrXCGLUbjtFA4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sOleS6QZmmtah26t9xDSgmfM9AKjPrxjCEhkYOBGCJLBBGEdQsScjfkEvBP0ew0yZ
 OqRyKEw6bqOzmHuRgOWrvxhDwnOgCmQF8uHeH4mK+aGPzdwobtodjW5qKQT/R3jL0o
 yklDIUUfFQkSOddjFTl6iNdyYGv1Pjp4st9+AxM2O3eJHlQhyW2Eyqer+RbLf06KPy
 hJAtzUECia2qk6VRT4o1nkaZhlC5CRsRCpiXAT6/Kbmj/z4uprs6q64AlCeLNWRRuR
 L/+nhBfOwhnRxHcNn82WAfIVgsOTq0BL/Rn0z6xJG+sc5OD+gR/eseXjsVxYnbQ6K0
 6md1TAv2kbvWQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sOleS6QZ
Subject: [Buildroot] [PATCH next v2 4/7] package/python-magic-wormhole: new
 package
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

Securely transfer data between computers.

This package provides a library and a command-line tool named
"wormhole", which makes it possible to get arbitrary-sized files
and directories (or short pieces of text) from one computer to
another. The two endpoints are identified by using identical
"wormhole codes": in general, the sending machine generates and
displays the code, which must then be typed into the receiving
machine.

https://github.com/magic-wormhole/magic-wormhole

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/python-magic-wormhole/Config.in       | 27 +++++++++++++++++++
 .../python-magic-wormhole.hash                |  5 ++++
 .../python-magic-wormhole.mk                  | 14 ++++++++++
 5 files changed, 48 insertions(+)
 create mode 100644 package/python-magic-wormhole/Config.in
 create mode 100644 package/python-magic-wormhole/python-magic-wormhole.hash
 create mode 100644 package/python-magic-wormhole/python-magic-wormhole.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 8807f13aae..b898d3a70b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1695,6 +1695,7 @@ F:	package/ptm2human/
 F:	package/python-distro/
 F:	package/python-gnupg/
 F:	package/python-hkdf/
+F:	package/python-magic-wormhole/
 F:	package/python-pyalsa/
 F:	package/python-spake2/
 F:	package/riscv-isa-sim/
diff --git a/package/Config.in b/package/Config.in
index 9c476d9407..302ffbe4cb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1109,6 +1109,7 @@ menu "External python modules"
 	source "package/python-lxml/Config.in"
 	source "package/python-m2crypto/Config.in"
 	source "package/python-m2r/Config.in"
+	source "package/python-magic-wormhole/Config.in"
 	source "package/python-mako/Config.in"
 	source "package/python-markdown/Config.in"
 	source "package/python-markdown2/Config.in"
diff --git a/package/python-magic-wormhole/Config.in b/package/python-magic-wormhole/Config.in
new file mode 100644
index 0000000000..e8429d203b
--- /dev/null
+++ b/package/python-magic-wormhole/Config.in
@@ -0,0 +1,27 @@
+config BR2_PACKAGE_PYTHON_MAGIC_WORMHOLE
+	bool "python-magic-wormhole"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-autobahn -> python-cryptography
+	select BR2_PACKAGE_PYTHON_ATTRS # runtime
+	select BR2_PACKAGE_PYTHON_AUTOBAHN # runtime
+	select BR2_PACKAGE_PYTHON_AUTOMAT # runtime
+	select BR2_PACKAGE_PYTHON_CLICK # runtime
+	select BR2_PACKAGE_PYTHON_HKDF # runtime
+	select BR2_PACKAGE_PYTHON_HUMANIZE # runtime
+	select BR2_PACKAGE_PYTHON_PYNACL # runtime
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	select BR2_PACKAGE_PYTHON_SPAKE2 # runtime
+	select BR2_PACKAGE_PYTHON_TQDM # runtime
+	select BR2_PACKAGE_PYTHON_TWISTED # runtime
+	select BR2_PACKAGE_PYTHON_TXTORCON # runtime
+	help
+	  Securely transfer data between computers.
+
+	  This package provides a library and a command-line tool
+	  named "wormhole", which makes it possible to get
+	  arbitrary-sized files and directories (or short pieces of
+	  text) from one computer to another. The two endpoints are
+	  identified by using identical "wormhole codes": in general,
+	  the sending machine generates and displays the code, which
+	  must then be typed into the receiving machine.
+
+	  https://github.com/magic-wormhole/magic-wormhole
diff --git a/package/python-magic-wormhole/python-magic-wormhole.hash b/package/python-magic-wormhole/python-magic-wormhole.hash
new file mode 100644
index 0000000000..5e880d5427
--- /dev/null
+++ b/package/python-magic-wormhole/python-magic-wormhole.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/magic-wormhole/json
+md5  ca190d92f56fe32ec8dfd4fc5aab8337  magic-wormhole-0.12.0.tar.gz
+sha256  1b0fd8a334da978f3dd96b620fa9b9348cabedf26a87f74baac7a37052928160  magic-wormhole-0.12.0.tar.gz
+# Locally computed sha256 checksums
+sha256  4a9cc2415c52cef591b6822eee68fed36d7e6d80284b09638cff61d762d99060  LICENSE
diff --git a/package/python-magic-wormhole/python-magic-wormhole.mk b/package/python-magic-wormhole/python-magic-wormhole.mk
new file mode 100644
index 0000000000..91f0f826d5
--- /dev/null
+++ b/package/python-magic-wormhole/python-magic-wormhole.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-magic-wormhole
+#
+################################################################################
+
+PYTHON_MAGIC_WORMHOLE_VERSION = 0.12.0
+PYTHON_MAGIC_WORMHOLE_SOURCE = magic-wormhole-$(PYTHON_MAGIC_WORMHOLE_VERSION).tar.gz
+PYTHON_MAGIC_WORMHOLE_SITE = https://files.pythonhosted.org/packages/d4/62/5e4a86f7c4b111e016577f1b304063ebe604f430db15465ac58b13993608
+PYTHON_MAGIC_WORMHOLE_SETUP_TYPE = setuptools
+PYTHON_MAGIC_WORMHOLE_LICENSE = MIT
+PYTHON_MAGIC_WORMHOLE_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
