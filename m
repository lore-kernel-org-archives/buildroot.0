From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sun, 18 Jan 2015 23:17:39 +0100
Subject: [Buildroot] [RFC] python-lxml: add target package variant
Message-ID: <1421619459-26270-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                  |  1 +
 package/python-lxml/Config.in      | 10 ++++++++++
 package/python-lxml/python-lxml.mk |  4 +++-
 3 files changed, 14 insertions(+), 1 deletion(-)
 create mode 100644 package/python-lxml/Config.in

diff --git a/package/Config.in b/package/Config.in
index 266de13..366e393 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -519,6 +519,7 @@ menu "external python modules"
 	source "package/python-json-schema-validator/Config.in"
 	source "package/python-keyring/Config.in"
 	source "package/python-libconfig/Config.in"
+	source "package/python-lxml/Config.in"
 	source "package/python-mad/Config.in"
 	source "package/python-markdown/Config.in"
 	source "package/python-markupsafe/Config.in"
diff --git a/package/python-lxml/Config.in b/package/python-lxml/Config.in
new file mode 100644
index 0000000..70096e7
--- /dev/null
+++ b/package/python-lxml/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_LXML
+	bool "python-lxml"
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_LIBXSLT
+	help
+	  The lxml XML toolkit is a Pythonic binding for the C libraries
+	  libxml2 and libxslt.
+
+	  http://lxml.de/
+
diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
index 758ce87..292031b 100644
--- a/package/python-lxml/python-lxml.mk
+++ b/package/python-lxml/python-lxml.mk
@@ -20,6 +20,8 @@ PYTHON_LXML_LICENSE_FILES = \
 # So, we use setuptools.
 PYTHON_LXML_SETUP_TYPE = setuptools
 
-PYTHON_LXML_DEPENDENCIES = libxml2 libxslt
+PYTHON_LXML_DEPENDENCIES = libxml2 libxslt host-libxslt
 
+
+$(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.1.0
