From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu,  6 Jul 2017 23:22:39 -0300
Subject: [Buildroot] [PATCH 4/7] python-pam: use
	BR2_PACKAGE_LINUX_PAM_ARCH_SUPPORTS
In-Reply-To: <20170707022242.20128-1-casantos@datacom.ind.br>
References: <20170707022242.20128-1-casantos@datacom.ind.br>
Message-ID: <20170707022242.20128-5-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Do not repeat linux-pam dependencies.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/python-pam/Config.in | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/python-pam/Config.in b/package/python-pam/Config.in
index 02865d0..366492b 100644
--- a/package/python-pam/Config.in
+++ b/package/python-pam/Config.in
@@ -1,16 +1,11 @@
 comment "python-pam needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library"
 	depends on BR2_PACKAGE_PYTHON
-	depends on !BR2_ENABLE_LOCALE || !BR2_USE_WCHAR || BR2_STATIC_LIBS || \
-		BR2_TOOLCHAIN_USES_MUSL
+	depends on !BR2_PACKAGE_LINUX_PAM_ARCH_SUPPORTS
 
 config BR2_PACKAGE_PYTHON_PAM
 	bool "python-pam"
 	depends on BR2_PACKAGE_PYTHON # C extension not compatible with python3
-	depends on BR2_ENABLE_LOCALE # linux-pam
-	depends on BR2_USE_WCHAR # linux-pam
-	depends on BR2_USE_MMU # linux-pam
-	depends on !BR2_STATIC_LIBS # linux-pam
-	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
+	depends on BR2_PACKAGE_LINUX_PAM_ARCH_SUPPORTS
 	select BR2_PACKAGE_LINUX_PAM
 	help
 	  PAM (Pluggable Authentication Module) bindings for Python.
-- 
2.9.4
