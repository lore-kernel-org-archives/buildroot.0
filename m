From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  2 May 2018 08:05:38 +0200
Subject: [Buildroot] [PATCH 2/4] package/transmission: fix systemd support
In-Reply-To: <20180502060540.11628-1-bernd.kuhls@t-online.de>
References: <20180502060540.11628-1-bernd.kuhls@t-online.de>
Message-ID: <20180502060540.11628-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch 0005-libsystemd.patch backports an upstream commit which renames
the systemd configure option.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/transmission/transmission.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index 640c78c650..f15d037266 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -49,9 +49,9 @@ TRANSMISSION_CONF_OPTS += --enable-daemon
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 TRANSMISSION_DEPENDENCIES += systemd
-TRANSMISSION_CONF_OPTS += --with-systemd-daemon
+TRANSMISSION_CONF_OPTS += --with-systemd
 else
-TRANSMISSION_CONF_OPTS += --without-systemd-daemon
+TRANSMISSION_CONF_OPTS += --without-systemd
 endif
 
 define TRANSMISSION_USERS
-- 
2.14.2
