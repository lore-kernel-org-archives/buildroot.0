From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 14:53:28 +0100
Subject: [Buildroot] [git commit] package/links: add --with/--without-libjpeg
Message-ID: <20160221135333.38C1A7FDC4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=024e4e76cd7866630e844e8472642fce8dddd8f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/links/links.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/links/links.mk b/package/links/links.mk
index ec1771e..97af418 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -28,7 +28,10 @@ else
 LINKS_CONF_OPTS += --without-directfb
 endif
 ifeq ($(BR2_PACKAGE_JPEG),y)
+LINKS_CONF_OPTS += --with-libjpeg
 LINKS_DEPENDENCIES += jpeg
+else
+LINKS_CONF_OPTS += --without-libjpeg
 endif
 ifeq ($(BR2_PACKAGE_TIFF),y)
 LINKS_CONF_OPTS += --with-libtiff
