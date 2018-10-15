From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Oct 2018 07:18:37 +0200
Subject: [Buildroot] [git commit] python-logbook: bump to version 1.4.1
Message-ID: <20181015052049.950F6837D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fbaf0a6db208f77e0f69c36b7338e8c37ad269d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

logbook also needs zlib (for gzip)

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-logbook/Config.in           | 2 ++
 package/python-logbook/python-logbook.hash | 4 ++--
 package/python-logbook/python-logbook.mk   | 4 ++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python-logbook/Config.in b/package/python-logbook/Config.in
index 9ae914432d..d4fbf0fe67 100644
--- a/package/python-logbook/Config.in
+++ b/package/python-logbook/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_PYTHON_LOGBOOK
 	bool "python-logbook"
+	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3
 	help
 	  A logging replacement for Python.
 
diff --git a/package/python-logbook/python-logbook.hash b/package/python-logbook/python-logbook.hash
index b15f8b9959..a32ff3bde2 100644
--- a/package/python-logbook/python-logbook.hash
+++ b/package/python-logbook/python-logbook.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/logbook/json
-md5	926d40a90cfe8eceade449fca2314b16  Logbook-1.4.0.tar.gz
-sha256	3c0a3ebd48e89fcdd725fe393eb9226c789dca5a4e7842d65e2f256645fd1cd9  Logbook-1.4.0.tar.gz
+md5	c9fab07b6a91aa7358155baa16802707  Logbook-1.4.1.tar.gz
+sha256	32375ce706d04a46886f9818bb953e53e0eda636552d7c0a2e482dd670fa56db  Logbook-1.4.1.tar.gz
 # Locally computed sha256 checksums
 sha256	2ca266337cc6947578654ab0dd6438de4d01fa78b2e6eb554b09757df1178f98  LICENSE
diff --git a/package/python-logbook/python-logbook.mk b/package/python-logbook/python-logbook.mk
index 25a520dc83..ab1b2703e2 100644
--- a/package/python-logbook/python-logbook.mk
+++ b/package/python-logbook/python-logbook.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LOGBOOK_VERSION = 1.4.0
+PYTHON_LOGBOOK_VERSION = 1.4.1
 PYTHON_LOGBOOK_SOURCE = Logbook-$(PYTHON_LOGBOOK_VERSION).tar.gz
-PYTHON_LOGBOOK_SITE = https://files.pythonhosted.org/packages/36/4b/b610bee18d5cfc4cec7dde056639994e9b34991e4c57816bfff0f3d0ac33
+PYTHON_LOGBOOK_SITE = https://files.pythonhosted.org/packages/74/fc/3e7557ed1ef1bd4e3ee189fc670416abfc7192b550e8d3c1d858a63f41ab
 PYTHON_LOGBOOK_SETUP_TYPE = setuptools
 PYTHON_LOGBOOK_LICENSE = BSD-3-Clause
 PYTHON_LOGBOOK_LICENSE_FILES = LICENSE
