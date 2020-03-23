From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Mar 2020 21:24:33 +0100
Subject: [Buildroot] [git commit] package/domoticz: fix build with cmake <
 3.16
Message-ID: <20200323201214.1B6F0873EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6e6bd863093605419044d6e376185ff3caed9fbe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable precompiled header because it needs cmake >= 3.16 since version
2020.1 and
https://github.com/domoticz/domoticz/commit/2430e5c85624139dd15a74267d6e50992e394509

Fixes:
 - http://autobuild.buildroot.org/results/7c6e5cb35dffa142972ad19594c8cc092cbfaa76

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr:
  - first assignment to CONF_OPTS, so use '=', not '+='
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/domoticz/domoticz.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index 6df292764b..5efe86a784 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -19,6 +19,9 @@ DOMOTICZ_DEPENDENCIES = \
 	sqlite \
 	zlib
 
+# Disable precompiled header as it needs cmake >= 3.16
+DOMOTICZ_CONF_OPTS = -DUSE_PRECOMPILED_HEADER=OFF
+
 # Due to the dependency on mosquitto, domoticz depends on
 # !BR2_STATIC_LIBS so set USE_STATIC_BOOST and USE_OPENSSL_STATIC to OFF
 DOMOTICZ_CONF_OPTS += \
