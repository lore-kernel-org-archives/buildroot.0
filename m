From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Nov 2014 22:13:26 +0100
Subject: [Buildroot] [git commit branch/next] python-certifi: add new package
Message-ID: <20141123211331.062277FE2F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f898daf3a17cf8d7860c23e928d55ac5957ea609
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                          |    1 +
 package/python-certifi/Config.in           |    6 ++++++
 package/python-certifi/python-certifi.hash |    2 ++
 package/python-certifi/python-certifi.mk   |   14 ++++++++++++++
 4 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 9188041..a8128ff 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -483,6 +483,7 @@ endif
 if BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 menu "external python modules"
 	source "package/python-bottle/Config.in"
+	source "package/python-certifi/Config.in"
 	source "package/python-cffi/Config.in"
 	source "package/python-configobj/Config.in"
 	source "package/python-configshell-fb/Config.in"
diff --git a/package/python-certifi/Config.in b/package/python-certifi/Config.in
new file mode 100644
index 0000000..9390b4f
--- /dev/null
+++ b/package/python-certifi/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_CERTIFI
+	bool "python-certifi"
+	help
+	  Python package for providing Mozilla's CA Bundle.
+
+	  https://pypi.python.org/pypi/certifi
diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
new file mode 100644
index 0000000..9277f51
--- /dev/null
+++ b/package/python-certifi/python-certifi.hash
@@ -0,0 +1,2 @@
+sha1   f53dc8f57aaf6d69c183ebadcec52ece0a55cc3f                         certifi-14.05.14.tar.gz
+sha256 1e1bcbacd6357c151ae37cf0290dcc809721d32ce21fd6b7339568f3ddef1b69 certifi-14.05.14.tar.gz
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
new file mode 100644
index 0000000..f142041
--- /dev/null
+++ b/package/python-certifi/python-certifi.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-certifi
+#
+################################################################################
+
+PYTHON_CERTIFI_VERSION = 14.05.14
+PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
+PYTHON_CERTIFI_SITE = https://pypi.python.org/packages/source/c/certifi
+PYTHON_CERTIFI_SETUP_TYPE = setuptools
+PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
+PYTHON_CERTIFI_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
