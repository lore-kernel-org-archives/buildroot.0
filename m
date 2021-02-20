From: Scott Fan <fancp2007@gmail.com>
Date: Sun, 21 Feb 2021 00:27:13 +0800
Subject: [Buildroot] [PATCH 1/3] package/open62541: remove unneeded files
Message-ID: <20210220162715.283519-1-fancp2007@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/open62541/open62541.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
index 5a9f27562a..65742e83a1 100644
--- a/package/open62541/open62541.mk
+++ b/package/open62541/open62541.mk
@@ -54,4 +54,11 @@ else
 OPEN62541_CONF_OPTS += -DUA_ENABLE_PUBSUB_INFORMATIONMODEL=OFF
 endif
 
+# Remove unneeded files
+define OPEN62541_REMOVE_UNNEEDED_FILES
+	$(RM) -r $(TARGET_DIR)/usr/share/open62541
+endef
+
+OPEN62541_POST_INSTALL_TARGET_HOOKS += OPEN62541_REMOVE_UNNEEDED_FILES
+
 $(eval $(cmake-package))
-- 
2.25.1
