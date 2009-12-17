From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 17 Dec 2009 22:17:12 +0100
Subject: [Buildroot] [git commit master] libvorbis: remove unused cruft from
	pre-autotools.in
Message-ID: <20091217211833.B6FAB7780C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=61844782067bafc334c56bd6dd8cf37ba0608923
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The AUTOTARGETS macro handles this already.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/libvorbis/libvorbis.mk |    9 ---------
 1 files changed, 0 insertions(+), 9 deletions(-)

diff --git a/package/multimedia/libvorbis/libvorbis.mk b/package/multimedia/libvorbis/libvorbis.mk
index d8c7869..9a060d9 100644
--- a/package/multimedia/libvorbis/libvorbis.mk
+++ b/package/multimedia/libvorbis/libvorbis.mk
@@ -16,12 +16,3 @@ LIBVORBIS_CONF_OPT = --disable-oggtest
 LIBVORBIS_DEPENDENCIES = host-pkg-config libogg
 
 $(eval $(call AUTOTARGETS,package/multimedia,libvorbis))
-
-############################################################
-#
-# Toplevel Makefile options
-#
-############################################################
-ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
-TARGETS+=libvorbis
-endif
-- 
1.6.3.3
