From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  5 Jan 2021 18:19:47 +0100
Subject: [Buildroot] [PATCH 1/1] package/brltty: add polkit optional
 dependency
Message-ID: <20210105171947.4236-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

polkit is an optional dependency (enabled by default) since version 5.4:
https://github.com/brltty/brltty/commit/e62b3c925d03239a372d425fb87b2cac65d8ef19

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/brltty/brltty.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/brltty/brltty.mk b/package/brltty/brltty.mk
index 4f40e65fc6..3924fa0c1a 100644
--- a/package/brltty/brltty.mk
+++ b/package/brltty/brltty.mk
@@ -96,6 +96,13 @@ else
 BRLTTY_CONF_OPTS += --without-rgx-package
 endif
 
+ifeq ($(BR2_PACKAGE_POLKIT),y)
+BRLTTY_DEPENDENCIES += polkit
+BRLTTY_CONF_OPTS += --enable-polkit
+else
+BRLTTY_CONF_OPTS += --disable-polkit
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 BRLTTY_DEPENDENCIES += systemd
 BRLTTY_CONF_OPTS += --with-service-package
-- 
2.29.2
