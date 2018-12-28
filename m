From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Dec 2018 11:57:40 +0100
Subject: [Buildroot] [git commit] package/lm-sensors: remove redundant
 BUILD_STATIC_LIB build parameter
Message-ID: <20181228110400.6D14083B2F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4524d74153343982cbbe771d042c152c65060d7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 3e05efd76636 ("package/lm-sensors: disable static library for
shared-only build") added BUILD_STATIC_LIB to LM_SENSORS_MAKE_OPTS with
value that depends on BR2_SHARED_LIBS, but forgot to remove it from the
common LM_SENSORS_MAKE_OPTS. Fix that.

Cc: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lm-sensors/lm-sensors.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
index 6fc7ce4981..778a355b0f 100644
--- a/package/lm-sensors/lm-sensors.mk
+++ b/package/lm-sensors/lm-sensors.mk
@@ -21,7 +21,6 @@ LM_SENSORS_BINS_$(BR2_PACKAGE_LM_SENSORS_PWMCONFIG) += sbin/pwmconfig
 LM_SENSORS_BINS_$(BR2_PACKAGE_LM_SENSORS_SENSORS_DETECT) += sbin/sensors-detect
 
 LM_SENSORS_MAKE_OPTS = \
-	BUILD_STATIC_LIB=1 \
 	MACHINE=$(KERNEL_ARCH) \
 	PREFIX=/usr
 
