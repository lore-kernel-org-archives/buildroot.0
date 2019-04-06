From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  6 Apr 2019 18:57:59 +0200
Subject: [Buildroot] [PATCH 3/4] package/squeezelite: add optional wiringpi
 dependency
In-Reply-To: <20190406165800.4493-1-fontaine.fabrice@gmail.com>
References: <20190406165800.4493-1-fontaine.fabrice@gmail.com>
Message-ID: <20190406165800.4493-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/squeezelite/squeezelite.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/squeezelite/squeezelite.mk b/package/squeezelite/squeezelite.mk
index e41053663a..b4fb090f0f 100644
--- a/package/squeezelite/squeezelite.mk
+++ b/package/squeezelite/squeezelite.mk
@@ -34,6 +34,11 @@ ifeq ($(BR2_PACKAGE_SQUEEZELITE_VISEXPORT),y)
 SQUEEZELITE_MAKE_OPTS += -DVISEXPORT
 endif
 
+ifeq ($(BR2_PACKAGE_WIRINGPI),y)
+SQUEEZELITE_DEPENDENCIES += wiringpi
+SQUEEZELITE_MAKE_OPTS += -DRPI
+endif
+
 define SQUEEZELITE_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
 		OPTS="$(SQUEEZELITE_MAKE_OPTS)" -C $(@D) all
-- 
2.20.1
