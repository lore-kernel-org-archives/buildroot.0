From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Dec 2014 22:20:09 +0100
Subject: [Buildroot] [git commit] package/lm-sensors: disable static library
	for shared-only build
Message-ID: <20141228212039.B7BD18046A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3e05efd76636d29821a625fb608a49d846485572
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lm-sensors/lm-sensors.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

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
