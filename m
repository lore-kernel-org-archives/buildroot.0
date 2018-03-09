From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri,  9 Mar 2018 20:16:54 +0100
Subject: [Buildroot] [PATCH 03/10] package: add
 python-backports-ssl-match-hostname
In-Reply-To: <20180309191701.23760-1-peter@korsgaard.com>
References: <20180309191701.23760-1-peter@korsgaard.com>
Message-ID: <20180309191701.23760-4-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ssl.match_hostname() function from Python 3.5.

This function IS available in python 2.7 since 2.7.9, but it doesn't support
matching on IP addresses which is needed for some use cases.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                                 |  1 +
 package/Config.in                                          |  1 +
 package/python-backports-ssl-match-hostname/Config.in      |  7 +++++++
 .../python-backports-ssl-match-hostname.hash               |  4 ++++
 .../python-backports-ssl-match-hostname.mk                 | 14 ++++++++++++++
 5 files changed, 27 insertions(+)
 create mode 100644 package/python-backports-ssl-match-hostname/Config.in
 create mode 100644 package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.hash
 create mode 100644 package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d4bd10fa28..34ecfeeb02 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1384,6 +1384,7 @@ F:	package/lzop/
 F:	package/memtool/
 F:	package/mosquitto/
 F:	package/python-alsaaudio/
+F:	package/python-backports-ssl-match-hostname/
 F:	package/python-docker-pycreds/
 F:	package/python-enum/
 F:	package/python-enum34/
diff --git a/package/Config.in b/package/Config.in
index 9c727cad6c..d3018aee47 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -732,6 +732,7 @@ menu "External python modules"
 	source "package/python-babel/Config.in"
 	source "package/python-backports-abc/Config.in"
 	source "package/python-backports-shutil-get-terminal-size/Config.in"
+	source "package/python-backports-ssl-match-hostname/Config.in"
 	source "package/python-bcrypt/Config.in"
 	source "package/python-beautifulsoup4/Config.in"
 	source "package/python-bitstring/Config.in"
diff --git a/package/python-backports-ssl-match-hostname/Config.in b/package/python-backports-ssl-match-hostname/Config.in
new file mode 100644
index 0000000000..8e55191a9e
--- /dev/null
+++ b/package/python-backports-ssl-match-hostname/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME
+	bool "python-backports-ssl-match-hostname"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  The ssl.match_hostname() function from Python 3.5.
+
+	  http://bitbucket.org/brandon/backports.ssl_match_hostname
diff --git a/package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.hash b/package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.hash
new file mode 100644
index 0000000000..b43e1af5a6
--- /dev/null
+++ b/package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/backports.ssl_match_hostname/json, sha256 locally computed
+md5	c03fc5e2c7b3da46b81acf5cbacfe1e6  backports.ssl_match_hostname-3.5.0.1.tar.gz
+sha256	502ad98707319f4a51fa2ca1c677bd659008d27ded9f6380c79e8932e38dcdf2  backports.ssl_match_hostname-3.5.0.1.tar.gz
+sha256	bfc8a75a4b9aec224aa7973c0c9d7cc0134bdcbf8eefd008936b58554d66e97e  backports/ssl_match_hostname/LICENSE.txt
diff --git a/package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.mk b/package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.mk
new file mode 100644
index 0000000000..01c8bc448c
--- /dev/null
+++ b/package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-backports-ssl-match-hostname
+#
+################################################################################
+
+PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_VERSION = 3.5.0.1
+PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_SOURCE = backports.ssl_match_hostname-$(PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_VERSION).tar.gz
+PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_SITE = https://pypi.python.org/packages/76/21/2dc61178a2038a5cb35d14b61467c6ac632791ed05131dda72c20e7b9e23
+PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_SETUP_TYPE = distutils
+PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_LICENSE = Python-2.0
+PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_LICENSE_FILES = backports/ssl_match_hostname/LICENSE.txt
+
+$(eval $(python-package))
-- 
2.11.0
