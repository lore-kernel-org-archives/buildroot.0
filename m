From: Alexey Roslyakov <alexey.roslyakov@gmail.com>
Date: Mon, 23 Oct 2017 22:10:40 +0700
Subject: [Buildroot] [PATCH 1/1] python-protobuf: update dependencies
Message-ID: <20171023151040.27886-1-alexey.roslyakov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since protobuf is compatible with Python3, remove Python2-only
dependency.

It depends on python-six now, add this missing dependency.

Signed-off-by: Alexey Roslyakov <alexey.roslyakov@gmail.com>
---
 package/python-protobuf/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/python-protobuf/Config.in b/package/python-protobuf/Config.in
index 68523e9c60..66ce0163f6 100644
--- a/package/python-protobuf/Config.in
+++ b/package/python-protobuf/Config.in
@@ -1,9 +1,10 @@
 config BR2_PACKAGE_PYTHON_PROTOBUF
 	bool "python-protobuf"
-	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	# host-protobuf only builds on certain architectures
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_HOST_GCC_AT_LEAST_4_5 # host-protobuf
+	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  Python implementation of the Google Protocol Buffers.
 
-- 
2.13.6
