Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0462C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 21:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 55F2140261;
	Sat,  4 Dec 2021 21:26:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5VYmJstNtDbd; Sat,  4 Dec 2021 21:26:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46B5D40156;
	Sat,  4 Dec 2021 21:26:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3D1731BF36B
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 21:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B39140156
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 21:26:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3WF5Z_y0ich6 for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 21:26:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E89E400E9
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 21:26:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 031D193523; Sat,  4 Dec 2021 21:21:49 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 22:26:32 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a2663af3409f8b45ddf6e6935ed9369ca49a3c52
X-Git-Newrev: 53972c82964dd1337dff4ccbcdd484d243aef0ba
X-Patchwork-Hint: ignore
Message-Id: <20211204212149.031D193523@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-zopfli: new
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

commit: https://git.buildroot.net/buildroot/commit/?id=53972c82964dd1337dff4ccbcdd484d243aef0ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/python-zopfli/Config.in          |  7 +++++++
 package/python-zopfli/python-zopfli.hash |  5 +++++
 package/python-zopfli/python-zopfli.mk   | 21 +++++++++++++++++++++
 5 files changed, 35 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3b31b89568..82853cdc18 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1272,6 +1272,7 @@ F:	package/python-sockjs/
 F:	package/python-terminaltables/
 F:	package/python-tinycss2/
 F:	package/python-yarl/
+F:	package/python-zopfli/
 
 N:	James Knight <james.knight@collins.com>
 F:	package/atkmm/
diff --git a/package/Config.in b/package/Config.in
index b9c2765830..e90d30e81c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1296,6 +1296,7 @@ menu "External python modules"
 	source "package/python-zc-lockfile/Config.in"
 	source "package/python-zeroconf/Config.in"
 	source "package/python-zope-interface/Config.in"
+	source "package/python-zopfli/Config.in"
 endmenu
 endif
 	source "package/quickjs/Config.in"
diff --git a/package/python-zopfli/Config.in b/package/python-zopfli/Config.in
new file mode 100644
index 0000000000..69d4b8b514
--- /dev/null
+++ b/package/python-zopfli/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_ZOPFLI
+	bool "python-zopfli"
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  Zopfli module for python.
+
+	  https://github.com/fonttools/py-zopfli
diff --git a/package/python-zopfli/python-zopfli.hash b/package/python-zopfli/python-zopfli.hash
new file mode 100644
index 0000000000..92b51bdf18
--- /dev/null
+++ b/package/python-zopfli/python-zopfli.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/zopfli/json
+md5  f66b6f4132533b9b0ab8b0af757237bf  zopfli-0.1.9.zip
+sha256  78de3cc08a8efaa8013d61528907d91ac4d6cc014ffd8a41cc10ee75e9e60d7b  zopfli-0.1.9.zip
+# Locally computed sha256 checksums
+sha256  018b1cb87efdf7a04c2fcc13d57ed63f62149113fb207b27ea13430d64f13513  COPYING
diff --git a/package/python-zopfli/python-zopfli.mk b/package/python-zopfli/python-zopfli.mk
new file mode 100644
index 0000000000..95a0067b05
--- /dev/null
+++ b/package/python-zopfli/python-zopfli.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# python-zopfli
+#
+################################################################################
+
+PYTHON_ZOPFLI_VERSION = 0.1.9
+PYTHON_ZOPFLI_SOURCE = zopfli-$(PYTHON_ZOPFLI_VERSION).zip
+PYTHON_ZOPFLI_SITE = https://files.pythonhosted.org/packages/10/7d/278fd896401b0ef76e06cd42c3ce1541572d83b1c713b6786795c60a1bbe
+PYTHON_ZOPFLI_SETUP_TYPE = setuptools
+PYTHON_ZOPFLI_LICENSE = Apache-2.0
+PYTHON_ZOPFLI_LICENSE_FILES = COPYING
+PYTHON_ZOPFLI_DEPENDENCIES = host-python-setuptools-scm
+
+define PYTHON_ZOPFLI_EXTRACT_CMDS
+	$(UNZIP) -d $(@D) $(PYTHON_ZOPFLI_DL_DIR)/$(PYTHON_ZOPFLI_SOURCE)
+	mv $(@D)/zopfli-$(PYTHON_ZOPFLI_VERSION)/* $(@D)
+	$(RM) -r $(@D)/zopfli-$(PYTHON_ZOPFLI_VERSION)
+endef
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
