From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 23 Mar 2020 18:42:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/domoticz: fix build with cmake <
 3.16
Message-ID: <20200323174221.606473-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable precompiled header because it needs cmake >= 3.16 since version
2020.1 and
https://github.com/domoticz/domoticz/commit/2430e5c85624139dd15a74267d6e50992e394509

Fixes:
 - http://autobuild.buildroot.org/results/7c6e5cb35dffa142972ad19594c8cc092cbfaa76

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/domoticz/domoticz.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index 6df292764b..c7cbd3de0e 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -19,6 +19,9 @@ DOMOTICZ_DEPENDENCIES = \
 	sqlite \
 	zlib
 
+# Disable precompiled header as it needs cmake >= 3.16
+DOMOTICZ_CONF_OPTS += -DUSE_PRECOMPILED_HEADER=OFF
+
 # Due to the dependency on mosquitto, domoticz depends on
 # !BR2_STATIC_LIBS so set USE_STATIC_BOOST and USE_OPENSSL_STATIC to OFF
 DOMOTICZ_CONF_OPTS += \
-- 
2.25.1
