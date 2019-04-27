From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 27 Apr 2019 22:48:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/bird: BFD needs NPTL
Message-ID: <20190427204858.25997-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/ab9ab2cca2c191ae9a8f0ecb2aa2536a3f020301

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.20.1
