From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Oct 2019 22:10:47 +0200
Subject: [Buildroot] [git commit] package/python-websocket-client: bump to
 version 0.56.0
Message-ID: <20191005200658.E7FE37FA96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7a2224273d883eca2b55e73851e0a14ba2b475e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The license file has changed to BSD-3-Clause, but the source files
still specify the LGPL-2.1+ license, so we'll have to specify both
licenses for now.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-websocket-client/python-websocket-client.hash | 9 +++++----
 package/python-websocket-client/python-websocket-client.mk   | 9 ++++++---
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/package/python-websocket-client/python-websocket-client.hash b/package/python-websocket-client/python-websocket-client.hash
index 3672ca074b..735cb53e1c 100644
--- a/package/python-websocket-client/python-websocket-client.hash
+++ b/package/python-websocket-client/python-websocket-client.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/websocket-client/json, sha256 locally computed
-md5	790b3ecb5364293ad70c59a1b92debb1  websocket_client-0.47.0.tar.gz
-sha256	a453dc4dfa6e0db3d8fd7738a308a88effe6240c59f3226eb93e8f020c216149  websocket_client-0.47.0.tar.gz
-sha256	e580b2a1a57c33085dd6a07cff693d828f7c3fa8a11ce56ade2a62c46951930d  LICENSE
+# md5, sha256 from https://pypi.org/pypi/websocket-client/json
+md5	89484bd5dac71123ae6a09b2f90fe62c  websocket_client-0.56.0.tar.gz
+sha256	1fd5520878b68b84b5748bb30e592b10d0a91529d5383f74f4964e72b297fd3a  websocket_client-0.56.0.tar.gz
+# Locally computed sha256 checksums
+sha256	a47b06717e8a3cf01d1307141287b1b4fa17fe4bb8785633d2fc6f57cb71d05e  LICENSE
diff --git a/package/python-websocket-client/python-websocket-client.mk b/package/python-websocket-client/python-websocket-client.mk
index 58c8407db3..518f7b29a9 100644
--- a/package/python-websocket-client/python-websocket-client.mk
+++ b/package/python-websocket-client/python-websocket-client.mk
@@ -4,11 +4,14 @@
 #
 ################################################################################
 
-PYTHON_WEBSOCKET_CLIENT_VERSION = 0.47.0
+PYTHON_WEBSOCKET_CLIENT_VERSION = 0.56.0
 PYTHON_WEBSOCKET_CLIENT_SOURCE = websocket_client-$(PYTHON_WEBSOCKET_CLIENT_VERSION).tar.gz
-PYTHON_WEBSOCKET_CLIENT_SITE = https://pypi.python.org/packages/c9/bb/8d3dd9063cfe0cd5d03fe6a1f74ddd948f384e9c1eff0eb978f3976a7d27
+PYTHON_WEBSOCKET_CLIENT_SITE = https://files.pythonhosted.org/packages/c5/01/8c9c7de6c46f88e70b5a3276c791a2be82ae83d8e0d0cc030525ee2866fd
 PYTHON_WEBSOCKET_CLIENT_SETUP_TYPE = setuptools
-PYTHON_WEBSOCKET_CLIENT_LICENSE = LGPL-2.1+
+# Project was under LGPL-2.1+, but was relicensed under
+# BSD-3-Clause. The LICENSE file contains the BSD-3-Clause text, but
+# the source files still contain a LGPL-2.1+ header.
+PYTHON_WEBSOCKET_CLIENT_LICENSE = LGPL-2.1+, BSD-3-Clause
 PYTHON_WEBSOCKET_CLIENT_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
