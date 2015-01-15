From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Thu, 15 Jan 2015 18:18:14 +0100
Subject: [Buildroot] [PATCH 1/1] jimtcl: change the way of define
	JIMTCL_INSTALL_LIB variable
Message-ID: <1421342294-11952-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/jimtcl/jimtcl.mk |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
index 75c0382..c2e04ff 100644
--- a/package/jimtcl/jimtcl.mk
+++ b/package/jimtcl/jimtcl.mk
@@ -32,10 +32,11 @@ JIMTCL_INSTALL_LIB =
 else
 JIMTCL_SHARED = --shared
 JIMTCL_LIB = so.$(JIMTCL_VERSION)
-JIMTCL_INSTALL_LIB = \
+define JIMTCL_INSTALL_LIB
 	$(INSTALL) -D $(@D)/libjim.$(JIMTCL_LIB) \
-	$(TARGET_DIR)/usr/lib/libjim.$(JIMTCL_LIB); \
+		$(TARGET_DIR)/usr/lib/libjim.$(JIMTCL_LIB)
 	ln -s libjim.$(JIMTCL_LIB) $(TARGET_DIR)/usr/lib/libjim.so
+endef
 endif
 
 define JIMTCL_CONFIGURE_CMDS
-- 
1.7.9.5
