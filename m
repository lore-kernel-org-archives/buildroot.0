From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 16 Nov 2016 18:29:21 +0200
Subject: [Buildroot] [PATCH] linux-pam: drop useless comment
Message-ID: <39f7efffe92af9fdfbe75432bb4a7f2503160b63.1479313761.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The recursive reason for disabling linux-pam with musl doesn't help.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/linux-pam/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-pam/Config.in b/package/linux-pam/Config.in
index 5d3fd61fa4ed..3d9835e8cc39 100644
--- a/package/linux-pam/Config.in
+++ b/package/linux-pam/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_LINUX_PAM
 	select BR2_PACKAGE_FLEX
 	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR)
 	depends on !BR2_STATIC_LIBS
-	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
+	depends on !BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_USE_MMU # fork()
 	help
 	  A Security Framework that Provides Authentication for Applications
-- 
2.10.2
