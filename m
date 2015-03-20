From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 20:39:40 +0100
Subject: [Buildroot] [git commit] libiio: move systemd service file to
	/usr/lib
Message-ID: <20150320194323.8A51D8181B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1dd088ca16f4daacad33b8e7c218dc9055c47c97
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libiio/libiio.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
index abcddba..7082e89 100644
--- a/package/libiio/libiio.mk
+++ b/package/libiio/libiio.mk
@@ -41,8 +41,8 @@ endef
 define LIBIIO_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -d $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 	$(INSTALL) -D -m 0644 $(@D)/debian/iiod.service \
-		$(TARGET_DIR)/lib/systemd/system/iiod.service
-	ln -fs /lib/systemd/system/iiod.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/iiod.service
+	ln -fs ../../../../usr/lib/systemd/system/iiod.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/iiod.service
 endef
 endif
