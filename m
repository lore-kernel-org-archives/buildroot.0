From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 15 Sep 2020 22:24:15 +0200
Subject: [Buildroot] [git commit] package/python-botocore: new package.
Message-ID: <20200915202421.EA7A981518@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c8d721b5ba435225da83d12edfec07a1c43e45b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Low-level, data-driven core of boto 3.

Signed-off-by: Rapha??l M??lotte <raphael.melotte@essensium.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
Tested-by: Jagan Teki <jagan@amarulasolutions.com> # roc-rk3399-pc
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/python-botocore/Config.in            | 10 ++++++++++
 package/python-botocore/python-botocore.hash |  5 +++++
 package/python-botocore/python-botocore.mk   | 14 ++++++++++++++
 5 files changed, 31 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3615a5b063..8d989242c4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2211,6 +2211,7 @@ F:	package/bitwise/
 
 N:	Rapha??l M??lotte <raphael.melotte@essensium.com>
 F:	package/jbig2dec/
+F:	package/python-botocore/
 F:	package/python-jmespath/
 
 N:	Refik Tuzakli <tuzakli.refik@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 103d21f22e..448fa3759e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -897,6 +897,7 @@ menu "External python modules"
 	source "package/python-beautifulsoup4/Config.in"
 	source "package/python-bitstring/Config.in"
 	source "package/python-bluezero/Config.in"
+	source "package/python-botocore/Config.in"
 	source "package/python-bottle/Config.in"
 	source "package/python-brotli/Config.in"
 	source "package/python-bsdiff4/Config.in"
diff --git a/package/python-botocore/Config.in b/package/python-botocore/Config.in
new file mode 100644
index 0000000000..a552900b6c
--- /dev/null
+++ b/package/python-botocore/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_BOTOCORE
+	bool "python-botocore"
+	select BR2_PACKAGE_PYTHON_JMESPATH # runtime
+	select BR2_PACKAGE_PYTHON_DOCUTILS # runtime
+	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
+	select BR2_PACKAGE_PYTHON_URLLIB3 # runtime
+	help
+	  Low-level, data-driven core of boto 3.
+
+	  https://github.com/boto/botocore
diff --git a/package/python-botocore/python-botocore.hash b/package/python-botocore/python-botocore.hash
new file mode 100644
index 0000000000..446c67f833
--- /dev/null
+++ b/package/python-botocore/python-botocore.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/botocore/json
+md5  a75ae28d58d64dbf689d18ac3424342a  botocore-1.12.210.tar.gz
+sha256  7983b7624b3f71648a7101fbcb437e3d599b4f79b754e89220e574482a2f8298  botocore-1.12.210.tar.gz
+# Locally computed sha256 checksums
+sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.txt
diff --git a/package/python-botocore/python-botocore.mk b/package/python-botocore/python-botocore.mk
new file mode 100644
index 0000000000..378bd93768
--- /dev/null
+++ b/package/python-botocore/python-botocore.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-botocore
+#
+################################################################################
+
+PYTHON_BOTOCORE_VERSION = 1.12.210
+PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
+PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/39/78/068e7cf5bb9901f34eacbf449cdfbdf32e470333930cbcda890cfc9fb820
+PYTHON_BOTOCORE_SETUP_TYPE = setuptools
+PYTHON_BOTOCORE_LICENSE = Apache-2.0
+PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
