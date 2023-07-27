Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D1ECEB64DD
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 21:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46B3084019;
	Thu, 27 Jul 2023 21:47:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46B3084019
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0rNbMpuU63bm; Thu, 27 Jul 2023 21:47:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68F7A83F64;
	Thu, 27 Jul 2023 21:47:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68F7A83F64
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ABF801BF414
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 21:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F8D560D94
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 21:47:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F8D560D94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FDHyEezzVu5V for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 21:47:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95A1460C2C
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 21:47:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95A1460C2C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B77283768; Thu, 27 Jul 2023 21:47:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 27 Jul 2023 23:41:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0a4a689e9688120787092286b202fdf5fe89d5bf
X-Git-Newrev: 898cb9681fa767dfdf4f1cfe19ebbf1a5d6c067c
X-Patchwork-Hint: ignore
Message-Id: <20230727214708.7B77283768@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-rpds-py: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=898cb9681fa767dfdf4f1cfe19ebbf1a5d6c067c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/python-rpds-py/Config.in           |  8 ++++++++
 package/python-rpds-py/python-rpds-py.hash |  4 ++++
 package/python-rpds-py/python-rpds-py.mk   | 22 ++++++++++++++++++++++
 5 files changed, 36 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0ff44c195d..afdd5a4065 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1424,6 +1424,7 @@ F:	package/python-pydyf/
 F:	package/python-pypa-build/
 F:	package/python-pyphen/
 F:	package/python-pyproject-hooks/
+F:	package/python-rpds-py/
 F:	package/python-rtoml/
 F:	package/python-selenium/
 F:	package/python-snappy/
diff --git a/package/Config.in b/package/Config.in
index 1237281701..b07d4be98f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1267,6 +1267,7 @@ menu "External python modules"
 	source "package/python-requests-oauthlib/Config.in"
 	source "package/python-requests-toolbelt/Config.in"
 	source "package/python-rfc3987/Config.in"
+	source "package/python-rpds-py/Config.in"
 	source "package/python-rpi-gpio/Config.in"
 	source "package/python-rpi-ws281x/Config.in"
 	source "package/python-rsa/Config.in"
diff --git a/package/python-rpds-py/Config.in b/package/python-rpds-py/Config.in
new file mode 100644
index 0000000000..172c5fd0b6
--- /dev/null
+++ b/package/python-rpds-py/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_RPDS_PY
+	bool "python-rpds-py"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	help
+	  Python bindings to the Rust rpds crate for persistent
+	  data structures.
+
+	  https://github.com/crate-py/rpds
diff --git a/package/python-rpds-py/python-rpds-py.hash b/package/python-rpds-py/python-rpds-py.hash
new file mode 100644
index 0000000000..e42dfbd948
--- /dev/null
+++ b/package/python-rpds-py/python-rpds-py.hash
@@ -0,0 +1,4 @@
+# Locally calculated after vendoring
+sha256  3b1087c3c7d55b8730dfaa539147646292074819295812267832ce5b64a0034c  rpds_py-0.9.2.tar.gz
+# Locally computed sha256 checksums
+sha256  8bcb72c82ea8ae74802293c41d93ad7d51434001b0ae45a603a5af0f507aee0a  LICENSE
diff --git a/package/python-rpds-py/python-rpds-py.mk b/package/python-rpds-py/python-rpds-py.mk
new file mode 100644
index 0000000000..2b5530f237
--- /dev/null
+++ b/package/python-rpds-py/python-rpds-py.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# python-rpds-py
+#
+################################################################################
+
+PYTHON_RPDS_PY_VERSION = 0.9.2
+PYTHON_RPDS_PY_SOURCE = rpds_py-$(PYTHON_RPDS_PY_VERSION).tar.gz
+PYTHON_RPDS_PY_SITE = https://files.pythonhosted.org/packages/da/3c/fa2701bfc5d67f4a23f1f0f4347284c51801e9dbc24f916231c2446647df
+PYTHON_RPDS_PY_SETUP_TYPE = pep517
+PYTHON_RPDS_PY_LICENSE = MIT
+PYTHON_RPDS_PY_LICENSE_FILES = LICENSE
+PYTHON_RPDS_PY_DEPENDENCIES = host-python-maturin
+PYTHON_RPDS_PY_ENV = \
+	$(PKG_CARGO_ENV) \
+	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
+# We need to vendor the Cargo crates at download time
+PYTHON_RPDS_PY_DOWNLOAD_POST_PROCESS = cargo
+PYTHON_RPDS_PY_DOWNLOAD_DEPENDENCIES = host-rustc
+PYTHON_RPDS_PY_DL_ENV = $(PKG_CARGO_ENV)
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
