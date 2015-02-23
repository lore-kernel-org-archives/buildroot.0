From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Feb 2015 12:38:12 +0100
Subject: [Buildroot] [git commit branch/next] package/dropbear: install
	dropbear.service to correct dir
Message-ID: <20150223113819.404CA80DF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a5a705d2c99c2a3e15bd8d7480baf439ef886e5a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The place for package-provided systemd units is /lib/systemd/system.
/etc/systemd/system is for custom units.
Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dropbear/dropbear.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index e063b10..f2ae403 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -53,9 +53,9 @@ endef
 
 define DROPBEAR_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/dropbear/dropbear.service \
-		$(TARGET_DIR)/etc/systemd/system/dropbear.service
+		$(TARGET_DIR)/lib/systemd/system/dropbear.service
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs ../dropbear.service \
+	ln -fs /lib/systemd/system/dropbear.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/dropbear.service
 endef
 
