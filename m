From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 6 Jun 2011 13:47:32 +0200
Subject: [Buildroot] [git commit] libmpeg2: ensure cross sdl-config is used
	for sdl plugin
Message-ID: <20110606120009.4F60485A2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ab251cfe2b636fc3041fce8773d9a6c43c316446
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise we end up linking against host libraries.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/libmpeg2/libmpeg2.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/libmpeg2/libmpeg2.mk b/package/multimedia/libmpeg2/libmpeg2.mk
index cd8ac89..8bcc999 100644
--- a/package/multimedia/libmpeg2/libmpeg2.mk
+++ b/package/multimedia/libmpeg2/libmpeg2.mk
@@ -10,6 +10,7 @@ LIBMPEG2_INSTALL_STAGING = YES
 LIBMPEG2_CONF_OPT = --without-x --disable-directx
 
 ifeq ($(BR2_PACKAGE_SDL),y)
+LIBMPEG2_CONF_ENV += ac_cv_prog_SDLCONFIG=$(STAGING_DIR)/usr/bin/sdl-config
 LIBMPEG2_CONF_OPT += --enable-sdl
 LIBMPEG2_DEPENDENCIES += sdl
 else
-- 
1.7.3.4
