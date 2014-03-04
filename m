From: Johan Derycke <johan.derycke@barco.com>
Date: Tue,  4 Mar 2014 17:53:46 +0100
Subject: [Buildroot] [PATCH v3 1/2] python-libconfig: new package
Message-ID: <1393952027-21201-1-git-send-email-johan.derycke@barco.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Python bindings to the C++ library libconfig
https://github.com/cnangel/python-libconfig

Signed-off-by: Johan Derycke <johan.derycke@barco.com>
---
Changes v2 -> v3:
  -Avoid line-wrap using "git send-email"
Changes v1 -> v2:
  -Fixed indentations and blank lines
  -Added package/Config.in


 package/Config.in                            |    1 +
 package/python-libconfig/Config.in           |    9 +++++++++
 package/python-libconfig/python-libconfig.mk |   17 +++++++++++++++++
 3 files changed, 27 insertions(+)
 create mode 100644 package/python-libconfig/Config.in
 create mode 100644 package/python-libconfig/python-libconfig.mk

diff --git a/package/Config.in b/package/Config.in
index 417c9b8..fb29097 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -442,6 +442,7 @@ source "package/python-id3/Config.in"
 source "package/python-ipy/Config.in"
 source "package/python-json-schema-validator/Config.in"
 source "package/python-keyring/Config.in"
+source "package/python-libconfig/Config.in"
 source "package/python-mad/Config.in"
 source "package/python-meld3/Config.in"
 source "package/python-msgpack/Config.in"
diff --git a/package/python-libconfig/Config.in 
b/package/python-libconfig/Config.in
new file mode 100644
index 0000000..170926d
--- /dev/null
+++ b/package/python-libconfig/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_LIBCONFIG
+	bool "python-libconfig"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_BOOST_PYTHON
+	select BR2_PACKAGE_LIBCONFIG
+	help
+	  Python bindings to the C++ library libconfig
+
+	  https://github.com/cnangel/python-libconfig
diff --git a/package/python-libconfig/python-libconfig.mk 
b/package/python-libconfig/python-libconfig.mk
new file mode 100644
index 0000000..3f5984b
--- /dev/null
+++ b/package/python-libconfig/python-libconfig.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python-libconfig
+#
+################################################################################
+
+PYTHON_LIBCONFIG_VERSION = b271c3d9dac938ad5cd29b67bd08cc5536a5a391
+PYTHON_LIBCONFIG_SITE = $(call 
github,cnangel,python-libconfig,$(PYTHON_LIBCONFIG_VERSION))
+
+PYTHON_LIBCONFIG_LICENSE = BSD
+PYTHON_LIBCONFIG_LICENSE_FILES = README
+
+PYTHON_LIBCONFIG_SETUP_TYPE = setuptools
+
+PYTHON_LIBCONFIG_DEPENDENCIES = libconfig boost
+
+$(eval $(python-package))
-- 
1.7.10.4



DISCLAIMER:
Unless indicated otherwise, the information contained in this message is 
privileged and confidential, and is intended only for the use of the 
addressee(s) named above and others who have been specifically authorized 
to receive it. If you are not the intended recipient, you are hereby 
notified that any dissemination, distribution or copying of this message 
and/or attachments is strictly prohibited. The company accepts no 
liability for any damage caused by any virus transmitted by this email. 
Furthermore, the company does not warrant a proper and complete 
transmission of this information, nor does it accept liability for any 
delays. If you have received this message in error, please contact the 
sender and delete the message. Thank you.
