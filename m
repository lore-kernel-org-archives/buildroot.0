From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 10 Oct 2014 19:45:20 +0200
Subject: [Buildroot] [PATCH] botan: requires a toolchain with threads
Message-ID: <1412963120-11216-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fix http://autobuild.buildroot.org/results/3df/3dfc002d8c19001dea4f13aa06cc6ec3f65fc4cb/build-end.log

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/botan/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/botan/Config.in b/package/botan/Config.in
index dc9aa05..733dc89 100644
--- a/package/botan/Config.in
+++ b/package/botan/Config.in
@@ -8,12 +8,13 @@ config BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
 config BR2_PACKAGE_BOTAN
 	bool "botan"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
 	help
 	  Botan is a crypto library for C++
 
 	  http://botan.randombit.net
 
-comment "botan needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "botan needs a toolchain w/ C++, threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
-- 
1.9.1
