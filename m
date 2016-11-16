From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Nov 2016 22:14:53 +0100
Subject: [Buildroot] [git commit branch/next] linux-pam: drop useless comment
Message-ID: <20161116211457.E59F781D97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=78c446a3405b97ea5bbff8b89199689c1fdf29e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The recursive reason for disabling linux-pam with musl doesn't help.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-pam/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-pam/Config.in b/package/linux-pam/Config.in
index 5d3fd61..3d9835e 100644
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
