From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 10 Jul 2011 20:15:54 +0200
Subject: [Buildroot] [git commit] libarchive: bump to version 2.8.4
Message-ID: <20110710181610.3F0928A43B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ec0b51648b68de94f715fadef9a3a9085c15e22a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The libxml2 dependency is new in this version, and does not behave nicely with
cross compile. The configure script looks for the host xml2-config. Add
'--disable-xml2' as a workaround for now.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libarchive/libarchive.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 0038cd3..563c9d7 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -3,7 +3,7 @@
 # libarchive (reusable C library for archive formats)
 #
 #############################################################
-LIBARCHIVE_VERSION = 2.7.1
+LIBARCHIVE_VERSION = 2.8.4
 LIBARCHIVE_SITE = http://libarchive.googlecode.com/files/
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.gz
 LIBARCHIVE_INSTALL_STAGING = YES
@@ -14,6 +14,7 @@ LIBARCHIVE_DEPENDENCIES = zlib
 endif
 
 LIBARCHIVE_CONF_OPT = \
+	--without-xml2 \
 	$(if $(BR2_PACKAGE_LIBARCHIVE_BSDTAR),--enable-bsdtar,--disable-bsdtar) \
 	$(if $(BR2_PACKAGE_LIBARCHIVE_BSDCPIO),--enable-bsdcpio,--disable-bsdcpio)
 
-- 
1.7.3.4
