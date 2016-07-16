From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2016 20:57:02 +0200
Subject: [Buildroot] [git commit] package/autofs: requires NPTL
Message-ID: <20160716185728.718937FC9B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7a8921cb7cb0dd4deb51bda5903708b0219eb3fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

autofs uses pthread_condattr_setclock() which is available only with
toolchains with NPTL threads support.

Fixes:
http://autobuild.buildroot.net/results/152/152d917b0078aeb3715cd562cdecf7d0debf924b

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/autofs/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/autofs/Config.in b/package/autofs/Config.in
index dbe6674..8e08357 100644
--- a/package/autofs/Config.in
+++ b/package/autofs/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_AUTOFS
 	bool "autofs"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	depends on !BR2_STATIC_LIBS # dlfcn
@@ -15,7 +15,7 @@ config BR2_PACKAGE_AUTOFS
 
 	  http://www.linuxfromscratch.org/blfs/view/svn/general/autofs.html
 
-comment "autofs needs a toolchain w/ threads, RPC, dynamic library"
+comment "autofs needs a toolchain w/ NPTL, RPC, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_NATIVE_RPC
