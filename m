From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 17 Jan 2016 13:58:08 +0100
Subject: [Buildroot] [PATCH] moarvm: disable for sparc64
Message-ID: <20160117125808.GA7423@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Missing implementation of AO_fetch_compare_and_swap in
libatomic_ops library for sparcv9.

Fixes following autobuilder issues:
http://autobuild.buildroot.net/results/268e328e2d9ea951c0728ab6031d32e2b460d015/
http://autobuild.buildroot.net/results/84847a9201244fce3e05e5e4e201f2e1848238de/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/moarvm/Config.in |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/moarvm/Config.in b/package/moarvm/Config.in
index 95f3752..bb1af7e 100644
--- a/package/moarvm/Config.in
+++ b/package/moarvm/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_MOARVM
 	depends on !BR2_STATIC_LIBS # libuv
 	depends on BR2_USE_MMU # libuv
 	depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS # libatomic_ops
+	# needs AO_fetch_compare_and_swap, not implemented for sparcv9
+	depends on !BR2_sparc64
 	select BR2_PACKAGE_LIBUV
 	select BR2_PACKAGE_LIBATOMIC_OPS
 	help
-- 
1.7.10.4
