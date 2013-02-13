From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Feb 2013 22:55:56 +0100
Subject: [Buildroot] [PATCH] libvorbis: fix LIBVORBIS_SITE
Message-ID: <1360792556-4732-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The LIBVORBIS_SITE included a reference to $(LIBVORBIS-SOURCE), which
doesn't exist. And anyway was useless because the <pkg>_SITE variable
should not contain the name of the tarball.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libvorbis/libvorbis.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libvorbis/libvorbis.mk b/package/libvorbis/libvorbis.mk
index ace8147..5b9048e 100644
--- a/package/libvorbis/libvorbis.mk
+++ b/package/libvorbis/libvorbis.mk
@@ -6,7 +6,7 @@
 
 LIBVORBIS_VERSION = 1.3.3
 LIBVORBIS_SOURCE = libvorbis-$(LIBVORBIS_VERSION).tar.gz
-LIBVORBIS_SITE = http://downloads.xiph.org/releases/vorbis/$(LIBVORBIS-SOURCE)
+LIBVORBIS_SITE = http://downloads.xiph.org/releases/vorbis/
 LIBVORBIS_INSTALL_STAGING = YES
 LIBVORBIS_CONF_OPT = --disable-oggtest
 LIBVORBIS_DEPENDENCIES = host-pkgconf libogg
-- 
1.7.9.5
