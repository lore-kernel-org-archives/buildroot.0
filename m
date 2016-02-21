From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 14:53:10 +0100
Subject: [Buildroot] [git commit] package/links: add --with/--without-libtiff
Message-ID: <20160221135333.16DA480E3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c76da18e9e1b2de56a244b510372674b4b4a88b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/links/links.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/links/links.mk b/package/links/links.mk
index 68da9e3..43f21d6 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -31,7 +31,10 @@ ifeq ($(BR2_PACKAGE_JPEG),y)
 LINKS_DEPENDENCIES += jpeg
 endif
 ifeq ($(BR2_PACKAGE_TIFF),y)
+LINKS_CONF_OPTS += --with-libtiff
 LINKS_DEPENDENCIES += tiff
+else
+LINKS_CONF_OPTS += --without-libtiff
 endif
 endif
 
