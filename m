From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Dec 2018 23:53:36 +0100
Subject: [Buildroot] [git commit] package/python-aiohttp-sse: new package
Message-ID: <20181208225511.66FA885434@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d43c6f9f1e413e7fd04e3ff25c41895ecd5ea905
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Server-sent events support for aiohttp.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/python-aiohttp-sse/Config.in               |  8 ++++++++
 package/python-aiohttp-sse/python-aiohttp-sse.hash |  5 +++++
 package/python-aiohttp-sse/python-aiohttp-sse.mk   | 14 ++++++++++++++
 5 files changed, 29 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b30538f3da..0152c55f81 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -995,6 +995,7 @@ N:	James Hilliard <james.hilliard1@gmail.com>
 F:	package/python-aiodns/
 F:	package/python-aiohttp/
 F:	package/python-aiohttp-session/
+F:	package/python-aiohttp-sse/
 F:	package/python-async-timeout/
 F:	package/python-cchardet/
 F:	package/python-multidict/
diff --git a/package/Config.in b/package/Config.in
index 237ae9ad9f..71191b1abe 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -801,6 +801,7 @@ menu "External python modules"
 	source "package/python-aiodns/Config.in"
 	source "package/python-aiohttp/Config.in"
 	source "package/python-aiohttp-session/Config.in"
+	source "package/python-aiohttp-sse/Config.in"
 	source "package/python-alsaaudio/Config.in"
 	source "package/python-argh/Config.in"
 	source "package/python-arrow/Config.in"
diff --git a/package/python-aiohttp-sse/Config.in b/package/python-aiohttp-sse/Config.in
new file mode 100644
index 0000000000..781bbf4de7
--- /dev/null
+++ b/package/python-aiohttp-sse/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_AIOHTTP_SSE
+	bool "python-aiohttp-sse"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_AIOHTTP # runtime
+	help
+	  Server-sent events support for aiohttp.
+
+	  https://github.com/aio-libs/aiohttp_sse/
diff --git a/package/python-aiohttp-sse/python-aiohttp-sse.hash b/package/python-aiohttp-sse/python-aiohttp-sse.hash
new file mode 100644
index 0000000000..2f21da462e
--- /dev/null
+++ b/package/python-aiohttp-sse/python-aiohttp-sse.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/aiohttp-sse/json
+md5	d2f394fb75f591045b2c94fc17c8533d  aiohttp-sse-2.0.0.tar.gz
+sha256	547e1eaa129749f090d02b31956215edbcde74ce99721f5f0ac902a9ccb1202e  aiohttp-sse-2.0.0.tar.gz
+# Locally computed sha256 checksums
+sha256	cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  LICENSE
diff --git a/package/python-aiohttp-sse/python-aiohttp-sse.mk b/package/python-aiohttp-sse/python-aiohttp-sse.mk
new file mode 100644
index 0000000000..7a7a0d0a70
--- /dev/null
+++ b/package/python-aiohttp-sse/python-aiohttp-sse.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-aiohttp-sse
+#
+################################################################################
+
+PYTHON_AIOHTTP_SSE_VERSION = 2.0.0
+PYTHON_AIOHTTP_SSE_SOURCE = aiohttp-sse-$(PYTHON_AIOHTTP_SSE_VERSION).tar.gz
+PYTHON_AIOHTTP_SSE_SITE = https://files.pythonhosted.org/packages/2b/50/e127729f7df53c32c96b5c71932a7262cad40c83f1e19c218b068c816d51
+PYTHON_AIOHTTP_SSE_SETUP_TYPE = setuptools
+PYTHON_AIOHTTP_SSE_LICENSE = Apache-2.0
+PYTHON_AIOHTTP_SSE_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
