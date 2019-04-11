From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Apr 2019 19:36:49 +0200
Subject: [Buildroot] [git commit] package/squeezelite: add optional wiringpi
 dependency
Message-ID: <20190411173729.CE2018E4F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e2e00c03b568ce54f5a9bff4260827b92abfb078
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
