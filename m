Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A8FC433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 21:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9643540156;
	Sat,  4 Dec 2021 21:24:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hamXDnOWFvIU; Sat,  4 Dec 2021 21:24:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36BC44041B;
	Sat,  4 Dec 2021 21:24:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D38671BF36B
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 21:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C367360A89
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 21:24:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P7A0ccVIy3Lm for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 21:24:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8AA060659
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 21:24:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C8EC69351A; Sat,  4 Dec 2021 21:19:42 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 22:24:28 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3f5f8abd415fbe1fadc8d1358179af684a08f29c
X-Git-Newrev: a2663af3409f8b45ddf6e6935ed9369ca49a3c52
X-Patchwork-Hint: ignore
Message-Id: <20211204211942.C8EC69351A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-fonttools: new
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a2663af3409f8b45ddf6e6935ed9369ca49a3c52
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/python-fonttools/Config.in             |  7 +++++++
 package/python-fonttools/python-fonttools.hash |  5 +++++
 package/python-fonttools/python-fonttools.mk   | 22 ++++++++++++++++++++++
 5 files changed, 36 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 35218fecfd..3b31b89568 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1259,6 +1259,7 @@ F:	package/python-cchardet/
 F:	package/python-charset-normalizer/
 F:	package/python-cssselect2/
 F:	package/python-flatbuffers/
+F:	package/python-fonttools/
 F:	package/python-frozenlist/
 F:	package/python-greenlet/
 F:	package/python-janus/
diff --git a/package/Config.in b/package/Config.in
index d5107f3be2..b9c2765830 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1013,6 +1013,7 @@ menu "External python modules"
 	source "package/python-flask-wtf/Config.in"
 	source "package/python-flatbuffers/Config.in"
 	source "package/python-flup/Config.in"
+	source "package/python-fonttools/Config.in"
 	source "package/python-frozenlist/Config.in"
 	source "package/python-functools32/Config.in"
 	source "package/python-future/Config.in"
diff --git a/package/python-fonttools/Config.in b/package/python-fonttools/Config.in
new file mode 100644
index 0000000000..714f547430
--- /dev/null
+++ b/package/python-fonttools/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_FONTTOOLS
+	bool "python-fonttools"
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  Tools to manipulate font files.
+
+	  https://github.com/fonttools/fonttools
diff --git a/package/python-fonttools/python-fonttools.hash b/package/python-fonttools/python-fonttools.hash
new file mode 100644
index 0000000000..2e79861e2c
--- /dev/null
+++ b/package/python-fonttools/python-fonttools.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/fonttools/json
+md5  fcf1425460855b5892c990027b5396c8  fonttools-4.28.2.zip
+sha256  dca694331af74c8ad47acc5171e57f6b78fac5692bf050f2ab572964577ac0dd  fonttools-4.28.2.zip
+# Locally computed sha256 checksums
+sha256  6787208f83f659ccbc2223b2fde952ffa6f7e8aca62f1a8a2bf5bc51bb1b2383  LICENSE
diff --git a/package/python-fonttools/python-fonttools.mk b/package/python-fonttools/python-fonttools.mk
new file mode 100644
index 0000000000..9ec369d550
--- /dev/null
+++ b/package/python-fonttools/python-fonttools.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# python-fonttools
+#
+################################################################################
+
+PYTHON_FONTTOOLS_VERSION = 4.28.2
+PYTHON_FONTTOOLS_SOURCE = fonttools-$(PYTHON_FONTTOOLS_VERSION).zip
+PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/3c/d5/f722e0d1aed0d547383913c6bc3c4ff35772952057b8e2b8fe3be8df4216
+PYTHON_FONTTOOLS_SETUP_TYPE = setuptools
+PYTHON_FONTTOOLS_LICENSE = MIT
+PYTHON_FONTTOOLS_LICENSE_FILES = LICENSE
+PYTHON_FONTTOOLS_DEPENDENCIES = host-python3-cython
+PYTHON_FONTTOOLS_ENV = FONTTOOLS_WITH_CYTHON=1
+
+define PYTHON_FONTTOOLS_EXTRACT_CMDS
+	$(UNZIP) -d $(@D) $(PYTHON_FONTTOOLS_DL_DIR)/$(PYTHON_FONTTOOLS_SOURCE)
+	mv $(@D)/fonttools-$(PYTHON_FONTTOOLS_VERSION)/* $(@D)
+	$(RM) -r $(@D)/fonttools-$(PYTHON_FONTTOOLS_VERSION)
+endef
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
