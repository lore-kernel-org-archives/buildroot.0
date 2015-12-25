From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:25:20 +0100
Subject: [Buildroot] [PATCH 51/84 RFC] package/lm-sensors: use 'menuconfig'
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <ff4368f751a895ea26353e5406acd0326546941b.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lm-sensors has more than 5 options, so use a 'menuconfig' to group the
options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
