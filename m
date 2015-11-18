From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Nov 2015 21:55:02 +0100
Subject: [Buildroot] [git commit] udisks: make libgudev selection consistent
Message-ID: <20151201232118.CF19E7FB18@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a6bd7ec38d5edccc4f574e667a4ff9bc2af1c62f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In all other package the condition for BR2_PACKAGE_LIBGUDEV selection is
BR2_INIT_SYSTEMD. Do the same for udisks.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/udisks/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/udisks/Config.in b/package/udisks/Config.in
index f24df03..c9664af 100644
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
 
