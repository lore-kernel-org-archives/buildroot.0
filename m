From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 27 Dec 2018 12:13:46 +0200
Subject: [Buildroot] [PATCH 1/3] lm-sensors: remove redundant
 BUILD_STATIC_LIB build parameter
Message-ID: <6592ba5b855eb8d5f79c6d883a45bdf02f1bfb49.1545905628.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 3e05efd76636 ("package/lm-sensors: disable static library for
shared-only build") added BUILD_STATIC_LIB to LM_SENSORS_MAKE_OPTS with
value that depends on BR2_SHARED_LIBS, but forgot to remove it from the
common LM_SENSORS_MAKE_OPTS. Fix that.

Cc: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/lm-sensors/lm-sensors.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
index 6fc7ce4981c9..778a355b0f7a 100644
--- a/package/lm-sensors/lm-sensors.mk
+++ b/package/lm-sensors/lm-sensors.mk
@@ -21,7 +21,6 @@ LM_SENSORS_BINS_$(BR2_PACKAGE_LM_SENSORS_PWMCONFIG) += sbin/pwmconfig
 LM_SENSORS_BINS_$(BR2_PACKAGE_LM_SENSORS_SENSORS_DETECT) += sbin/sensors-detect
 
 LM_SENSORS_MAKE_OPTS = \
-	BUILD_STATIC_LIB=1 \
 	MACHINE=$(KERNEL_ARCH) \
 	PREFIX=/usr
 
-- 
2.19.2
