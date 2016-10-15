From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 14:18:04 +0200
Subject: [Buildroot] [git commit] aufs-util: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161015121836.8FCED81F71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e799d1b0a75ffe3ff4070957651d7fff2ce07d02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/aufs-util/aufs-util.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/aufs-util/aufs-util.mk b/package/aufs-util/aufs-util.mk
index 0ea9ee5..a2d0bad 100644
--- a/package/aufs-util/aufs-util.mk
+++ b/package/aufs-util/aufs-util.mk
@@ -46,14 +46,14 @@ define AUFS_UTIL_BUILD_CMDS
 		CPPFLAGS="$(AUFS_UTIL_HOST_CPPFLAGS)" \
 		HOSTCC="$(HOSTCC)" HOSTLD="$(HOSTLD)" \
 		INSTALL="$(INSTALL)" c2sh c2tmac
-	$(MAKE1) -C $(@D) \
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) \
 		$(TARGET_CONFIGURE_OPTS) \
 		CPPFLAGS="$(AUFS_UTIL_CPPFLAGS)" \
 		INSTALL="$(INSTALL)" all
 endef
 
 define AUFS_UTIL_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) INSTALL="$(INSTALL)" DESTDIR="$(TARGET_DIR)" install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) INSTALL="$(INSTALL)" DESTDIR="$(TARGET_DIR)" install
 endef
 
 $(eval $(generic-package))
