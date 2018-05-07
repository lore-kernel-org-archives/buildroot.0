From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon,  7 May 2018 13:57:33 -0700
Subject: [Buildroot] [PATCH 1/1] python-websockets: backport fix for
 upstream issue #350
Message-ID: <20180507205733.2433-1-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/python-websockets/python-websockets.hash | 1 +
 package/python-websockets/python-websockets.mk   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/python-websockets/python-websockets.hash b/package/python-websockets/python-websockets.hash
index 18947cc60a..4fa2fba1e1 100644
--- a/package/python-websockets/python-websockets.hash
+++ b/package/python-websockets/python-websockets.hash
@@ -2,3 +2,4 @@
 md5	9e8c6b3c70def4146d75fbb0f52bdfc7  websockets-4.0.1.tar.gz
 sha256	da4d4fbe059b0453e726d6d993760065d69b823a27efc3040402a6fcfe6a1ed9  websockets-4.0.1.tar.gz
 sha256	2cd4d416e432ca7fda2c103b38b852f8d3cb327d70c3db44410b9fe97e6c4d73  LICENSE
+sha256  c43360df2209d8af756297af7d8d1ff0a98483fc2d6551be80f309a6a6671ece  402059e4a46a764632eba8a669f5b012f173ee7b.patch
diff --git a/package/python-websockets/python-websockets.mk b/package/python-websockets/python-websockets.mk
index 7c5cf8c4e7..e0a701af43 100644
--- a/package/python-websockets/python-websockets.mk
+++ b/package/python-websockets/python-websockets.mk
@@ -10,5 +10,6 @@ PYTHON_WEBSOCKETS_SITE = https://pypi.python.org/packages/b6/12/6194aac840c65253
 PYTHON_WEBSOCKETS_SETUP_TYPE = setuptools
 PYTHON_WEBSOCKETS_LICENSE = BSD-3-Clause
 PYTHON_WEBSOCKETS_LICENSE_FILES = LICENSE
+PYTHON_WEBSOCKETS_PATCH += https://github.com/aaugustin/websockets/commit/402059e4a46a764632eba8a669f5b012f173ee7b.patch
 
 $(eval $(python-package))
-- 
2.17.0
