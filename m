From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 20:39:09 +0100
Subject: [Buildroot] [git commit] dropbear: move systemd service file to
	/usr/lib
Message-ID: <20150320194323.75ABF8181B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3aa96c1e5ad51c9dfb3a50af8ef1fc958d7f655f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dropbear/dropbear.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index f2ae403..bc65d69 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -53,9 +53,9 @@ endef
 
 define DROPBEAR_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/dropbear/dropbear.service \
-		$(TARGET_DIR)/lib/systemd/system/dropbear.service
+		$(TARGET_DIR)/usr/lib/systemd/system/dropbear.service
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs /lib/systemd/system/dropbear.service \
+	ln -fs ../../../../usr/lib/systemd/system/dropbear.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/dropbear.service
 endef
 
