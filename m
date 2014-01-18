From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 18 Jan 2014 20:23:40 +0100
Subject: [Buildroot] [PATCH 03/10] transmission: use <PKG>_INSTALL_INIT_SYSV
	infra instead of custom hook
In-Reply-To: <1390073027-14239-1-git-send-email-s.martin49@gmail.com>
References: <1390073027-14239-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1390073027-14239-4-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/transmission/transmission.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index 3ced558..e52c7be 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -19,7 +19,7 @@ TRANSMISSION_CONF_OPT = \
 	--disable-libnotify \
 	--enable-lightweight
 
-define TRANSMISSION_INIT_SCRIPT_INSTALL
+define TRANSMISSION_INSTALL_INIT_SYSV
 	[ -f $(TARGET_DIR)/etc/init.d/S92transmission ] || \
 		$(INSTALL) -m 0755 -D package/transmission/S92transmission \
 			$(TARGET_DIR)/etc/init.d/S92transmission
@@ -39,7 +39,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_TRANSMISSION_DAEMON),y)
 	TRANSMISSION_CONF_OPT += --enable-daemon
-	TRANSMISSION_POST_INSTALL_TARGET_HOOKS += TRANSMISSION_INIT_SCRIPT_INSTALL
 else
 	TRANSMISSION_CONF_OPT += --disable-daemon
 endif
-- 
1.8.5.3
