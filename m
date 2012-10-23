From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 22 Oct 2012 22:47:54 -0300
Subject: [Buildroot] [PATCHv6 4/5] pkg-config: mark as deprecated
In-Reply-To: <1350956875-1726-1-git-send-email-gustavo@zacarias.com.ar>
References: <1350956875-1726-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1350956875-1726-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/pkg-config/Config.in |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/pkg-config/Config.in b/package/pkg-config/Config.in
index eae0a21..7f96d9b 100644
--- a/package/pkg-config/Config.in
+++ b/package/pkg-config/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PKG_CONFIG
 	bool "pkg-config"
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_DEPRECATED
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  pkg-config is a system for managing library compile/link
@@ -11,4 +12,4 @@ config BR2_PACKAGE_PKG_CONFIG
 	  http://www.freedesktop.org/software/pkgconfig/
 
 comment "pkg-config requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+	depends on BR2_DEPRECATED && !BR2_USE_WCHAR
-- 
1.7.8.6
