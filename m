From: Shawn J. Goff <shawnjgoff@gmail.com>
Date: Sat, 18 Aug 2012 10:04:16 -0400
Subject: [Buildroot] [PATCH] ifplugd: add --with-initdir= to config command
Message-ID: <1345298656-12714-1-git-send-email-shawnjgoff@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Shawn J. Goff" <shawnjgoff@gmail.com>

ifplugd refuses to configure without this set.
---
 package/ifplugd/ifplugd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ifplugd/ifplugd.mk b/package/ifplugd/ifplugd.mk
index 1e11c14..d031a97 100644
--- a/package/ifplugd/ifplugd.mk
+++ b/package/ifplugd/ifplugd.mk
@@ -12,7 +12,7 @@ IFPLUGD_AUTORECONF = YES
 
 # install-strip unconditionally overwrites $(TARGET_DIR)/etc/ifplugd/ifplugd.*
 IFPLUGD_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-exec
-IFPLUGD_CONF_OPT = --disable-lynx
+IFPLUGD_CONF_OPT = --disable-lynx --with-initdir=/etc/init.d/
 IFPLUGD_DEPENDENCIES = libdaemon
 
 # Prefer big ifplugd
-- 
1.7.11.1
