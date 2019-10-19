From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 19 Oct 2019 20:26:38 +0200
Subject: [Buildroot] [git commit] package/python-msgfy: new package
Message-ID: <20191019182739.5217882866@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6091bd9db616d6a9cd925538ca852ce61896703f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in                      |  1 +
 package/python-msgfy/Config.in         |  7 +++++++
 package/python-msgfy/python-msgfy.hash |  5 +++++
 package/python-msgfy/python-msgfy.mk   | 14 ++++++++++++++
 4 files changed, 27 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index ac02b84db4..c8ff524e83 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -963,6 +963,7 @@ menu "External python modules"
 	source "package/python-mimeparse/Config.in"
 	source "package/python-mistune/Config.in"
 	source "package/python-more-itertools/Config.in"
+	source "package/python-msgfy/Config.in"
 	source "package/python-msgpack/Config.in"
 	source "package/python-multidict/Config.in"
 	source "package/python-mutagen/Config.in"
diff --git a/package/python-msgfy/Config.in b/package/python-msgfy/Config.in
new file mode 100644
index 0000000000..7875379e9e
--- /dev/null
+++ b/package/python-msgfy/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_MSGFY
+	bool "python-msgfy"
+	help
+	  msgfy is a Python library for convert Exception instance to
+	  a human-readable error message.
+
+	  https://github.com/thombashi/msgfy
diff --git a/package/python-msgfy/python-msgfy.hash b/package/python-msgfy/python-msgfy.hash
new file mode 100644
index 0000000000..8f664ec2e5
--- /dev/null
+++ b/package/python-msgfy/python-msgfy.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/msgfy/json
+md5	3a94f49d7b31cc7bca21e0a9bfadf767  msgfy-0.0.7.tar.gz
+sha256	370c54bb036d3728af8004e750b7cd7bc5a4ac25f9cdb8be13b7865cae3c73ee  msgfy-0.0.7.tar.gz
+# Locally computed sha256 checksums
+sha256	fcfe96f8fb1bf3478a51c828e7f7afee01500ce1c2d4345d052edb858be05227  LICENSE
diff --git a/package/python-msgfy/python-msgfy.mk b/package/python-msgfy/python-msgfy.mk
new file mode 100644
index 0000000000..0a642b4344
--- /dev/null
+++ b/package/python-msgfy/python-msgfy.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-msgfy
+#
+################################################################################
+
+PYTHON_MSGFY_VERSION = 0.0.7
+PYTHON_MSGFY_SOURCE = msgfy-$(PYTHON_MSGFY_VERSION).tar.gz
+PYTHON_MSGFY_SITE = https://files.pythonhosted.org/packages/23/82/b61a8353c36e60c2c8291c56ad7d00aa37918ef56811727510acada09f7f
+PYTHON_MSGFY_SETUP_TYPE = setuptools
+PYTHON_MSGFY_LICENSE = MIT
+PYTHON_MSGFY_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
