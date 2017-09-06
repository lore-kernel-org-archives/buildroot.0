From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Sep 2017 12:31:11 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/transmission: Do
	not mark .service file executable
Message-ID: <20170906112607.84E7E8211D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c565971bd7bfc82a84c5ca8798c4d0795c692b75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Do not mark .service file executable, otherwise systemd
will give us a warning about it.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit a1c3ae753e7fb069cdb15ad2c194bcd47237123a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/transmission/transmission.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index 923ba40..f4b0d71 100644
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
