From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Oct 2019 23:18:19 +0200
Subject: [Buildroot] [git commit] package/snmpclitools: new package
Message-ID: <20191022211245.0893E7FC40@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4ddcc739688b57b751d88f7a3fafd3f3c86e501b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For now, we use PKG-INFO as license file, since LICENSE.rst isn't
provided with the tarball.
A pull request was sent upstream:
https://github.com/etingof/snmpclitools/pull/11

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/snmpclitools/Config.in         |  9 +++++++++
 package/snmpclitools/snmpclitools.hash |  5 +++++
 package/snmpclitools/snmpclitools.mk   | 13 +++++++++++++
 5 files changed, 29 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8f40eef790..4f958da22c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -235,6 +235,7 @@ N:	Asaf Kahlon <asafka7@gmail.com>
 F:	package/collectd/
 F:	package/libuv/
 F:	package/python*
+F:	package/snmpclitools/
 F:	package/spdlog/
 F:	package/uftp/
 F:	package/zeromq/
diff --git a/package/Config.in b/package/Config.in
index 467c5861d5..a12ffe93f0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2084,6 +2084,7 @@ endif
 	source "package/shellinabox/Config.in"
 	source "package/smcroute/Config.in"
 	source "package/sngrep/Config.in"
+	source "package/snmpclitools/Config.in"
 	source "package/snort/Config.in"
 	source "package/socat/Config.in"
 	source "package/socketcand/Config.in"
diff --git a/package/snmpclitools/Config.in b/package/snmpclitools/Config.in
new file mode 100644
index 0000000000..00bf5994d1
--- /dev/null
+++ b/package/snmpclitools/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_SNMPCLITOOLS
+	bool "snmpclitools"
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_PYSMI # runtime
+	select BR2_PACKAGE_PYTHON_PYSNMP # runtime
+	help
+	  SNMP command-line tools.
+
+	  https://github.com/etingof/snmpclitools
diff --git a/package/snmpclitools/snmpclitools.hash b/package/snmpclitools/snmpclitools.hash
new file mode 100644
index 0000000000..4dcbdcb6e0
--- /dev/null
+++ b/package/snmpclitools/snmpclitools.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/snmpclitools/json
+md5	132b100f5e7b80715e6c1d424e89687c  snmpclitools-0.6.4.tar.gz
+sha256	820c45de419bf355c845a96610a395ec18a15176ac0362d388da7740266ea1ac  snmpclitools-0.6.4.tar.gz
+# Locally computed sha256 checksums
+sha256	ed5561a0f5b75e93aa026c1b9fdef58e7ccbf6b2e9a2458be732afc288209d23  PKG-INFO
diff --git a/package/snmpclitools/snmpclitools.mk b/package/snmpclitools/snmpclitools.mk
new file mode 100644
index 0000000000..a4a90e5bf1
--- /dev/null
+++ b/package/snmpclitools/snmpclitools.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# snmpclitools
+#
+################################################################################
+
+SNMPCLITOOLS_VERSION = 0.6.4
+SNMPCLITOOLS_SITE = https://files.pythonhosted.org/packages/03/2a/8488828e92a82c5416e33fba6089283162937b0f73e5b15205fb6ec3bbea
+SNMPCLITOOLS_SETUP_TYPE = setuptools
+SNMPCLITOOLS_LICENSE = BSD-2-Clause
+SNMPCLITOOLS_LICENSE_FILES = PKG-INFO
+
+$(eval $(python-package))
