From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 1 Nov 2018 11:54:29 +0100
Subject: [Buildroot] [git commit] python-multidict: new package
Message-ID: <20181101105259.52E3D83A82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a4e3de63e43af74c021307567e5cc8570ce4654c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Multidict is dict-like collection of key-value pairs where a key may
occur more than once in the container.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
[Arnout: extend help text based on commit message.]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in                              |  1 +
 package/python-multidict/Config.in             |  8 ++++++++
 package/python-multidict/python-multidict.hash |  5 +++++
 package/python-multidict/python-multidict.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index dc49e7c2ba..3334d0d1cf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -908,6 +908,7 @@ menu "External python modules"
 	source "package/python-mistune/Config.in"
 	source "package/python-more-itertools/Config.in"
 	source "package/python-msgpack/Config.in"
+	source "package/python-multidict/Config.in"
 	source "package/python-mutagen/Config.in"
 	source "package/python-mwclient/Config.in"
 	source "package/python-mwscrape/Config.in"
diff --git a/package/python-multidict/Config.in b/package/python-multidict/Config.in
new file mode 100644
index 0000000000..7bfaa36db2
--- /dev/null
+++ b/package/python-multidict/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_MULTIDICT
+	bool "python-multidict"
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  Multidict is dict-like collection of key-value pairs where a
+	  key may occur more than once in the container.
+
+	  https://github.com/aio-libs/multidict
diff --git a/package/python-multidict/python-multidict.hash b/package/python-multidict/python-multidict.hash
new file mode 100644
index 0000000000..aa15eed1c7
--- /dev/null
+++ b/package/python-multidict/python-multidict.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/multidict/json
+md5	55d19168f955e5463c6f6b530e913da3  multidict-4.4.2.tar.gz
+sha256	3c11e92c3dfc321014e22fb442bc9eb70e01af30d6ce442026b0c35723448c66  multidict-4.4.2.tar.gz
+# Locally computed sha256 checksums
+sha256	a1c5825513279d3085a0ba46880e148ea3710c149bbaedcf2d11605a5ed3c4ad  LICENSE
diff --git a/package/python-multidict/python-multidict.mk b/package/python-multidict/python-multidict.mk
new file mode 100644
index 0000000000..f88135cb69
--- /dev/null
+++ b/package/python-multidict/python-multidict.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-multidict
+#
+################################################################################
+
+PYTHON_MULTIDICT_VERSION = 4.4.2
+PYTHON_MULTIDICT_SOURCE = multidict-$(PYTHON_MULTIDICT_VERSION).tar.gz
+PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/b3/5f/5c29cde8511c95fad045b9ecaf2e76f0da18761e8363a82594f5a58c2ced
+PYTHON_MULTIDICT_SETUP_TYPE = setuptools
+PYTHON_MULTIDICT_LICENSE = Apache-2.0
+PYTHON_MULTIDICT_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
