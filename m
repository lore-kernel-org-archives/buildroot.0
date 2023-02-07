Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 426AFC636CD
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 13:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAEAF40255;
	Tue,  7 Feb 2023 13:26:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAEAF40255
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nQyayKVyG0i5; Tue,  7 Feb 2023 13:26:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59BBC40908;
	Tue,  7 Feb 2023 13:26:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59BBC40908
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 852331BF376
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 13:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C50B414C8
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 13:26:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C50B414C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iYla5CY4XzaQ for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 13:25:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF02041523
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 13:25:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF02041523
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF82B84153; Tue,  7 Feb 2023 13:25:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 13:54:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb013c3757548f3153a9da59906c388d32a376fa
X-Git-Newrev: 9244052f28d87d6d85b73402e7d15f730eb66c4b
X-Patchwork-Hint: ignore
Message-Id: <20230207132558.AF82B84153@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9244052f28d87d6d85b73402e7d15f730eb66c4b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package is the main server that Magic-Wormhole clients connect to.
The server performs store-and-forward delivery for small key-exchange
and control messages. Bulk data is sent over a direct TCP connection,
or through a transit-relay.

https://github.com/magic-wormhole/magic-wormhole-mailbox-server

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 ...move-the-U-open-mode-removed-in-Python-3..patch | 39 ++++++++++++++++++++++
 .../python-magic-wormhole-mailbox-server/Config.in | 15 +++++++++
 .../python-magic-wormhole-mailbox-server.hash      |  5 +++
 .../python-magic-wormhole-mailbox-server.mk        | 14 ++++++++
 6 files changed, 75 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8d1d9340bb..afc079a609 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1695,6 +1695,7 @@ F:	package/python-distro/
 F:	package/python-gnupg/
 F:	package/python-hkdf/
 F:	package/python-magic-wormhole/
+F:	package/python-magic-wormhole-mailbox-server/
 F:	package/python-pyalsa/
 F:	package/python-spake2/
 F:	package/rdma-core/
diff --git a/package/Config.in b/package/Config.in
index cb9a2b829f..2ef403168a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1121,6 +1121,7 @@ menu "External python modules"
 	source "package/python-lxml/Config.in"
 	source "package/python-m2crypto/Config.in"
 	source "package/python-magic-wormhole/Config.in"
+	source "package/python-magic-wormhole-mailbox-server/Config.in"
 	source "package/python-mako/Config.in"
 	source "package/python-markdown/Config.in"
 	source "package/python-markdown2/Config.in"
diff --git a/package/python-magic-wormhole-mailbox-server/0001-setup.py-remove-the-U-open-mode-removed-in-Python-3..patch b/package/python-magic-wormhole-mailbox-server/0001-setup.py-remove-the-U-open-mode-removed-in-Python-3..patch
new file mode 100644
index 0000000000..8afe7c9546
--- /dev/null
+++ b/package/python-magic-wormhole-mailbox-server/0001-setup.py-remove-the-U-open-mode-removed-in-Python-3..patch
@@ -0,0 +1,39 @@
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
+Upstream: https://github.com/magic-wormhole/magic-wormhole-mailbox-server/commit/df6126ee86c1f84c7e0c25fcf69543b83b1b32c6
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
