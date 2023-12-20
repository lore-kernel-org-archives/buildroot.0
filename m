Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0280C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 20:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DB78436E6;
	Wed, 20 Dec 2023 20:58:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DB78436E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4jEO0iX-HG3i; Wed, 20 Dec 2023 20:58:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5114A43706;
	Wed, 20 Dec 2023 20:58:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5114A43706
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D8C5E1BF95D
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 20:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B247241610
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 20:58:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B247241610
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 45wglkRksPXD for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 20:58:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB003415EC
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 20:58:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB003415EC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C825D87C96; Wed, 20 Dec 2023 20:58:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 Dec 2023 21:55:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 36db831321f43746afa336869057d588ce470b84
X-Git-Newrev: 1e7f0794bbb0075285dc3b4dab8484f12adbb886
X-Patchwork-Hint: ignore
Message-Id: <20231220205825.C825D87C96@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-contourpy: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=1e7f0794bbb0075285dc3b4dab8484f12adbb886
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                              |  1 +
 package/python-contourpy/Config.in             |  8 ++++++++
 package/python-contourpy/python-contourpy.hash |  5 +++++
 package/python-contourpy/python-contourpy.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index d3fc4514c4..a91ff8d345 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1030,6 +1030,7 @@ menu "External python modules"
 	source "package/python-configshell-fb/Config.in"
 	source "package/python-constantly/Config.in"
 	source "package/python-construct/Config.in"
+	source "package/python-contourpy/Config.in"
 	source "package/python-couchdb/Config.in"
 	source "package/python-crayons/Config.in"
 	source "package/python-crc16/Config.in"
diff --git a/package/python-contourpy/Config.in b/package/python-contourpy/Config.in
new file mode 100644
index 0000000000..4843884a97
--- /dev/null
+++ b/package/python-contourpy/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_CONTOURPY
+	bool "python-contourpy"
+	select BR2_PACKAGE_PYTHON_PYBIND
+	help
+	  Python library for calculating contours of 2D quadrilateral
+	  grids.
+
+	  https://github.com/contourpy/contourpy
diff --git a/package/python-contourpy/python-contourpy.hash b/package/python-contourpy/python-contourpy.hash
new file mode 100644
index 0000000000..8f23d107ae
--- /dev/null
+++ b/package/python-contourpy/python-contourpy.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/contourpy/json
+md5  cae5b781ade023c01bc1a8a53312f2ac  contourpy-1.1.0.tar.gz
+sha256  e53046c3863828d21d531cc3b53786e6580eb1ba02477e8681009b6aa0870b21  contourpy-1.1.0.tar.gz
+# Locally computed sha256 checksums
+sha256  c2522156ba7d4dfbbec266dfea98bf76a69bc41edb18cad323177fad6b19b35f  LICENSE
diff --git a/package/python-contourpy/python-contourpy.mk b/package/python-contourpy/python-contourpy.mk
new file mode 100644
index 0000000000..f305793cb2
--- /dev/null
+++ b/package/python-contourpy/python-contourpy.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-contourpy
+#
+################################################################################
+
+PYTHON_CONTOURPY_VERSION = 1.1.0
+PYTHON_CONTOURPY_SOURCE = contourpy-$(PYTHON_CONTOURPY_VERSION).tar.gz
+PYTHON_CONTOURPY_SITE = https://files.pythonhosted.org/packages/a7/3b/632c003e1dfbc82d32c0466762f2d2cf139d26032626dc65944e38d0e5b9
+PYTHON_CONTOURPY_LICENSE = BSD-3-Clause
+PYTHON_CONTOURPY_LICENSE_FILES = LICENSE
+PYTHON_CONTOURPY_DEPENDENCIES = python-pybind host-python-meson-python
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
