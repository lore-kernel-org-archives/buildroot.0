From: Mauro Condarelli <mc5686@mclink.it>
Date: Mon,  1 Feb 2016 15:05:32 +0100
Subject: [Buildroot] [PATCH 13/22] package/python-service-identity: new
	package.
In-Reply-To: <1454335541-14224-1-git-send-email-mc5686@mclink.it>
References: <1454335541-14224-1-git-send-email-mc5686@mclink.it>
Message-ID: <1454335541-14224-14-git-send-email-mc5686@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
---
 package/Config.in                                         |  1 +
 package/python-service-identity/Config.in                 |  8 ++++++++
 .../python-service-identity/python-service-identity.hash  |  3 +++
 .../python-service-identity/python-service-identity.mk    | 15 +++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-service-identity/Config.in
 create mode 100644 package/python-service-identity/python-service-identity.hash
 create mode 100644 package/python-service-identity/python-service-identity.mk

diff --git a/package/Config.in b/package/Config.in
index c4bc8f8..8eac814 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -708,6 +708,7 @@ menu "External python modules"
 	source "package/python-requests/Config.in"
 	source "package/python-rtslib-fb/Config.in"
 	source "package/python-serial/Config.in"
+	source "package/python-service-identity/Config.in"
 	source "package/python-setuptools/Config.in"
 	source "package/python-simplejson/Config.in"
 	source "package/python-singledispatch/Config.in"
diff --git a/package/python-service-identity/Config.in b/package/python-service-identity/Config.in
new file mode 100644
index 0000000..4bbbca6
--- /dev/null
+++ b/package/python-service-identity/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_SERVICE_IDENTITY
+	bool "python-service-identity"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  Service identity verification for pyOpenSSL.
+
+	  https://pypi.python.org/pypi/service_identity
+
diff --git a/package/python-service-identity/python-service-identity.hash b/package/python-service-identity/python-service-identity.hash
new file mode 100644
index 0000000..bc047d8
--- /dev/null
+++ b/package/python-service-identity/python-service-identity.hash
@@ -0,0 +1,3 @@
+# Locally computed.
+md5	cea0b0156d73b025ecef660fb51f0d9a  service_identity-14.0.0.tar.gz
+sha256	3105a319a7c558490666694f599be0c377ad54824eefb404cde4ce49e74a4f5a  service_identity-14.0.0.tar.gz
diff --git a/package/python-service-identity/python-service-identity.mk b/package/python-service-identity/python-service-identity.mk
new file mode 100644
index 0000000..2325796
--- /dev/null
+++ b/package/python-service-identity/python-service-identity.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-service-identity
+#
+################################################################################
+
+PYTHON_SERVICE_IDENTITY_VERSION = 14.0.0
+PYTHON_SERVICE_IDENTITY_SOURCE = service_identity-$(PYTHON_SERVICE_IDENTITY_VERSION).tar.gz
+PYTHON_SERVICE_IDENTITY_SITE = http://pypi.python.org/packages/source/s/service_identity
+PYTHON_SERVICE_IDENTITY_LICENSE = BSD
+#PYTHON_SERVICE_IDENTITY_LICENSE_FILES = LICENSE
+PYTHON_SERVICE_IDENTITY_SETUP_TYPE = setuptools
+#PYTHON_SERVICE_IDENTITY_DEPENDENCIES = 
+
+$(eval $(python-package))
-- 
2.1.4
