From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Jan 2021 22:01:57 +0100
Subject: [Buildroot] [git commit] package/brltty: add polkit optional
 dependency
Message-ID: <20210123204226.3199881469@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=74c6a7e4dba6e81f5403476344b852119d7a53d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

polkit is an optional dependency (enabled by default) since version 5.4:
https://github.com/brltty/brltty/commit/e62b3c925d03239a372d425fb87b2cac65d8ef19

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
