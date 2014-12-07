From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 23:10:14 +0100
Subject: [Buildroot] [git commit] python-ipaddr: new package
Message-ID: <20141207221025.96ECD7FF20@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6ce7cf7f75690dc22081c8572b62400a06d2d7b6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The functionality is included in python3 as the ipaddress module, so make it
python2 only.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                        |    1 +
 package/python-ipaddr/Config.in          |    9 +++++++++
 package/python-ipaddr/python-ipaddr.hash |    3 +++
 package/python-ipaddr/python-ipaddr.mk   |   14 ++++++++++++++
 4 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index a8010d3..40eba6d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -497,6 +497,7 @@ menu "external python modules"
 	source "package/python-gobject/Config.in"
 	source "package/python-httplib2/Config.in"
 	source "package/python-id3/Config.in"
+	source "package/python-ipaddr/Config.in"
 	source "package/python-ipy/Config.in"
 	source "package/python-ipython/Config.in"
 	source "package/python-itsdangerous/Config.in"
diff --git a/package/python-ipaddr/Config.in b/package/python-ipaddr/Config.in
new file mode 100644
index 0000000..cce67c1
--- /dev/null
+++ b/package/python-ipaddr/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_IPADDR
+       depends on BR2_PACKAGE_PYTHON # included since python3.3
+       bool "python-ipaddr"
+	help
+	  An IPv4/IPv6 manipulation library in Python. This library is
+	  used to create/poke/manipulate IPv4 and IPv6 addresses and
+	  prefixes.
+
+	  https://code.google.com/p/ipaddr-py/
diff --git a/package/python-ipaddr/python-ipaddr.hash b/package/python-ipaddr/python-ipaddr.hash
new file mode 100644
index 0000000..99e1ca9
--- /dev/null
+++ b/package/python-ipaddr/python-ipaddr.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=f2c7852f95862715f92e7d089dc3f2cf, sha256 locally computed
+md5	f2c7852f95862715f92e7d089dc3f2cf  ipaddr-2.1.11.tar.gz
+sha256	1b555b8a8800134fdafe32b7d0cb52f5bdbfdd093707c3dd484c5ea59f1d98b7  ipaddr-2.1.11.tar.gz
diff --git a/package/python-ipaddr/python-ipaddr.mk b/package/python-ipaddr/python-ipaddr.mk
new file mode 100644
index 0000000..8bfb543
--- /dev/null
+++ b/package/python-ipaddr/python-ipaddr.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-ipaddr
+#
+################################################################################
+
+PYTHON_IPADDR_VERSION = 2.1.11
+PYTHON_IPADDR_SOURCE = ipaddr-$(PYTHON_IPADDR_VERSION).tar.gz
+PYTHON_IPADDR_SITE = http://pypi.python.org/packages/source/i/ipaddr
+PYTHON_IPADDR_SETUP_TYPE = distutils
+PYTHON_IPADDR_LICENSE = Apache-2.0
+PYTHON_IPADDR_LICENSE_FILES = COPYING
+
+$(eval $(python-package))
