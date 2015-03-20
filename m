From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 20:40:11 +0100
Subject: [Buildroot] [git commit] kodi: move systemd service file to /usr/lib
Message-ID: <20150320194323.9C9CB8181B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=af17811662595ad1db0a992a3a7446c79d40d578
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi/kodi.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index f40fc31..e0d49e6 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -256,11 +256,11 @@ endef
 
 define KODI_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/kodi/kodi.service \
-		$(TARGET_DIR)/etc/systemd/system/kodi.service
+		$(TARGET_DIR)/usr/lib/systemd/system/kodi.service
 
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 
-	ln -fs ../kodi.service \
+	ln -fs ../../../../usr/lib/systemd/system/kodi.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/kodi.service
 endef
 
