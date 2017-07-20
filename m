From: Diankun Zhang <kundy.zhang@gmail.com>
Date: Thu, 20 Jul 2017 15:33:17 +0800
Subject: [Buildroot] [PATCH 1/1] package/python: fix building _hashlib of
	host-python
Message-ID: <CAO6UsjCZQUKvmA-a0votPq5AFZ6ESkwpNbLvfEymU5uy_SdggA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

?
The python buildin module _hashlib has dependency on library
libcrypto.so to provide the SHA-224, SHA-256, SHA-384, SHA-512
hash algorithms in addition to platform optimized versions
of MD5 and SHA1. Adding host package dependency on host-openssl
to support the building of _hashlib module for host-python.

Signed-off-by: Diankun Zhang <kundy.zhang@gmail.com>
---
 package/python/python.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index cf1ddfb..248393c 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -56,7 +56,7 @@ HOST_PYTHON_MAKE = $(MAKE1)

 PYTHON_DEPENDENCIES = host-python libffi $(TARGET_NLS_DEPENDENCIES)

-HOST_PYTHON_DEPENDENCIES = host-expat host-zlib
+HOST_PYTHON_DEPENDENCIES = host-expat host-zlib host-openssl

 PYTHON_INSTALL_STAGING = YES


-- 
-Diankun
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170720/990c22a6/attachment.html>
