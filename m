From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Feb 2016 18:02:31 +0100
Subject: [Buildroot] [git commit] python-mistune: new package
Message-ID: <20160202192537.2B26E80AC8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=56526bbfae64fee625f560297a979f8345887a00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

[Thomas:
 - rename the .mk file to carry the proper name
 - rewrap Config.in help text to use the proper length and avoid a
   trailing space
 - remove excessive empty new line at the end of Config.in
 - specify BSD-3c as the license, since it's the variant being used,
   and it's more specific than just BSD.]

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                          |  1 +
 package/python-mistune/Config.in           |  7 +++++++
 package/python-mistune/python-mistune.hash |  3 +++
 package/python-mistune/python-mistune.mk   | 14 ++++++++++++++
 4 files changed, 25 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index da49c1a..8ee5ad4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -663,6 +663,7 @@ menu "External python modules"
 	source "package/python-markdown/Config.in"
 	source "package/python-markupsafe/Config.in"
 	source "package/python-meld3/Config.in"
+	source "package/python-mistune/Config.in"
 	source "package/python-msgpack/Config.in"
 	source "package/python-netifaces/Config.in"
 	source "package/python-networkmanager/Config.in"
diff --git a/package/python-mistune/Config.in b/package/python-mistune/Config.in
new file mode 100644
index 0000000..e62689d
--- /dev/null
+++ b/package/python-mistune/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_MISTUNE
+	bool "python-mistune"
+	help
+	  The fastest markdown parser in pure Python with renderer
+	  features, inspired by marked.
+
+	  https://pypi.python.org/pypi/mistune
diff --git a/package/python-mistune/python-mistune.hash b/package/python-mistune/python-mistune.hash
new file mode 100644
index 0000000..b161e11
--- /dev/null
+++ b/package/python-mistune/python-mistune.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=057bc28bf629d6a1283d680a34ed9d0f, sha256 locally computed.
+md5	057bc28bf629d6a1283d680a34ed9d0f  mistune-0.7.1.tar.gz
+sha256	6076dedf768348927d991f4371e5a799c6a0158b16091df08ee85ee231d929a7  mistune-0.7.1.tar.gz
diff --git a/package/python-mistune/python-mistune.mk b/package/python-mistune/python-mistune.mk
new file mode 100644
index 0000000..a1e5710
--- /dev/null
+++ b/package/python-mistune/python-mistune.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-mistune
+#
+################################################################################
+
+PYTHON_MISTUNE_VERSION = 0.7.1
+PYTHON_MISTUNE_SOURCE = mistune-$(PYTHON_MISTUNE_VERSION).tar.gz
+PYTHON_MISTUNE_SITE = http://pypi.python.org/packages/source/m/mistune
+PYTHON_MISTUNE_LICENSE = BSD-3c
+PYTHON_MISTUNE_LICENSE_FILES = LICENSE
+PYTHON_MISTUNE_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
