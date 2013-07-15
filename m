From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:46:55 -0500
Subject: [Buildroot] [PATCH 12/67] enchant: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-13-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/enchant/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/enchant/Config.in b/package/enchant/Config.in
index 33f36db..783c73e 100644
--- a/package/enchant/Config.in
+++ b/package/enchant/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_ENCHANT
 	bool "enchant"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  Enchant is a spell-checking library that provides a consistent
@@ -9,5 +10,6 @@ config BR2_PACKAGE_ENCHANT
 
 	  http://www.abisource.com/projects/enchant/
 
-comment "enchant requires a toolchain with C++ and WCHAR support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+comment "enchant requires a toolchain with C++, threading and WCHAR support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.1.2
