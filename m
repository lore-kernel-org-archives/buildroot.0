From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 20:36:40 +0100
Subject: [Buildroot] [git commit] openntpd: move systemd service files to
	/usr/lib
Message-ID: <20150320194323.47DB68181B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=407e542d777e1de3dca2e6c2e0e87ee7b753b4df
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openntpd/openntpd.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openntpd/openntpd.mk b/package/openntpd/openntpd.mk
index 60f025c..41e3399 100644
--- a/package/openntpd/openntpd.mk
+++ b/package/openntpd/openntpd.mk
@@ -11,9 +11,9 @@ OPENNTPD_LICENSE_FILES = COPYING
 
 define OPENNTPD_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 package/openntpd/ntpd.service \
-		$(TARGET_DIR)/etc/systemd/system/ntpd.service
+		$(TARGET_DIR)/usr/lib/systemd/system/ntpd.service
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs ../ntpd.service \
+	ln -fs ../../../../usr/lib/systemd/system/ntpd.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/ntpd.service
 endef
 
