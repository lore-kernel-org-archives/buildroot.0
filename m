From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 20:33:12 +0100
Subject: [Buildroot] [git commit] ntp: move systemd service file to /usr/lib
Message-ID: <20150320194323.2F9758181B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7afccf677621c557d0db100117833b1dfdf4d071
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ntp/ntp.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 7d5644a..36dea79 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -71,9 +71,10 @@ define NTP_INSTALL_INIT_SYSV
 endef
 
 define NTP_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 644 package/ntp/ntpd.service $(TARGET_DIR)/etc/systemd/system/ntpd.service
+	$(INSTALL) -D -m 644 package/ntp/ntpd.service $(TARGET_DIR)/usr/lib/systemd/system/ntpd.service
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs ../ntpd.service $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/ntpd.service
+	ln -fs ../../../../usr/lib/systemd/system/ntpd.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/ntpd.service
 endef
 endif
 
