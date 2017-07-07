From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu,  6 Jul 2017 23:22:42 -0300
Subject: [Buildroot] [PATCH 7/7] util-linux: use
	BR2_PACKAGE_LINUX_PAM_ARCH_SUPPORTS
In-Reply-To: <20170707022242.20128-1-casantos@datacom.ind.br>
References: <20170707022242.20128-1-casantos@datacom.ind.br>
Message-ID: <20170707022242.20128-8-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Do not repeat linux-pam dependencies.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/util-linux/Config.in | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index cba590c..858f523 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -82,17 +82,13 @@ config BR2_PACKAGE_UTIL_LINUX_CAL
 
 config BR2_PACKAGE_UTIL_LINUX_CHFN_CHSH
 	bool "chfn/chsh"
-	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam
-	depends on !BR2_STATIC_LIBS
-	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
-	depends on BR2_USE_MMU # linux-pam
+	depends on BR2_PACKAGE_LINUX_PAM_ARCH_SUPPORTS
 	select BR2_PACKAGE_LINUX_PAM
 	help
 	  Change login shell, real user name and information
 
 comment "chfn/chsh needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library"
-	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
-		|| BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
+	depends on !BR2_PACKAGE_LINUX_PAM_ARCH_SUPPORTS
 
 config BR2_PACKAGE_UTIL_LINUX_CHMEM
 	bool "chmem"
@@ -167,17 +163,13 @@ config BR2_PACKAGE_UTIL_LINUX_LINE
 config BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS
 	bool "login utilities"
 	depends on BR2_USE_MMU # fork() (login, runuser, su, sulogin)
-	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam
-	depends on !BR2_STATIC_LIBS
-	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
-	depends on BR2_USE_MMU # linux-pam
+	depends on BR2_PACKAGE_LINUX_PAM_ARCH_SUPPORTS
 	select BR2_PACKAGE_LINUX_PAM
 	help
 	  Login utilities (last, login, runuser, su, sulogin)
 
 comment "login utilities needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library"
-	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
-		|| BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
+	depends on !BR2_PACKAGE_LINUX_PAM_ARCH_SUPPORTS
 
 config BR2_PACKAGE_UTIL_LINUX_LOGGER
 	bool "logger"
-- 
2.9.4
