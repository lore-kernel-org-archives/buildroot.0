From: James Knight <james.knight@rockwellcollins.com>
Date: Thu, 22 Oct 2015 15:05:50 -0400
Subject: [Buildroot] [PATCH 1/1] feh: install in /usr
Message-ID: <1445540750-4312-1-git-send-email-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By default, feh installs into /usr/local. Adjusting the prefix to point
to a system distribution path.

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
 package/feh/feh.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index 03435dc..7381e25 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -18,7 +18,7 @@ endef
 
 define FEH_INSTALL_TARGET_CMDS
 	$(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) " \
-		DESTDIR=$(TARGET_DIR) -C $(@D) install
+		PREFIX=/usr DESTDIR=$(TARGET_DIR) -C $(@D) install
 endef
 
 $(eval $(generic-package))
-- 
1.9.5.msysgit.1
