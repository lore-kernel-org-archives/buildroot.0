From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Apr 2016 22:17:11 +0200
Subject: [Buildroot] [git commit] package/freeswitch: enable mod_cv
Message-ID: <20160417201717.6404481983@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=37fe9e2a946b3d575f3dd2b6489d8101489285b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freeswitch/freeswitch.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index a338279..04c112d 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -256,6 +256,11 @@ FREESWITCH_DEPENDENCIES += libsoundtouch
 FREESWITCH_ENABLED_MODULES += applications/mod_soundtouch
 endif
 
+ifeq ($(BR2_PACKAGE_OPENCV),y)
+FREESWITCH_DEPENDENCIES += opencv
+FREESWITCH_ENABLED_MODULES += applications/mod_cv
+endif
+
 ifeq ($(BR2_PACKAGE_UNIXODBC),y)
 FREESWITCH_DEPENDENCIES += unixodbc
 FREESWITCH_CONF_OPTS += \
