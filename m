From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Aug 2016 00:04:03 +0200
Subject: [Buildroot] [git commit] package/sconeserver: unconditionally needs
	host-pkgconf
Message-ID: <20160828220959.BD2E0805B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=822247827c8ce228540ec5c3027bd01fd0b91480
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sconeserver uses pkg-config macros and uses autoreconf, so it
unconditionally needs host-pkgconf.

[Peter: drop host-pkgconf from sub options, update description]
Reported-by: Matthew Weber <matt@thewebers.ws>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sconeserver/sconeserver.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index e02c1a6..793ca6f 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -10,7 +10,7 @@ SCONESERVER_LICENSE = GPLv2+
 SCONESERVER_LICENSE_FILES = COPYING
 # fetching from Git, we need to generate the configure script
 SCONESERVER_AUTORECONF = YES
-SCONESERVER_DEPENDENCIES += pcre
+SCONESERVER_DEPENDENCIES = host-pkgconf pcre
 # disable markdown module because its git submodule cmark
 # https://github.com/sconemad/sconeserver/tree/master/markdown
 # has no cross-compile support provided by the sconeserver build system
@@ -46,7 +46,7 @@ SCONESERVER_CONF_OPTS += --without-sconesite
 endif
 
 ifeq ($(BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE_IMAGE),y)
-SCONESERVER_DEPENDENCIES += imagemagick host-pkgconf
+SCONESERVER_DEPENDENCIES += imagemagick
 SCONESERVER_CONF_OPTS += \
 	--with-sconesite-image \
 	--with-Magick++-config="$(STAGING_DIR)/usr/bin/Magick++-config"
@@ -79,7 +79,7 @@ SCONESERVER_CONF_OPTS += --without-rss
 endif
 
 ifeq ($(BR2_PACKAGE_SCONESERVER_LOCATION),y)
-SCONESERVER_DEPENDENCIES += host-pkgconf gpsd
+SCONESERVER_DEPENDENCIES += gpsd
 SCONESERVER_CONF_OPTS += --with-location
 else
 SCONESERVER_CONF_OPTS += --without-location
