From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Aug 2015 17:10:12 +0200
Subject: [Buildroot] [git commit] dawgdic: enable with gcc 4.6
Message-ID: <20150808151130.830748043B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8069253ad178441521e584b02e84be9b88bc85c4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

According to Nicolas Cavallari and confirmed by testing, std::strtoll
is indeed available in gcc 4.6, so the dawgdic package can be enabled
on gcc >= 4.6 instead of gcc >= 4.7.

Reported-by: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dawgdic/Config.in |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dawgdic/Config.in b/package/dawgdic/Config.in
index 8ef9902..b67342b 100644
--- a/package/dawgdic/Config.in
+++ b/package/dawgdic/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_DAWGDIC
 	bool "dawgdic"
 	depends on BR2_INSTALL_LIBSTDCPP
-	# std=c11
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+	# needs std::strtoll
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
 	help
 	  dawgdic provides a library for building and accessing
 	  dictionaries implemented with directed acyclic word graphs
@@ -15,5 +15,5 @@ config BR2_PACKAGE_DAWGDIC
 
 	  https://github.com/stil/dawgdic
 
-comment "dawgdic needs a toolchain w/ C++, gcc >= 4.7"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+comment "dawgdic needs a toolchain w/ C++, gcc >= 4.6"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
