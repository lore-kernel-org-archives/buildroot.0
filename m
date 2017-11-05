From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 5 Nov 2017 15:51:15 +0100
Subject: [Buildroot] [git commit] python-protobuf: update dependencies
Message-ID: <20171105144419.03B9D81191@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eeb1bfbd3c43ada1c8f9c4e1fb0488daa7affc36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since version 3.0.0 protobuf is compatible with Python3, remove
Python2-only dependency.

It depends on python-six now, add this missing dependency.

Signed-off-by: Alexey Roslyakov <alexey.roslyakov@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-protobuf/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-protobuf/Config.in b/package/python-protobuf/Config.in
index 68523e9..607fe48 100644
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
 
