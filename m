From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Nov 2017 11:45:22 +0100
Subject: [Buildroot] [PATCH/next v2 2/3] package/python-requests-oauthlib:
 new package
In-Reply-To: <20171112104523.16791-1-bernd.kuhls@t-online.de>
References: <20171112104523.16791-1-bernd.kuhls@t-online.de>
Message-ID: <20171112104523.16791-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed for python-mwclient version bump to 0.8.6.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: fixed license (Yegor)

 DEVELOPERS                                                 |  1 +
 package/Config.in                                          |  1 +
 package/python-requests-oauthlib/Config.in                 |  8 ++++++++
 .../python-requests-oauthlib/python-requests-oauthlib.hash |  4 ++++
 .../python-requests-oauthlib/python-requests-oauthlib.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/python-requests-oauthlib/Config.in
 create mode 100644 package/python-requests-oauthlib/python-requests-oauthlib.hash
 create mode 100644 package/python-requests-oauthlib/python-requests-oauthlib.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index db9ff974b1..adcf818747 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -325,6 +325,7 @@ F:	package/python-mako/
 F:	package/python-oauthlib/
 F:	package/python-pyicu/
 F:	package/python-pylru/
+F:	package/python-requests-oauthlib/
 F:	package/python-slob/
 F:	package/rtmpdump/
 F:	package/softether/
diff --git a/package/Config.in b/package/Config.in
index 8ac25eff78..550fee84b2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -876,6 +876,7 @@ menu "External python modules"
 	source "package/python-pyyaml/Config.in"
 	source "package/python-pyzmq/Config.in"
 	source "package/python-requests/Config.in"
+	source "package/python-requests-oauthlib/Config.in"
 	source "package/python-requests-toolbelt/Config.in"
 	source "package/python-rpi-gpio/Config.in"
 	source "package/python-rtslib-fb/Config.in"
diff --git a/package/python-requests-oauthlib/Config.in b/package/python-requests-oauthlib/Config.in
new file mode 100644
index 0000000000..85283b209c
--- /dev/null
+++ b/package/python-requests-oauthlib/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_REQUESTS_OAUTHLIB
+	bool "python-requests-oauthlib"
+	select BR2_PACKAGE_PYTHON_OAUTHLIB # runtime
+	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
+	help
+	  OAuthlib authentication support for Requests.
+
+	  https://github.com/requests/requests-oauthlib
diff --git a/package/python-requests-oauthlib/python-requests-oauthlib.hash b/package/python-requests-oauthlib/python-requests-oauthlib.hash
new file mode 100644
index 0000000000..be0f644b80
--- /dev/null
+++ b/package/python-requests-oauthlib/python-requests-oauthlib.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/requests_oauthlib/json, sha256 locally computed
+md5	4358a879a4377393bcfd37d0f9ae6d4d  requests-oauthlib-0.8.0.tar.gz
+sha256	883ac416757eada6d3d07054ec7092ac21c7f35cb1d2cf82faf205637081f468  requests-oauthlib-0.8.0.tar.gz
+sha256	ae01846afad8a8291fe6a08966f3015af9a8ff675d84b981f9793c122f7876e8  LICENSE
diff --git a/package/python-requests-oauthlib/python-requests-oauthlib.mk b/package/python-requests-oauthlib/python-requests-oauthlib.mk
new file mode 100644
index 0000000000..02e3114e59
--- /dev/null
+++ b/package/python-requests-oauthlib/python-requests-oauthlib.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-requests-oauthlib
+#
+################################################################################
+
+PYTHON_REQUESTS_OAUTHLIB_VERSION = 0.8.0
+PYTHON_REQUESTS_OAUTHLIB_SOURCE = requests-oauthlib-$(PYTHON_REQUESTS_OAUTHLIB_VERSION).tar.gz
+PYTHON_REQUESTS_OAUTHLIB_SITE = https://pypi.python.org/packages/80/14/ad120c720f86c547ba8988010d5186102030591f71f7099f23921ca47fe5
+PYTHON_REQUESTS_OAUTHLIB_SETUP_TYPE = setuptools
+PYTHON_REQUESTS_OAUTHLIB_LICENSE = ISC
+PYTHON_REQUESTS_OAUTHLIB_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.11.0
