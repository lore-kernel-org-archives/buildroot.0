From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 May 2018 13:32:37 +0200
Subject: [Buildroot] [PATCH-NEXT 2/2] package: add python-request-id
In-Reply-To: <20180523113237.31269-1-peter@korsgaard.com>
References: <20180523113237.31269-1-peter@korsgaard.com>
Message-ID: <20180523113237.31269-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                       |  1 +
 package/Config.in                                |  1 +
 package/python-request-id/Config.in              |  7 +++++++
 package/python-request-id/python-request-id.hash |  5 +++++
 package/python-request-id/python-request-id.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/python-request-id/Config.in
 create mode 100644 package/python-request-id/python-request-id.hash
 create mode 100644 package/python-request-id/python-request-id.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 63d554bf28..3c2c032980 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1492,6 +1492,7 @@ F:	package/python-functools32/
 F:	package/python-ipaddr/
 F:	package/python-pam/
 F:	package/python-psutil/
+F:	package/python-request-id/
 F:	package/python-texttable/
 F:	package/python-webob/
 F:	package/python-websocket-client/
diff --git a/package/Config.in b/package/Config.in
index 277186becb..6cd19ec97f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -914,6 +914,7 @@ menu "External python modules"
 	source "package/python-raven/Config.in"
 	source "package/python-reentry/Config.in"
 	source "package/python-remi/Config.in"
+	source "package/python-request-id/Config.in"
 	source "package/python-requests/Config.in"
 	source "package/python-requests-oauthlib/Config.in"
 	source "package/python-requests-toolbelt/Config.in"
diff --git a/package/python-request-id/Config.in b/package/python-request-id/Config.in
new file mode 100644
index 0000000000..39b5456d00
--- /dev/null
+++ b/package/python-request-id/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_REQUEST_ID
+	bool "python-request-id"
+	select BR2_PACKAGE_PYTHON_WEBOB # runtime
+	help
+	  Attach a unique identifier to every WSGI request.
+
+	  https://github.com/mmerickel/request_id
diff --git a/package/python-request-id/python-request-id.hash b/package/python-request-id/python-request-id.hash
new file mode 100644
index 0000000000..f412502b94
--- /dev/null
+++ b/package/python-request-id/python-request-id.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/request-id/json
+md5	29cdbb13f26c0e944e58cfbebfc52085  request-id-0.3.1.tar.gz
+sha256	4c8adff44ad6779305d5493f780400aff5ff5139e98d622379c0e0797b58d812  request-id-0.3.1.tar.gz
+# Locally computed sha256 checksums
+sha256	2d65d17b4df34f184557b8031df05e4c264d2fa6b82e560be074967eff3b326c  LICENSE.txt
diff --git a/package/python-request-id/python-request-id.mk b/package/python-request-id/python-request-id.mk
new file mode 100644
index 0000000000..96601b9750
--- /dev/null
+++ b/package/python-request-id/python-request-id.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-request-id
+#
+################################################################################
+
+PYTHON_REQUEST_ID_VERSION = 0.3.1
+PYTHON_REQUEST_ID_SOURCE = request-id-$(PYTHON_REQUEST_ID_VERSION).tar.gz
+PYTHON_REQUEST_ID_SITE = https://files.pythonhosted.org/packages/2e/d4/bbe8cdd41012ba54d453452837101cecbb4151866b8aab6ca1ffb00d398c
+PYTHON_REQUEST_ID_SETUP_TYPE = setuptools
+PYTHON_REQUEST_ID_LICENSE = MIT
+PYTHON_REQUEST_ID_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
-- 
2.11.0
