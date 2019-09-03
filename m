From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Sep 2019 22:46:17 +0200
Subject: [Buildroot] [git commit] package/libvips: remove unrecognized
 --enable-cxx
Message-ID: <20190903204802.5D2F18A5E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d4e371ca87a709166dc5109c368550b7c9d12e8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove --enable-cxx, this option has been removed since version 8.1 and
https://github.com/libvips/libvips/commit/346a9e70c0b096f84127449488e7dce6968d91c7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libvips/libvips.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/libvips/libvips.mk b/package/libvips/libvips.mk
index 269b0866c8..3e6af4131d 100644
--- a/package/libvips/libvips.mk
+++ b/package/libvips/libvips.mk
@@ -41,10 +41,6 @@ LIBVIPS_DEPENDENCIES = \
 	host-pkgconf expat libglib2 \
 	$(TARGET_NLS_DEPENDENCIES)
 
-# --disable-cxx is broken upstream
-# https://github.com/jcupitt/libvips/issues/231
-LIBVIPS_CONF_OPTS += --enable-cxx
-
 ifeq ($(BR2_PACKAGE_JPEG),y)
 LIBVIPS_CONF_OPTS += --with-jpeg
 LIBVIPS_DEPENDENCIES += jpeg
