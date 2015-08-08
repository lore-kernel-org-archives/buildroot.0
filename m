From: Romain Naour <romain.naour@openwide.fr>
Date: Sat,  8 Aug 2015 11:35:43 +0200
Subject: [Buildroot] [PATCH] package/dawgdic: needs gcc >= 4.7
Message-ID: <1439026543-25909-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

std::strtoll is only supported since C++11.

Fixes:
http://autobuild.buildroot.net/results/cae/cae3cda9be779ea8359f94d13bbbca97e68495ca/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/dawgdic/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/dawgdic/Config.in b/package/dawgdic/Config.in
index ce0b466..8ef9902 100644
--- a/package/dawgdic/Config.in
+++ b/package/dawgdic/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_DAWGDIC
 	bool "dawgdic"
 	depends on BR2_INSTALL_LIBSTDCPP
+	# std=c11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
 	help
 	  dawgdic provides a library for building and accessing
 	  dictionaries implemented with directed acyclic word graphs
@@ -13,5 +15,5 @@ config BR2_PACKAGE_DAWGDIC
 
 	  https://github.com/stil/dawgdic
 
-comment "dawgdic needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "dawgdic needs a toolchain w/ C++, gcc >= 4.7"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
-- 
2.4.3
