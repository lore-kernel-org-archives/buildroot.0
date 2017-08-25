From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Aug 2017 16:09:57 +0200
Subject: [Buildroot] [git commit] package/transmission: Do not mark .service
	file executable
Message-ID: <20170825140416.2EB55805FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a1c3ae753e7fb069cdb15ad2c194bcd47237123a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Do not mark .service file executable, otherwise systemd
will give us a warning about it.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/transmission/transmission.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index f8abb2b..0fce642 100644
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
