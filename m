From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 27 Dec 2014 22:58:19 +0100
Subject: [Buildroot] [PATCH 01/10] package/lm-sensors: disable static
	library for shared-only build
In-Reply-To: <1419717508-11627-1-git-send-email-romain.naour@openwide.fr>
References: <1419717508-11627-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1419717508-11627-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/lm-sensors/lm-sensors.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
index a79977f..c26f919 100644
--- a/package/lm-sensors/lm-sensors.mk
+++ b/package/lm-sensors/lm-sensors.mk
@@ -31,6 +31,12 @@ else
 LM_SENSORS_MAKE_OPTS += BUILD_SHARED_LIB=1
 endif
 
+ifeq ($(BR2_SHARED_LIBS),y)
+LM_SENSORS_MAKE_OPTS += BUILD_STATIC_LIB=0
+else
+LM_SENSORS_MAKE_OPTS += BUILD_STATIC_LIB=1
+endif
+
 define LM_SENSORS_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(LM_SENSORS_MAKE_OPTS) -C $(@D)
 endef
-- 
1.9.3
