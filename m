From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Oct 2014 05:45:47 +0100
Subject: [Buildroot] [git commit] package/xbmc: Add optional support for
	libcap
Message-ID: <20141026044831.D403FAFE0F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=28a0054bea79eafc0caa70c2364a15113af03f6e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xbmc/xbmc.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index 86a9721..03362c2 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -63,6 +63,13 @@ XBMC_CONF_ENV += INCLUDES="-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads
 	LIBS="-lvcos -lvchostif"
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+XBMC_CONF_OPTS += --enable-libcap
+XBMC_DEPENDENCIES += libcap
+else
+XBMC_CONF_OPTS += --disable-libcap
+endif
+
 ifeq ($(BR2_PACKAGE_XBMC_DBUS),y)
 XBMC_DEPENDENCIES += dbus
 XBMC_CONF_OPTS += --enable-dbus
