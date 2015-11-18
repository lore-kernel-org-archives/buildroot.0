From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Nov 2015 21:55:02 +0100
Subject: [Buildroot] [git commit branch/next] udisks: make libgudev
	selection consistent
Message-ID: <20151118205506.A1F808013B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a6bd7ec38d5edccc4f574e667a4ff9bc2af1c62f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

In all other package the condition for BR2_PACKAGE_LIBGUDEV selection is
BR2_INIT_SYSTEMD. Do the same for udisks.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/udisks/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
 
