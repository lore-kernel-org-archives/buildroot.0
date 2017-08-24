From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Thu, 24 Aug 2017 14:41:51 -0700
Subject: [Buildroot] [PATCH 2/3] package/transmission: Do not mark .service
	file executable
In-Reply-To: <20170824214152.5742-1-andrew.smirnov@gmail.com>
References: <20170824214152.5742-1-andrew.smirnov@gmail.com>
Message-ID: <20170824214152.5742-2-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Do not mark .service file executable, otherwise systemd
will give us a warning about it.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 package/transmission/transmission.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index f8abb2b8ba..0fce642a03 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -64,7 +64,7 @@ define TRANSMISSION_INSTALL_INIT_SYSV
 endef
 
 define TRANSMISSION_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 0755 $(@D)/daemon/transmission-daemon.service \
+	$(INSTALL) -D -m 0644 $(@D)/daemon/transmission-daemon.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/transmission-daemon.service
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 	ln -fs ../../../../usr/lib/systemd/system/transmission-daemon.service \
-- 
2.13.5
