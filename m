From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 7 Apr 2021 21:27:05 +0200
Subject: [Buildroot] [git commit] package/tor: do not install systemd
 service file
Message-ID: <20210407190226.100AD812F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=acd317d907526d8242874afce96e2f4d8345786a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream removed the sample service file for use with systemd:
https://gitweb.torproject.org/tor.git/commit/contrib?h=maint-0.4.5&id=915af1a65bc217fa33490876199bb69f760bea23

Fixes:
http://autobuild.buildroot.net/results/b80/b807f19283528b9f0d0c46250b660ea84695679c/
http://autobuild.buildroot.net/results/de4/de4f1a99b1c524b81579ee804156e26d3f8babe7/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
