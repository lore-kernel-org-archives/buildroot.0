From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Thu, 13 Oct 2016 19:13:56 -0300
Subject: [Buildroot] [PATCH 49/51] aufs-util: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
In-Reply-To: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476396838-12276-50-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
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
-- 
2.7.3
