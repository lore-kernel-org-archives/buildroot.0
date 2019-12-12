From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Dec 2019 08:29:10 +0100
Subject: [Buildroot] [git commit] package/python-aiologstash: new package
Message-ID: <20191212072102.997EA8912D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5eb3e3728b7fce7bb016ce787bd0ac5fc8d972be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

asyncio-compatible logstash logging handler.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/python-aiologstash/Config.in               |  9 +++++++++
 package/python-aiologstash/python-aiologstash.hash |  5 +++++
 package/python-aiologstash/python-aiologstash.mk   | 14 ++++++++++++++
 5 files changed, 30 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c8be10dc92..66964d035d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1136,6 +1136,7 @@ F:	package/python-aiohttp-remotes/
 F:	package/python-aiohttp-security/
 F:	package/python-aiohttp-session/
 F:	package/python-aiohttp-sse/
+F:	package/python-aiologstash/
 F:	package/python-aiomonitor/
 F:	package/python-aiojobs/
 F:	package/python-aiorwlock/
diff --git a/package/Config.in b/package/Config.in
index cf004fec63..405732bc7a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -832,6 +832,7 @@ menu "External python modules"
 	source "package/python-aiohttp-session/Config.in"
 	source "package/python-aiohttp-sse/Config.in"
 	source "package/python-aiojobs/Config.in"
+	source "package/python-aiologstash/Config.in"
 	source "package/python-aiomonitor/Config.in"
 	source "package/python-aioredis/Config.in"
 	source "package/python-aiorwlock/Config.in"
diff --git a/package/python-aiologstash/Config.in b/package/python-aiologstash/Config.in
new file mode 100644
index 0000000000..e70c232fd2
--- /dev/null
+++ b/package/python-aiologstash/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_AIOLOGSTASH
+	bool "python-aiologstash"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_ASYNC_TIMEOUT # runtime
+	select BR2_PACKAGE_PYTHON_LOGSTASH # runtime
+	help
+	  asyncio-compatible logstash logging handler.
+
+	  https://github.com/aio-libs/aiologstash
diff --git a/package/python-aiologstash/python-aiologstash.hash b/package/python-aiologstash/python-aiologstash.hash
new file mode 100644
index 0000000000..ff7d2cce99
--- /dev/null
+++ b/package/python-aiologstash/python-aiologstash.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/aiologstash/json
+md5	1e321c11b34477f780f31b2553557d69  aiologstash-2.0.0.tar.gz
+sha256	698522126ffd4e905cd5f52a08092a0a78096c8f0e28bc1e303369873da71f78  aiologstash-2.0.0.tar.gz
+# Locally computed sha256 checksums
+sha256	beddf3a80aaaa71ebd6765b13bc680bd0450bb81191249cc889539523f9404ec  LICENSE
diff --git a/package/python-aiologstash/python-aiologstash.mk b/package/python-aiologstash/python-aiologstash.mk
new file mode 100644
index 0000000000..be1c40b714
--- /dev/null
+++ b/package/python-aiologstash/python-aiologstash.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-aiologstash
+#
+################################################################################
+
+PYTHON_AIOLOGSTASH_VERSION = 2.0.0
+PYTHON_AIOLOGSTASH_SOURCE = aiologstash-$(PYTHON_AIOLOGSTASH_VERSION).tar.gz
+PYTHON_AIOLOGSTASH_SITE = https://files.pythonhosted.org/packages/1c/dc/382861d5d25ccc976d02118922598fc4547f74f3287793e270ed614d8176
+PYTHON_AIOLOGSTASH_SETUP_TYPE = distutils
+PYTHON_AIOLOGSTASH_LICENSE = MIT
+PYTHON_AIOLOGSTASH_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
