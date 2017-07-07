From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu,  6 Jul 2017 23:22:40 -0300
Subject: [Buildroot] [PATCH 5/7] rsh-redone: use
	BR2_PACKAGE_LINUX_PAM_ARCH_SUPPORTS
In-Reply-To: <20170707022242.20128-1-casantos@datacom.ind.br>
References: <20170707022242.20128-1-casantos@datacom.ind.br>
Message-ID: <20170707022242.20128-6-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Do not repeat linux-pam dependencies.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/rsh-redone/Config.in | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/package/rsh-redone/Config.in b/package/rsh-redone/Config.in
index 6a8aec0..4042f39 100644
--- a/package/rsh-redone/Config.in
+++ b/package/rsh-redone/Config.in
@@ -14,29 +14,21 @@ config BR2_PACKAGE_RSH_REDONE_RLOGIN
 
 config BR2_PACKAGE_RSH_REDONE_RLOGIND
 	bool "rlogind"
-	depends on !BR2_STATIC_LIBS
-	depends on BR2_ENABLE_LOCALE && BR2_USE_WCHAR
-	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
-	depends on BR2_USE_MMU # linux-pam
+	depends on BR2_PACKAGE_LINUX_PAM_ARCH_SUPPORTS
 	select BR2_PACKAGE_LINUX_PAM
 
 comment "rlogind needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library"
-	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
-		|| BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
+	depends on !BR2_PACKAGE_LINUX_PAM_ARCH_SUPPORTS
 
 config BR2_PACKAGE_RSH_REDONE_RSH
 	bool "rsh"
 
 config BR2_PACKAGE_RSH_REDONE_RSHD
 	bool "rshd"
-	depends on BR2_ENABLE_LOCALE && BR2_USE_WCHAR
-	depends on !BR2_STATIC_LIBS
-	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
-	depends on BR2_USE_MMU # linux-pam
+	depends on BR2_PACKAGE_LINUX_PAM_ARCH_SUPPORTS
 	select BR2_PACKAGE_LINUX_PAM
 
 comment "rshd needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library"
-	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
-		|| BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
+	depends on !BR2_PACKAGE_LINUX_PAM_ARCH_SUPPORTS
 
 endif
-- 
2.9.4
