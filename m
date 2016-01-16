From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:37:48 +0100
Subject: [Buildroot] [PATCH 56/80 v1] package/lm-sensors: use 'menuconfig'
In-Reply-To: <cover.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <c3b33cd06c5cadffa3c992d3f692681319a3b3d7.1452983019.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lm-sensors has more than 5 options, so use a 'menuconfig' to group the
options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/lm-sensors/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/lm-sensors/Config.in b/package/lm-sensors/Config.in
index 7065c4c..e6dd085 100644
--- a/package/lm-sensors/Config.in
+++ b/package/lm-sensors/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_LM_SENSORS
+menuconfig BR2_PACKAGE_LM_SENSORS
 	bool "lm-sensors"
 	help
 	  Lm-sensors is a hardware health monitoring package for
@@ -9,7 +9,6 @@ config BR2_PACKAGE_LM_SENSORS
 	  http://www.lm-sensors.org/
 
 if BR2_PACKAGE_LM_SENSORS
-comment "lm-sensors tools"
 
 config BR2_PACKAGE_LM_SENSORS_SENSORS
 	bool "sensors"
-- 
1.9.1
