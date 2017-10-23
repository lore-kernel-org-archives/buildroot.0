From: Alexey Roslyakov <alexey.roslyakov@gmail.com>
Date: Mon, 23 Oct 2017 23:19:44 +0700
Subject: [Buildroot] [PATCH v2] python-protobuf: update dependencies
Message-ID: <20171023161944.3652-1-alexey.roslyakov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since version 3.0.0 protobuf is compatible with Python3, remove
Python2-only dependency.

It depends on python-six now, add this missing dependency.

Signed-off-by: Alexey Roslyakov <alexey.roslyakov@gmail.com>

---
Changes v1 -> v2:
  - just remove "depends on BR2_PACKAGE_PYTHON" (suggested by Yegor)
---
 package/python-protobuf/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-protobuf/Config.in b/package/python-protobuf/Config.in
index 68523e9c60..607fe48c2a 100644
--- a/package/python-protobuf/Config.in
+++ b/package/python-protobuf/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_PYTHON_PROTOBUF
 	bool "python-protobuf"
-	depends on BR2_PACKAGE_PYTHON
 	# host-protobuf only builds on certain architectures
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_HOST_GCC_AT_LEAST_4_5 # host-protobuf
+	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  Python implementation of the Google Protocol Buffers.
 
-- 
2.13.6
