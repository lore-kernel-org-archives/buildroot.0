Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556FAC636CD
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 13:26:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8FB540255;
	Tue,  7 Feb 2023 13:26:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8FB540255
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wprZLUZ07Tzm; Tue,  7 Feb 2023 13:26:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 563CC4022A;
	Tue,  7 Feb 2023 13:26:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 563CC4022A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 28F9D1BF376
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 13:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02ED741548
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 13:26:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02ED741548
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mKGdImDydSGH for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 13:25:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5C30414C8
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 13:25:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5C30414C8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A176384151; Tue,  7 Feb 2023 13:25:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 13:47:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9aaef2a07780a200512ccadb2381c559c4ffd8e6
X-Git-Newrev: eb013c3757548f3153a9da59906c388d32a376fa
X-Patchwork-Hint: ignore
Message-Id: <20230207132558.A176384151@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-magic-wormhole: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=eb013c3757548f3153a9da59906c388d32a376fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/python-magic-wormhole/Config.in            | 27 ++++++++++++++++++++++
 .../python-magic-wormhole.hash                     |  5 ++++
 .../python-magic-wormhole/python-magic-wormhole.mk | 14 +++++++++++
 5 files changed, 48 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a631c32405..8d1d9340bb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1694,6 +1694,7 @@ F:	package/ptm2human/
 F:	package/python-distro/
 F:	package/python-gnupg/
 F:	package/python-hkdf/
+F:	package/python-magic-wormhole/
 F:	package/python-pyalsa/
 F:	package/python-spake2/
 F:	package/rdma-core/
diff --git a/package/Config.in b/package/Config.in
index ec7a6483f6..cb9a2b829f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1120,6 +1120,7 @@ menu "External python modules"
 	source "package/python-logstash/Config.in"
 	source "package/python-lxml/Config.in"
 	source "package/python-m2crypto/Config.in"
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
