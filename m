From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Aug 2015 21:23:17 +0200
Subject: [Buildroot] [PATCH 1/2 v2] package/protobuf-c: threads dependency
	is a direct dependency
In-Reply-To: <cover.1439925738.git.yann.morin.1998@free.fr>
References: <cover.1439925738.git.yann.morin.1998@free.fr>
Message-ID: <ab466a72859caffe6dc9f3289ad8ddce5d09eb41.1439925738.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, protobuf-c's dependency on threads is labelled as being
inherited from protobuf.

This is wrong, as protobuf-c does not depend on protobuf, and such
dependency was removed in e16865a (protobuf-c: Don't require protobuf on
target), but forgot to remove the corresponding comment.

Remove it now.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/protobuf-c/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/protobuf-c/Config.in b/package/protobuf-c/Config.in
index f9fab37..2855550 100644
--- a/package/protobuf-c/Config.in
+++ b/package/protobuf-c/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PROTOBUF_C
 	bool "protobuf-c"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# host-protobuf only builds on certain architectures
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	help
-- 
1.9.1
