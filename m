From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 1 May 2019 21:28:47 +0200
Subject: [Buildroot] [git commit] package/bird: BFD needs NPTL
Message-ID: <20190501192536.8235D839E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3fcf71429ee6e75a1c0f1b9db1576db698eb2522
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/ab9ab2cca2c191ae9a8f0ecb2aa2536a3f020301

uClibc linuxthreads does not provide pthread_spin_lock().

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bird/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bird/Config.in b/package/bird/Config.in
index fe34f96a45..22c39f8488 100644
--- a/package/bird/Config.in
+++ b/package/bird/Config.in
@@ -29,12 +29,12 @@ config BR2_PACKAGE_BIRD_BABEL
 
 config BR2_PACKAGE_BIRD_BFD
 	bool "bfd"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	help
 	  Enable BFD protocol.
 
-comment "BFD protocol needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "BFD protocol needs a toolchain w/ NPTL"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
 config BR2_PACKAGE_BIRD_BGP
 	bool "bgp"
