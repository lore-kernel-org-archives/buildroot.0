Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BC8C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 07:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B39660E90;
	Sun, 24 Jul 2022 07:51:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B39660E90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yQrRCi-kZcnv; Sun, 24 Jul 2022 07:51:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FE0A60FC9;
	Sun, 24 Jul 2022 07:51:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FE0A60FC9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 486DB1BF578
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 07:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2339140156
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 07:51:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2339140156
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VJhPrbRlmD0m for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 07:51:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5170F400C6
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 07:51:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5170F400C6
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A0A3B854E7; Sun, 24 Jul 2022 07:37:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 09:50:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9324dcb40ab6dbaeb8aec02bb192f0eaea115b5d
X-Git-Newrev: 2d991c92f5be6a9a858c8689ea2d927365e9c664
X-Patchwork-Hint: ignore
Message-Id: <20220724073726.A0A3B854E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-maturin: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=2d991c92f5be6a9a858c8689ea2d927365e9c664
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is pep517 pyo3 build backend that's an alternative to
python-setuptools-rust.

Note that maturin itself uses python-setuptools-rust for
bootstrapping.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Tested-by: Graeme Smecher <gsmecher@threespeedlogic.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  1 +
 package/python-maturin/python-maturin.hash |  5 +++++
 package/python-maturin/python-maturin.mk   | 25 +++++++++++++++++++++++++
 3 files changed, 31 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ee836266be..bb840e420a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1348,6 +1348,7 @@ F:	package/python-greenlet/
 F:	package/python-installer/
 F:	package/python-janus/
 F:	package/python-logstash/
+F:	package/python-maturin/
 F:	package/python-multidict/
 F:	package/python-mypy-extensions/
 F:	package/python-pep517/
diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
new file mode 100644
index 0000000000..383dbf8737
--- /dev/null
+++ b/package/python-maturin/python-maturin.hash
@@ -0,0 +1,5 @@
+# Locally calculated after vendoring
+sha256  4ea4f6b02cabffc8b56c488956ad572abfabdce935128007dff48a6e95b553d2  maturin-0.12.20.tar.gz
+# Locally computed sha256 checksums
+sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
+sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
new file mode 100644
index 0000000000..3d5ba70391
--- /dev/null
+++ b/package/python-maturin/python-maturin.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# python-maturin
+#
+################################################################################
+
+PYTHON_MATURIN_VERSION = 0.12.20
+PYTHON_MATURIN_SOURCE = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
+PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/39/ba/fec598956393230341def42367c6ad0efbee6ddc899f8858e5b25a7f37a5
+PYTHON_MATURIN_SETUP_TYPE = setuptools
+PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
+PYTHON_MATURIN_LICENSE_FILES = license-apache license-mit
+HOST_PYTHON_MATURIN_DEPENDENCIES = \
+	host-python-setuptools-rust \
+	host-python-tomli \
+	host-rustc
+HOST_PYTHON_MATURIN_ENV = \
+	$(HOST_PKG_CARGO_ENV) \
+	PYO3_CROSS_LIB_DIR="$(HOST_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
+# We need to vendor the Cargo crates at download time
+PYTHON_MATURIN_DOWNLOAD_POST_PROCESS = cargo
+PYTHON_MATURIN_DOWNLOAD_DEPENDENCIES = host-rustc
+HOST_PYTHON_MATURIN_DL_ENV = $(HOST_PKG_CARGO_ENV)
+
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
