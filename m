Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75D2C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88E7B41C7D;
	Mon,  6 Dec 2021 18:37:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xh6VabTqZzOM; Mon,  6 Dec 2021 18:37:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F29241C36;
	Mon,  6 Dec 2021 18:37:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6213B1BF3F2
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:13:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADB5E41C68
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y7EhnKJoSwUF for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DB8B41C0A
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 26D6E81503; Mon,  6 Dec 2021 18:07:40 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 22:34:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3db4d486d689b4a9d59c8f7637211893b0a1cb1b
X-Git-Newrev: e9df5b0fc3f6e8bb36deedefb392bbc968116ee7
X-Patchwork-Hint: ignore
Message-Id: <20211206180740.26D6E81503@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-markupsafe: bump to version
 2.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=e9df5b0fc3f6e8bb36deedefb392bbc968116ee7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop python2 support.

Remove python3-markupsafe host build as python2 host builds for
markupsafe are not supported, python3 host builds are moved to
python-markupsafe.

Remove python3-jinja2 host build as python2 host builds for
jinja2 are not supported, python3 host builds are moved to
python-jinja2.

Remove python3-mako host build as python2 host builds for
mako are not supported, python3 host builds are moved to
python-mako.

Propagate reverse python3 dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gnuradio/gnuradio.mk                       |  2 +-
 package/jailhouse/Config.in                        |  6 +++---
 package/libcamera/libcamera.mk                     |  2 +-
 package/mesa3d/mesa3d.mk                           |  2 +-
 package/python-flask-babel/Config.in               |  1 +
 package/python-flask-cors/Config.in                |  1 +
 package/python-flask-expects-json/Config.in        |  1 +
 package/python-flask-jsonrpc/Config.in             |  1 +
 package/python-flask-login/Config.in               |  1 +
 package/python-flask-sqlalchemy/Config.in          |  1 +
 package/python-flask/Config.in                     |  1 +
 package/python-jinja2/Config.in                    |  4 ++--
 package/python-jinja2/python-jinja2.mk             | 16 +++-------------
 package/python-mako/python-mako.mk                 |  4 ++--
 package/python-markupsafe/Config.in                |  1 +
 package/python-markupsafe/python-markupsafe.hash   |  9 +++++----
 package/python-markupsafe/python-markupsafe.mk     |  7 ++++---
 package/python-wtforms/Config.in                   |  1 +
 package/python3-jinja2/python3-jinja2.hash         |  1 -
 package/python3-jinja2/python3-jinja2.mk           | 20 --------------------
 package/python3-mako/python3-mako.hash             |  1 -
 package/python3-mako/python3-mako.mk               | 18 ------------------
 package/python3-markupsafe/python3-markupsafe.hash |  1 -
 package/python3-markupsafe/python3-markupsafe.mk   | 16 ----------------
 package/systemd/systemd.mk                         |  4 ++--
 package/uhd/uhd.mk                                 |  2 +-
 26 files changed, 34 insertions(+), 90 deletions(-)

diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index 36d7ee65cf..2272a1162a 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -20,7 +20,7 @@ endif
 
 # host-python-mako and host-python-six are needed for volk to compile
 GNURADIO_DEPENDENCIES = \
-	$(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python) \
+	host-python3 \
 	host-python-mako \
 	host-python-six \
 	host-swig \
diff --git a/package/jailhouse/Config.in b/package/jailhouse/Config.in
index 596b4951db..445414162f 100644
--- a/package/jailhouse/Config.in
+++ b/package/jailhouse/Config.in
@@ -11,15 +11,15 @@ if BR2_PACKAGE_JAILHOUSE
 
 config BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS
 	bool "helper scripts"
-	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_MAKO # runtime
 	help
 	  Python-based helpers for the Jailhouse Hypervisor.
 
 	  https://github.com/siemens/jailhouse
 
-comment "helper scripts require Python"
-	depends on !BR2_PACKAGE_PYTHON
+comment "helper scripts require Python3"
+	depends on !BR2_PACKAGE_PYTHON3
 
 endif
 
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 5a5f2800b9..0052ca558a 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -10,7 +10,7 @@ LIBCAMERA_SITE_METHOD = git
 LIBCAMERA_DEPENDENCIES = \
 	host-openssl \
 	host-pkgconf \
-	host-python3-jinja2 \
+	host-python-jinja2 \
 	host-python3-ply \
 	host-python3-pyyaml \
 	gnutls
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index dc63d8c9f4..e5cb65df36 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -20,7 +20,7 @@ MESA3D_PROVIDES =
 MESA3D_DEPENDENCIES = \
 	host-bison \
 	host-flex \
-	host-python3-mako \
+	host-python-mako \
 	expat \
 	libdrm \
 	zlib
diff --git a/package/python-flask-babel/Config.in b/package/python-flask-babel/Config.in
index 272d9ef1c1..52f05f1e6a 100644
--- a/package/python-flask-babel/Config.in
+++ b/package/python-flask-babel/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_FLASK_BABEL
 	bool "python-flask-babel"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_FLASK # runtime
 	select BR2_PACKAGE_PYTHON_BABEL # runtime
 	select BR2_PACKAGE_PYTHON_JINJA2 # runtime
diff --git a/package/python-flask-cors/Config.in b/package/python-flask-cors/Config.in
index e2e84797f9..f34f77e5b0 100644
--- a/package/python-flask-cors/Config.in
+++ b/package/python-flask-cors/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_FLASK_CORS
 	bool "python-flask-cors"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_FLASK # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
diff --git a/package/python-flask-expects-json/Config.in b/package/python-flask-expects-json/Config.in
index 901234762e..efe4c248d3 100644
--- a/package/python-flask-expects-json/Config.in
+++ b/package/python-flask-expects-json/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_FLASK_EXPECTS_JSON
 	bool "python-flask-expects-json"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_FLASK # runtime
 	select BR2_PACKAGE_PYTHON_JSONSCHEMA # runtime
 	help
diff --git a/package/python-flask-jsonrpc/Config.in b/package/python-flask-jsonrpc/Config.in
index c8ecd854b3..4bc13f9bcb 100644
--- a/package/python-flask-jsonrpc/Config.in
+++ b/package/python-flask-jsonrpc/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_FLASK_JSONRPC
 	bool "python-flask-jsonrpc"
+	depends on BR2_PACKAGE_PYTHON3
 	# runtime dependency
 	select BR2_PACKAGE_PYTHON_FLASK
 	help
diff --git a/package/python-flask-login/Config.in b/package/python-flask-login/Config.in
index 88c413e2a2..00fa58d783 100644
--- a/package/python-flask-login/Config.in
+++ b/package/python-flask-login/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_FLASK_LOGIN
 	bool "python-flask-login"
+	depends on BR2_PACKAGE_PYTHON3
 	# runtime dependency
 	select BR2_PACKAGE_PYTHON_FLASK
 	help
diff --git a/package/python-flask-sqlalchemy/Config.in b/package/python-flask-sqlalchemy/Config.in
index fa4a035110..e96bd7078c 100644
--- a/package/python-flask-sqlalchemy/Config.in
+++ b/package/python-flask-sqlalchemy/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_FLASK_SQLALCHEMY
 	bool "python-flask-sqlalchemy"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_FLASK # runtime
 	select BR2_PACKAGE_PYTHON_SQLALCHEMY # runtime
 	help
diff --git a/package/python-flask/Config.in b/package/python-flask/Config.in
index 0e5b64ce59..56bfe10f01 100644
--- a/package/python-flask/Config.in
+++ b/package/python-flask/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_FLASK
 	bool "python-flask"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_CLICK # runtime
 	select BR2_PACKAGE_PYTHON_JINJA2 # runtime
 	select BR2_PACKAGE_PYTHON_WERKZEUG # runtime
diff --git a/package/python-jinja2/Config.in b/package/python-jinja2/Config.in
index 5b99df75b8..8ba2fa4df8 100644
--- a/package/python-jinja2/Config.in
+++ b/package/python-jinja2/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_PYTHON_JINJA2
 	bool "python-jinja2"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_MARKUPSAFE # runtime
-	select BR2_PACKAGE_PYTHON_UNICODEDATA if BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_PYTHON3_UNICODEDATA if BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON3_UNICODEDATA
 	help
 	  Jinja2 is a template engine written in pure Python. It
 	  provides a Django inspired non-XML syntax but supports
diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
index f91cac6937..e3f47f953a 100644
--- a/package/python-jinja2/python-jinja2.mk
+++ b/package/python-jinja2/python-jinja2.mk
@@ -4,7 +4,6 @@
 #
 ################################################################################
 
-# Please keep in sync with package/python3-jinja2/python3-jinja2.mk
 PYTHON_JINJA2_VERSION = 2.11.3
 PYTHON_JINJA2_SOURCE = Jinja2-$(PYTHON_JINJA2_VERSION).tar.gz
 PYTHON_JINJA2_SITE = https://files.pythonhosted.org/packages/4f/e7/65300e6b32e69768ded990494809106f87da1d436418d5f1367ed3966fd7
@@ -14,20 +13,11 @@ PYTHON_JINJA2_LICENSE_FILES = LICENSE.rst
 PYTHON_JINJA2_CPE_ID_VENDOR = pocoo
 PYTHON_JINJA2_CPE_ID_PRODUCT = jinja2
 
-# In host build, setup.py tries to download markupsafe if it is not installed
+# In host/target build, setup.py tries to download markupsafe if it is not installed
+PYTHON_JINJA2_DEPENDENCIES = host-python-markupsafe
 HOST_PYTHON_JINJA2_DEPENDENCIES = host-python-markupsafe
 
-# Both asyncsupport.py and asyncfilters.py use async feature, that is
-# not available in Python 2 and some features available in Python 3.6.
-# So in both cases *.py compilation would produce compiler errors.
-# Hence remove both files after package extraction.
-ifeq ($(BR2_PACKAGE_PYTHON),y)
-define PYTHON_JINJA2_REMOVE_ASYNC_SUPPORT
-	rm $(@D)/src/jinja2/asyncsupport.py $(@D)/src/jinja2/asyncfilters.py
-endef
-
-PYTHON_JINJA2_POST_EXTRACT_HOOKS = PYTHON_JINJA2_REMOVE_ASYNC_SUPPORT
-endif
+HOST_PYTHON_JINJA2_NEEDS_HOST_PYTHON = python3
 
 $(eval $(python-package))
 $(eval $(host-python-package))
diff --git a/package/python-mako/python-mako.mk b/package/python-mako/python-mako.mk
index 6529d0d520..26fe95c606 100644
--- a/package/python-mako/python-mako.mk
+++ b/package/python-mako/python-mako.mk
@@ -4,8 +4,6 @@
 #
 ################################################################################
 
-# Please keep in sync with
-# package/python3-mako/python3-mako.mk
 PYTHON_MAKO_VERSION = 1.1.5
 PYTHON_MAKO_SOURCE = Mako-$(PYTHON_MAKO_VERSION).tar.gz
 PYTHON_MAKO_SITE = https://files.pythonhosted.org/packages/d1/42/ff293411e980debfc647be9306d89840c8b82ea24571b014f1a35b2ad80f
@@ -13,6 +11,8 @@ PYTHON_MAKO_SETUP_TYPE = setuptools
 PYTHON_MAKO_LICENSE = MIT
 PYTHON_MAKO_LICENSE_FILES = LICENSE
 
+HOST_PYTHON_MAKO_NEEDS_HOST_PYTHON = python3
+
 # In host build, setup.py tries to download markupsafe if it is not installed
 HOST_PYTHON_MAKO_DEPENDENCIES = host-python-markupsafe
 
diff --git a/package/python-markupsafe/Config.in b/package/python-markupsafe/Config.in
index 48421e0a32..cd7cb2d8e9 100644
--- a/package/python-markupsafe/Config.in
+++ b/package/python-markupsafe/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_MARKUPSAFE
 	bool "python-markupsafe"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  MarkupSafe implements a XML/HTML/XHTML Markup safe string
 	  for Python.
diff --git a/package/python-markupsafe/python-markupsafe.hash b/package/python-markupsafe/python-markupsafe.hash
index df07662a86..520bb405fb 100644
--- a/package/python-markupsafe/python-markupsafe.hash
+++ b/package/python-markupsafe/python-markupsafe.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/markupsafe/json, sha256 locally computed
-md5	43fd756864fe42063068e092e220c57b  MarkupSafe-1.1.1.tar.gz
-sha256	29872e92839765e546828bb7754a68c418d927cd064fd4708fab9fe9c8bb116b  MarkupSafe-1.1.1.tar.gz
-sha256	489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.rst
+# md5, sha256 from https://pypi.org/pypi/markupsafe/json
+md5  892e0fefa3c488387e5cc0cad2daa523  MarkupSafe-2.0.1.tar.gz
+sha256  594c67807fb16238b30c44bdf74f36c02cdf22d1c8cda91ef8a0ed8dabf5620a  MarkupSafe-2.0.1.tar.gz
+# Locally computed sha256 checksums
+sha256  489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.rst
diff --git a/package/python-markupsafe/python-markupsafe.mk b/package/python-markupsafe/python-markupsafe.mk
index f067d94f34..14a8d06dfe 100644
--- a/package/python-markupsafe/python-markupsafe.mk
+++ b/package/python-markupsafe/python-markupsafe.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-# Please keep in sync with package/python3-markupsafe/python3-markupsafe.mk
-PYTHON_MARKUPSAFE_VERSION = 1.1.1
+PYTHON_MARKUPSAFE_VERSION = 2.0.1
 PYTHON_MARKUPSAFE_SOURCE = MarkupSafe-$(PYTHON_MARKUPSAFE_VERSION).tar.gz
-PYTHON_MARKUPSAFE_SITE = https://files.pythonhosted.org/packages/b9/2e/64db92e53b86efccfaea71321f597fa2e1b2bd3853d8ce658568f7a13094
+PYTHON_MARKUPSAFE_SITE = https://files.pythonhosted.org/packages/bf/10/ff66fea6d1788c458663a84d88787bae15d45daa16f6b3ef33322a51fc7e
 PYTHON_MARKUPSAFE_SETUP_TYPE = setuptools
 PYTHON_MARKUPSAFE_LICENSE = BSD-3-Clause
 PYTHON_MARKUPSAFE_LICENSE_FILES = LICENSE.rst
 
+HOST_PYTHON_MARKUPSAFE_NEEDS_HOST_PYTHON = python3
+
 $(eval $(python-package))
 $(eval $(host-python-package))
diff --git a/package/python-wtforms/Config.in b/package/python-wtforms/Config.in
index 33a17d3d37..0cc136fc13 100644
--- a/package/python-wtforms/Config.in
+++ b/package/python-wtforms/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_WTFORMS
 	bool "python-wtforms"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_MARKUPSAFE # runtime
 	help
 	  A flexible forms validation and rendering library for
diff --git a/package/python3-jinja2/python3-jinja2.hash b/package/python3-jinja2/python3-jinja2.hash
deleted file mode 120000
index 543e981aa0..0000000000
--- a/package/python3-jinja2/python3-jinja2.hash
+++ /dev/null
@@ -1 +0,0 @@
-../python-jinja2/python-jinja2.hash
\ No newline at end of file
diff --git a/package/python3-jinja2/python3-jinja2.mk b/package/python3-jinja2/python3-jinja2.mk
deleted file mode 100644
index 5d29e1d889..0000000000
--- a/package/python3-jinja2/python3-jinja2.mk
+++ /dev/null
@@ -1,20 +0,0 @@
-################################################################################
-#
-# python3-jinja2
-#
-################################################################################
-
-PYTHON3_JINJA2_VERSION = 2.11.3
-PYTHON3_JINJA2_SOURCE = Jinja2-$(PYTHON3_JINJA2_VERSION).tar.gz
-PYTHON3_JINJA2_SITE = https://files.pythonhosted.org/packages/4f/e7/65300e6b32e69768ded990494809106f87da1d436418d5f1367ed3966fd7
-PYTHON3_JINJA2_SETUP_TYPE = setuptools
-PYTHON3_JINJA2_LICENSE = BSD-3-Clause
-PYTHON3_JINJA2_LICENSE_FILES = LICENSE.rst
-PYTHON3_JINJA2_CPE_ID_VENDOR = pocoo
-PYTHON3_JINJA2_CPE_ID_PRODUCT = jinja2
-
-HOST_PYTHON3_JINJA2_NEEDS_HOST_PYTHON = python3
-# In host build, setup.py tries to download markupsafe if it is not installed
-HOST_PYTHON3_JINJA2_DEPENDENCIES = host-python3-markupsafe
-
-$(eval $(host-python-package))
diff --git a/package/python3-mako/python3-mako.hash b/package/python3-mako/python3-mako.hash
deleted file mode 120000
index 068be91fb0..0000000000
--- a/package/python3-mako/python3-mako.hash
+++ /dev/null
@@ -1 +0,0 @@
-../python-mako/python-mako.hash
\ No newline at end of file
diff --git a/package/python3-mako/python3-mako.mk b/package/python3-mako/python3-mako.mk
deleted file mode 100644
index dfe600a4e4..0000000000
--- a/package/python3-mako/python3-mako.mk
+++ /dev/null
@@ -1,18 +0,0 @@
-################################################################################
-#
-# python3-mako
-#
-################################################################################
-
-# Please keep in sync with
-# package/python-mako/python-mako.mk
-PYTHON3_MAKO_VERSION = 1.1.5
-PYTHON3_MAKO_SOURCE = Mako-$(PYTHON3_MAKO_VERSION).tar.gz
-PYTHON3_MAKO_SITE = https://files.pythonhosted.org/packages/d1/42/ff293411e980debfc647be9306d89840c8b82ea24571b014f1a35b2ad80f
-PYTHON3_MAKO_SETUP_TYPE = setuptools
-PYTHON3_MAKO_LICENSE = MIT
-PYTHON3_MAKO_LICENSE_FILES = LICENSE
-HOST_PYTHON3_MAKO_DL_SUBDIR = python-mako
-HOST_PYTHON3_MAKO_NEEDS_HOST_PYTHON = python3
-
-$(eval $(host-python-package))
diff --git a/package/python3-markupsafe/python3-markupsafe.hash b/package/python3-markupsafe/python3-markupsafe.hash
deleted file mode 120000
index 947cfa12d7..0000000000
--- a/package/python3-markupsafe/python3-markupsafe.hash
+++ /dev/null
@@ -1 +0,0 @@
-../python-markupsafe/python-markupsafe.hash
\ No newline at end of file
diff --git a/package/python3-markupsafe/python3-markupsafe.mk b/package/python3-markupsafe/python3-markupsafe.mk
deleted file mode 100644
index 58f6e67b64..0000000000
--- a/package/python3-markupsafe/python3-markupsafe.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# python3-markupsafe
-#
-################################################################################
-
-PYTHON3_MARKUPSAFE_VERSION = 1.1.1
-PYTHON3_MARKUPSAFE_SOURCE = MarkupSafe-$(PYTHON3_MARKUPSAFE_VERSION).tar.gz
-PYTHON3_MARKUPSAFE_SITE = https://files.pythonhosted.org/packages/b9/2e/64db92e53b86efccfaea71321f597fa2e1b2bd3853d8ce658568f7a13094
-PYTHON3_MARKUPSAFE_SETUP_TYPE = setuptools
-PYTHON3_MARKUPSAFE_LICENSE = BSD-3-Clause
-PYTHON3_MARKUPSAFE_LICENSE_FILES = LICENSE.rst
-
-HOST_PYTHON3_MARKUPSAFE_NEEDS_HOST_PYTHON = python3
-
-$(eval $(host-python-package))
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index a8b11faa5e..619c2b48c9 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -14,7 +14,7 @@ SYSTEMD_DEPENDENCIES = \
 	$(BR2_COREUTILS_HOST_DEPENDENCY) \
 	$(if $(BR2_PACKAGE_BASH_COMPLETION),bash-completion) \
 	host-gperf \
-	host-python3-jinja2 \
+	host-python-jinja2 \
 	kmod \
 	libcap \
 	util-linux-libs \
@@ -738,7 +738,7 @@ HOST_SYSTEMD_DEPENDENCIES = \
 	host-patchelf \
 	host-libcap \
 	host-gperf \
-	host-python3-jinja2
+	host-python-jinja2
 
 HOST_SYSTEMD_NINJA_ENV = DESTDIR=$(HOST_DIR)
 
diff --git a/package/uhd/uhd.mk b/package/uhd/uhd.mk
index 125eb05121..5da1697925 100644
--- a/package/uhd/uhd.mk
+++ b/package/uhd/uhd.mk
@@ -15,7 +15,7 @@ UHD_INSTALL_STAGING = YES
 
 UHD_DEPENDENCIES = \
 	boost \
-	$(if $(BR2_PACKAGE_PYTHON),host-python,host-python3) \
+	host-python3 \
 	host-python-mako
 
 UHD_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
