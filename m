From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 May 2018 09:08:55 +0200
Subject: [Buildroot] [git commit] package/freeswitch: add optional support
 for postgresql
Message-ID: <20180506071548.520C58641C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=71b9679034a4d9cea66a5fe900ff560ac83e3663
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freeswitch/freeswitch.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 98f2f48356..4d490b0730 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -275,6 +275,17 @@ FREESWITCH_DEPENDENCIES += opencv
 FREESWITCH_ENABLED_MODULES += applications/mod_cv
 endif
 
+ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
+FREESWITCH_CONF_ENV += \
+	ac_cv_path_PG_CONFIG=$(STAGING_DIR)/usr/bin/pg_config
+FREESWITCH_CONF_OPTS += \
+	--enable-core-pgsql-pkgconfig \
+	--enable-core-pgsql-support
+FREESWITCH_DEPENDENCIES += postgresql
+else
+FREESWITCH_CONF_OPTS += --disable-core-pgsql-support
+endif
+
 ifeq ($(BR2_PACKAGE_UNIXODBC),y)
 FREESWITCH_DEPENDENCIES += unixodbc
 FREESWITCH_CONF_OPTS += \
