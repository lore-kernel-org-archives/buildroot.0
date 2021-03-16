From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Mar 2021 21:06:24 +0100
Subject: [Buildroot] [git commit] package/siproxd: needs MMU
Message-ID: <20210316194241.3279F80F89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a187032535f9b08593dace499a4a4df11d16d82a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

siproxd which has been added with commit
3efc5a250c1c98598ba4c91a7d71d11343d937ab unconditionally uses fork

Fixes:
 - http://autobuild.buildroot.org/results/0c59373ab3778cf7b15e73968295cec8d109f7cb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: Alexander Dahl <post@lespocky.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/siproxd/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/siproxd/Config.in b/package/siproxd/Config.in
index e73a33bf14..24c710b375 100644
--- a/package/siproxd/Config.in
+++ b/package/siproxd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SIPROXD
 	bool "siproxd"
+	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBOSIP2
 	select BR2_PACKAGE_LIBTOOL
@@ -18,4 +19,5 @@ config BR2_PACKAGE_SIPROXD
 	  http://siproxd.sourceforge.net/
 
 comment "siproxd needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
