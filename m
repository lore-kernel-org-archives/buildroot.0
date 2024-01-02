Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD561C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 22:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EADB60FCF;
	Tue,  2 Jan 2024 22:40:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EADB60FCF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BrtknzRyHLRg; Tue,  2 Jan 2024 22:40:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E94960FD3;
	Tue,  2 Jan 2024 22:40:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E94960FD3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 32DB31BF966
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08D284014B
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:39:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08D284014B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BpknYWuI02mP for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 22:39:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6A52400CB
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 22:39:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6A52400CB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A0EAA83E54; Tue,  2 Jan 2024 22:39:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jan 2024 23:34:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 52d405de45d77a737a78fdc3340df0cf32610903
X-Git-Newrev: ea45b95c0e54866134c63e88e60489a012b3d134
X-Patchwork-Hint: ignore
Message-Id: <20240102223939.A0EAA83E54@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-grpcio: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=ea45b95c0e54866134c63e88e60489a012b3d134
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                        |  1 +
 package/python-grpcio/Config.in          |  6 ++++++
 package/python-grpcio/python-grpcio.hash |  5 +++++
 package/python-grpcio/python-grpcio.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index d5d89c50aa..69516c8705 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1105,6 +1105,7 @@ menu "External python modules"
 	source "package/python-gobject/Config.in"
 	source "package/python-gpiozero/Config.in"
 	source "package/python-greenlet/Config.in"
+	source "package/python-grpcio/Config.in"
 	source "package/python-gunicorn/Config.in"
 	source "package/python-h11/Config.in"
 	source "package/python-h2/Config.in"
diff --git a/package/python-grpcio/Config.in b/package/python-grpcio/Config.in
new file mode 100644
index 0000000000..e63ac2ae34
--- /dev/null
+++ b/package/python-grpcio/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_GRPCIO
+	bool "python-grpcio"
+	help
+	  HTTP/2-based RPC framework.
+
+	  https://grpc.io
diff --git a/package/python-grpcio/python-grpcio.hash b/package/python-grpcio/python-grpcio.hash
new file mode 100644
index 0000000000..39366f576e
--- /dev/null
+++ b/package/python-grpcio/python-grpcio.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/grpcio/json
+md5  480bfb7435426de392a883e6516aae79  grpcio-1.60.0.tar.gz
+sha256  2199165a1affb666aa24adf0c97436686d0a61bc5fc113c037701fb7c7fceb96  grpcio-1.60.0.tar.gz
+# Locally computed sha256 checksums
+sha256  590198e3f305f2c347fde64d637c65492bbef554db6c8364e149cd375e3797ee  LICENSE
diff --git a/package/python-grpcio/python-grpcio.mk b/package/python-grpcio/python-grpcio.mk
new file mode 100644
index 0000000000..3d264de4af
--- /dev/null
+++ b/package/python-grpcio/python-grpcio.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-grpcio
+#
+################################################################################
+
+PYTHON_GRPCIO_VERSION = 1.60.0
+PYTHON_GRPCIO_SOURCE = grpcio-$(PYTHON_GRPCIO_VERSION).tar.gz
+PYTHON_GRPCIO_SITE = https://files.pythonhosted.org/packages/61/38/c615b5c2be690fb31871f294cc08a96e598b085b8d07c5967a5018e0b90c
+PYTHON_GRPCIO_SETUP_TYPE = setuptools
+PYTHON_GRPCIO_LICENSE = Apache-2.0
+PYTHON_GRPCIO_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
