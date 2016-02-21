From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 21:50:55 +0100
Subject: [Buildroot] [git commit] poppler: install xpdf-headers to enable
	building of cups-filters
Message-ID: <20160302202755.CD6327FA0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fb992c4fd286714e40f68c9be1bd09a0aa96652d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add --enable-xpdf-headers to poppler.mk. Required for succesfull
build of cups-filters.

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/poppler/poppler.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 6142cba..1113e4b 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -11,7 +11,8 @@ POPPLER_DEPENDENCIES = fontconfig host-pkgconf
 POPPLER_LICENSE = GPLv2+
 POPPLER_LICENSE_FILES = COPYING
 POPPLER_INSTALL_STAGING = YES
-POPPLER_CONF_OPTS = --with-font-configuration=fontconfig
+POPPLER_CONF_OPTS = --with-font-configuration=fontconfig \
+	--enable-xpdf-headers
 
 ifeq ($(BR2_PACKAGE_LCMS2),y)
 POPPLER_CONF_OPTS += --enable-cms=lcms2
