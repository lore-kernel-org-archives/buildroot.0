From: Koen Martens <gmc@sonologic.nl>
Date: Wed, 21 Aug 2019 15:21:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/capnproto: increase gcc version
 dependency
Message-ID: <20190821132153.GC26497@coltrane>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The new version of capnproto requires c++14, therefore
the dependency has been increase from at least gcc 4.8
to at least gcc 5.x.

This patch should be applied to a branch that already
has the patch that increases the capnproto version to
0.7.0. At the time of writing this, that means the next
branch.

Signed-off-by: Koen Martens <gmc@sonologic.nl>
---
 package/capnproto/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/capnproto/Config.in b/package/capnproto/Config.in
index a979a334ff..a81b7c9d96 100644
--- a/package/capnproto/Config.in
+++ b/package/capnproto/Config.in
@@ -15,10 +15,10 @@ config BR2_PACKAGE_CAPNPROTO
 
 	  https://capnproto.org/index.html
 
-comment "capnproto needs host and target gcc >= 4.8 w/ C++, threads, atomic"
+comment "capnproto needs host and target gcc >= 5 w/ C++, threads, atomic"
 	depends on BR2_USE_MMU
-	depends on !BR2_HOST_GCC_AT_LEAST_4_8 || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+	depends on !BR2_HOST_GCC_AT_LEAST_5 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
 		!BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_HAS_ATOMIC
-- 
2.17.1
