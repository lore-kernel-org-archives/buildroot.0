From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Mar 2019 19:25:17 +0100
Subject: [Buildroot] [git commit] package/odhcp6c: add optional libubox
 dependency
Message-ID: <20190325182200.8EAF683CE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=93f77125112ee5335719065cdfcfb1593caa7c27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libubox dependency has been added in
https://github.com/openwrt/odhcp6c/commit/33a2ba1c14eb5447326945c120e0b64a587ed151

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
