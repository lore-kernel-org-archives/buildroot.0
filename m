From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed, 20 Apr 2016 11:22:54 +0200
Subject: [Buildroot] [PATCH] python-backports-ssl-match-hostname: new package
Message-ID: <1461144174-7711-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Fixes #8856

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                                          |  1 +
 package/python-backports-ssl-match-hostname/Config.in      |  6 ++++++
 .../python-backports-ssl-match-hostname.hash               |  4 ++++
 .../python-backports-ssl-match-hostname.mk                 | 14 ++++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/python-backports-ssl-match-hostname/Config.in
 create mode 100644 package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.hash
 create mode 100644 package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.mk

diff --git a/package/Config.in b/package/Config.in
index ecaf164..3b5e66e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -630,6 +630,7 @@ menu "External python modules"
 	source "package/python-alsaaudio/Config.in"
 	source "package/python-autobahn/Config.in"
 	source "package/python-backports-abc/Config.in"
+	source "package/python-backports-ssl-match-hostname/Config.in"
 	source "package/python-beautifulsoup4/Config.in"
 	source "package/python-bottle/Config.in"
 	source "package/python-can/Config.in"
diff --git a/package/python-backports-ssl-match-hostname/Config.in b/package/python-backports-ssl-match-hostname/Config.in
new file mode 100644
index 0000000..36399bb
--- /dev/null
+++ b/package/python-backports-ssl-match-hostname/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME
+	bool "python-backports-ssl-match-hostname"
+	help
+	  The ssl.match_hostname() function from Python 3.5.
+
+	  http://bitbucket.org/brandon/backports.ssl_match_hostname
diff --git a/package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.hash b/package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.hash
new file mode 100644
index 0000000..8313d96
--- /dev/null
+++ b/package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/backports.ssl_match_hostname/json
+md5	c03fc5e2c7b3da46b81acf5cbacfe1e6  backports.ssl_match_hostname-3.5.0.1.tar.gz
+# sha256 calculated by scanpypi
+sha256	502ad98707319f4a51fa2ca1c677bd659008d27ded9f6380c79e8932e38dcdf2  backports.ssl_match_hostname-3.5.0.1.tar.gz
diff --git a/package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.mk b/package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.mk
new file mode 100644
index 0000000..6848dd2
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
+PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_SITE = https://pypi.python.org/packages/source/b/backports.ssl_match_hostname
+PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_SETUP_TYPE = distutils
+PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_LICENSE = Python Software Foundation License v2
+PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_LICENSE_FILES = backports/ssl_match_hostname/LICENSE.txt
+
+$(eval $(python-package))
-- 
2.8.0.rc3
