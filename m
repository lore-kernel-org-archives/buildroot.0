From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Nov 2014 15:18:47 +0100
Subject: [Buildroot] [PATCHv3 59/74] transmission: install init script
	unconditionally
In-Reply-To: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417357142-14307-60-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As discussed, users should use a rootfs overlay or a post-build script
instead of a custom skeleton to override files installed by Buildroot,
so there is no point in having conditions when installing init scripts
or configuration files.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/transmission/transmission.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index 27ad9d9..b8a5c42 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -37,9 +37,8 @@ ifeq ($(BR2_PACKAGE_TRANSMISSION_DAEMON),y)
 	TRANSMISSION_CONF_OPTS += --enable-daemon
 
 define TRANSMISSION_INSTALL_INIT_SYSV
-	[ -f $(TARGET_DIR)/etc/init.d/S92transmission ] || \
-		$(INSTALL) -m 0755 -D package/transmission/S92transmission \
-			$(TARGET_DIR)/etc/init.d/S92transmission
+	$(INSTALL) -m 0755 -D package/transmission/S92transmission \
+		$(TARGET_DIR)/etc/init.d/S92transmission
 endef
 
 else
-- 
2.1.0
