From: unixmania at gmail.com <unixmania@gmail.com>
Date: Sat, 29 Feb 2020 15:18:07 -0300
Subject: [Buildroot] [PATCH] package/openrc: fix post-install-target addition
Message-ID: <20200229181807.5462-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

OPENRC_POST_TARGET_INSTALL_HOOKS -> OPENRC_POST_INSTALL_TARGET_HOOKS

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/openrc/openrc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
index 3f6453cef5..289bde4d03 100644
--- a/package/openrc/openrc.mk
+++ b/package/openrc/openrc.mk
@@ -47,7 +47,7 @@ define OPENRC_NO_NET
 	$(RM) $(TARGET_DIR)/etc/init.d/{network,staticroute,loopback}
 	$(RM) $(TARGET_DIR)/etc/conf.d/{network,staticroute,loopback}
 endef
-OPENRC_POST_TARGET_INSTALL_HOOKS += OPENRC_NO_NET
+OPENRC_POST_INSTALL_TARGET_HOOKS += OPENRC_NO_NET
 endif
 
 define OPENRC_REMOVE_UNNEEDED
-- 
2.18.2
