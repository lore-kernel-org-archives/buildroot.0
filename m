From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 3 Jun 2013 09:15:19 +0200
Subject: [Buildroot] [git commit] sconeserver: requires thread support
Message-ID: <20130603071739.95EAB9A5A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a0c5fb4fd1f1b5631109e63daa7d2070fa7a17d8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes autobuild failures such as the following.

  http://autobuild.buildroot.net/results/a290aa34bd44c0e08f7aa44a7c606420668eef6d/

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sconeserver/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
index 0fc3a13..a467476 100644
--- a/package/sconeserver/Config.in
+++ b/package/sconeserver/Config.in
@@ -1,6 +1,7 @@
 menuconfig BR2_PACKAGE_SCONESERVER
 	bool "sconeserver"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_PCRE
 	help
 	  Sconeserver is a modular, object-orientated and extremely versatile
@@ -90,5 +91,5 @@ comment "ui module requires X.org"
 
 endif # BR2_PACKAGE_SCONESERVER
 
-comment "sconeserver requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "sconeserver requires a toolchain with C++ and thread support enabled"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
