From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 15:49:30 +0200
Subject: [Buildroot] [git commit] package/libsquish: fix .pc file name
Message-ID: <20170429134950.B8E0381828@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f7c11e5ba7f248d70d03289990036e2698e246d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

squish.pc was renamed upstream to libsquish.pc

Fixes
http://autobuild.buildroot.net/results/04c30f9a425d10111974a315a6d7474e243cbbd3/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsquish/libsquish.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libsquish/libsquish.mk b/package/libsquish/libsquish.mk
index a707355..9b447b0 100644
--- a/package/libsquish/libsquish.mk
+++ b/package/libsquish/libsquish.mk
@@ -21,7 +21,7 @@ define LIBSQUISH_INSTALL_STAGING_CMDS
 	mkdir -p $(STAGING_DIR)/usr/lib
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
 		install PREFIX=/usr INSTALL_DIR=$(STAGING_DIR)/usr
-	$(INSTALL) -D -m 644 $(@D)/squish.pc $(STAGING_DIR)/usr/lib/pkgconfig/squish.pc
+	$(INSTALL) -D -m 644 $(@D)/libsquish.pc $(STAGING_DIR)/usr/lib/pkgconfig/libsquish.pc
 	ln -sf libsquish.so.0.0 $(STAGING_DIR)/usr/lib/libsquish.so
 	ln -sf libsquish.so.0.0 $(STAGING_DIR)/usr/lib/libsquish.so.0
 endef
