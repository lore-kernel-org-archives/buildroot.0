From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 18 Nov 2015 21:38:40 +0200
Subject: [Buildroot] [PATCH next 2/2] udisks: make libgudev selection
	consistent
In-Reply-To: <fe0244022307f4d80793175f3d433c3e4ae9b738.1447875520.git.baruch@tkos.co.il>
References: <fe0244022307f4d80793175f3d433c3e4ae9b738.1447875520.git.baruch@tkos.co.il>
Message-ID: <1764df52f6579e7b2669a632651c7c39b95e0935.1447875520.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In all other package the condition for BR2_PACKAGE_LIBGUDEV selection is
BR2_INIT_SYSTEMD. Do the same for udisks.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/udisks/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/udisks/Config.in b/package/udisks/Config.in
index f24df03ab714..c9664afdf872 100644
--- a/package/udisks/Config.in
+++ b/package/udisks/Config.in
@@ -17,7 +17,7 @@ config BR2_PACKAGE_UDISKS
 	# the udev provider, libgudev is not provided, and needs to be built
 	# separately. This is why we select the libgudev package only if
 	# systemd is used.
-	select BR2_PACKAGE_LIBGUDEV if BR2_PACKAGE_SYSTEMD
+	select BR2_PACKAGE_LIBGUDEV if BR2_INIT_SYSTEMD
 	help
 	  The udisks project provides
 
-- 
2.6.2
