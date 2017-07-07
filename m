From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu,  6 Jul 2017 23:22:38 -0300
Subject: [Buildroot] [PATCH 3/7] openvmtools: use
	BR2_PACKAGE_LINUX_PAM_ARCH_SUPPORTS
In-Reply-To: <20170707022242.20128-1-casantos@datacom.ind.br>
References: <20170707022242.20128-1-casantos@datacom.ind.br>
Message-ID: <20170707022242.20128-4-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Do not repeat linux-pam dependencies.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/openvmtools/Config.in | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/openvmtools/Config.in b/package/openvmtools/Config.in
index f76bdf2..d0bb27c 100644
--- a/package/openvmtools/Config.in
+++ b/package/openvmtools/Config.in
@@ -33,16 +33,13 @@ comment "procps support needs BR2_PACKAGE_BUSYBOX_SHOW_OTHERS"
 
 config BR2_PACKAGE_OPENVMTOOLS_PAM
 	bool "PAM support"
-	# linux-pam needs locale and wchar, but we already have this
-	# dependency on the main symbol, above.
-	depends on !BR2_STATIC_LIBS
-	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
+	depends on BR2_PACKAGE_LINUX_PAM_ARCH_SUPPORTS
 	select BR2_PACKAGE_LINUX_PAM
 	help
 	  Support for PAM in openvmtools
 
 comment "PAM support needs a glibc toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
+	depends on !BR2_PACKAGE_LINUX_PAM_ARCH_SUPPORTS
 
 endif
 
-- 
2.9.4
