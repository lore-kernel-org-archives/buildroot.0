From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 24 May 2019 17:11:22 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/sslh: add optional systemd
 dependency
Message-ID: <20190524151122.25314-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

systemd dependency has been added in version 1.18 with
https://github.com/yrutschle/sslh/commit/b3f48d98767634007dbe29ee3cb609a2e4283b7d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sslh/sslh.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/sslh/sslh.mk b/package/sslh/sslh.mk
index d0a5f82347..6e29a99189 100644
--- a/package/sslh/sslh.mk
+++ b/package/sslh/sslh.mk
@@ -27,6 +27,13 @@ else
 SSLH_MAKE_OPTS += USELIBPCRE=
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+SSLH_DEPENDENCIES += systemd
+SSLH_MAKE_OPTS += USESYSTEMD=1
+else
+SSLH_MAKE_OPTS += USESYSTEMD=
+endif
+
 define SSLH_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(SSLH_MAKE_OPTS) -C $(@D)
 endef
-- 
2.20.1
