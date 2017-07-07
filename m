From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu,  6 Jul 2017 23:22:37 -0300
Subject: [Buildroot] [PATCH 2/7] nodm: use
	BR2_PACKAGE_LINUX_PAM_ARCH_SUPPORTS
In-Reply-To: <20170707022242.20128-1-casantos@datacom.ind.br>
References: <20170707022242.20128-1-casantos@datacom.ind.br>
Message-ID: <20170707022242.20128-3-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Do not repeat linux-pam dependencies.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/nodm/Config.in | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/nodm/Config.in b/package/nodm/Config.in
index 38171e8..038b1fd 100644
--- a/package/nodm/Config.in
+++ b/package/nodm/Config.in
@@ -1,10 +1,7 @@
 config BR2_PACKAGE_NODM
 	bool "nodm"
 	depends on BR2_PACKAGE_XORG7
-	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam
-	depends on !BR2_STATIC_LIBS # linux-pam
-	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
-	depends on BR2_USE_MMU # linux-pam
+	depends on BR2_PACKAGE_LINUX_PAM_ARCH_SUPPORTS
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_LINUX_PAM
 	help
@@ -20,5 +17,4 @@ config BR2_PACKAGE_NODM
 
 comment "nodm needs a glibc or uClibc toolchain w/ wchar, locale, dynamic library"
 	depends on BR2_PACKAGE_XORG7
-	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
-		|| BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
+	depends on !BR2_PACKAGE_LINUX_PAM_ARCH_SUPPORTS
-- 
2.9.4
