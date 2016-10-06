From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  6 Oct 2016 06:48:57 +0200
Subject: [Buildroot] [PATCH 4/5] package/python-mwclient: new package
In-Reply-To: <20161006044858.27768-1-bernd.kuhls@t-online.de>
References: <20161006044858.27768-1-bernd.kuhls@t-online.de>
Message-ID: <20161006044858.27768-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed by upcoming python-mwscrape package.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                            |  1 +
 package/python-mwclient/Config.in            |  8 ++++++++
 package/python-mwclient/python-mwclient.hash |  3 +++
 package/python-mwclient/python-mwclient.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-mwclient/Config.in
 create mode 100644 package/python-mwclient/python-mwclient.hash
 create mode 100644 package/python-mwclient/python-mwclient.mk

diff --git a/package/Config.in b/package/Config.in
index 9b67c76..1f6b397 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -708,6 +708,7 @@ menu "External python modules"
 	source "package/python-meld3/Config.in"
 	source "package/python-mistune/Config.in"
 	source "package/python-msgpack/Config.in"
+	source "package/python-mwclient/Config.in"
 	source "package/python-netaddr/Config.in"
 	source "package/python-netifaces/Config.in"
 	source "package/python-networkmanager/Config.in"
diff --git a/package/python-mwclient/Config.in b/package/python-mwclient/Config.in
new file mode 100644
index 0000000..be88978
--- /dev/null
+++ b/package/python-mwclient/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_MWCLIENT
+	bool "python-mwclient"
+	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	help
+	  MediaWiki API client.
+
+	  https://github.com/btongminh/mwclient
diff --git a/package/python-mwclient/python-mwclient.hash b/package/python-mwclient/python-mwclient.hash
new file mode 100644
index 0000000..1098971
--- /dev/null
+++ b/package/python-mwclient/python-mwclient.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/mwclient/json, sha256 locally computed
+md5	c1334facf2d6ca54fe6dba4ab75ecf34  mwclient-0.8.1.tar.gz
+sha256	5f892711cc0b23ff2a6d8b7986ee63cd43fd1ec92b0783604ffa7613cd1662e4  mwclient-0.8.1.tar.gz
diff --git a/package/python-mwclient/python-mwclient.mk b/package/python-mwclient/python-mwclient.mk
new file mode 100644
index 0000000..7c7f84c
--- /dev/null
+++ b/package/python-mwclient/python-mwclient.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-mwclient
+#
+################################################################################
+
+PYTHON_MWCLIENT_VERSION = 0.8.1
+PYTHON_MWCLIENT_SOURCE = mwclient-$(PYTHON_MWCLIENT_VERSION).tar.gz
+PYTHON_MWCLIENT_SITE = https://pypi.python.org/packages/19/79/481b288a497f625ee8f76141ff3472d81428b1f14b7155a28a63a3247197
+PYTHON_MWCLIENT_SETUP_TYPE = setuptools
+PYTHON_MWCLIENT_LICENSE = MIT
+PYTHON_MWCLIENT_DEPENDENCIES = python-requests python-six
+
+$(eval $(python-package))
-- 
2.9.3
