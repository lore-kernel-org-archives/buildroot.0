From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  6 Apr 2021 17:42:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/tor: do not install systemd service
 file
Message-ID: <20210406154235.609269-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream removed the sample service file for use with systemd:
https://gitweb.torproject.org/tor.git/commit/contrib?h=maint-0.4.5&id=915af1a65bc217fa33490876199bb69f760bea23

Fixes:
http://autobuild.buildroot.net/results/b80/b807f19283528b9f0d0c46250b660ea84695679c/
http://autobuild.buildroot.net/results/de4/de4f1a99b1c524b81579ee804156e26d3f8babe7/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tor/tor.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 56779f1633..6eed5e4a47 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -73,9 +73,4 @@ endef
 
 TOR_POST_INSTALL_TARGET_HOOKS += TOR_INSTALL_CONF
 
-define TOR_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 644 $(@D)/contrib/dist/tor.service \
-		$(TARGET_DIR)/usr/lib/systemd/system/tor.service
-endef
-
 $(eval $(autotools-package))
-- 
2.29.2
