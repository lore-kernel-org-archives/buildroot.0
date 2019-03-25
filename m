From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 25 Mar 2019 18:59:33 +0100
Subject: [Buildroot] [PATCH 2/2] package/odhcp6c: add optional libubox
 dependency
In-Reply-To: <20190325175933.16531-1-fontaine.fabrice@gmail.com>
References: <20190325175933.16531-1-fontaine.fabrice@gmail.com>
Message-ID: <20190325175933.16531-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libubox dependency has been added in
https://github.com/openwrt/odhcp6c/commit/33a2ba1c14eb5447326945c120e0b64a587ed151

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/odhcp6c/odhcp6c.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/odhcp6c/odhcp6c.mk b/package/odhcp6c/odhcp6c.mk
index 735b47420f..3b4e7580a2 100644
--- a/package/odhcp6c/odhcp6c.mk
+++ b/package/odhcp6c/odhcp6c.mk
@@ -16,4 +16,11 @@ endef
 
 ODHCP6C_POST_INSTALL_TARGET_HOOKS += ODHCP6C_INSTALL_SCRIPT
 
+ifeq ($(BR2_PACKAGE_LIBUBOX),y)
+ODHCP6C_CONF_OPTS += -DUSE_LIBUBOX=1
+ODHCP6C_DEPENDENCIES += libubox
+else
+ODHCP6C_CONF_OPTS += -DUSE_LIBUBOX=0
+endif
+
 $(eval $(cmake-package))
-- 
2.20.1
