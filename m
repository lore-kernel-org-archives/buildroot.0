From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 20:37:16 +0100
Subject: [Buildroot] [git commit] openssh: move systemd service files to
	/usr/lib
Message-ID: <20150320194323.6A34A8181B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6111d478d2ef180eeb80c1a3b42deb625f5594b8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openssh/openssh.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 08f3fa0..24af079 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -36,9 +36,9 @@ endif
 
 define OPENSSH_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/openssh/sshd.service \
-		$(TARGET_DIR)/etc/systemd/system/sshd.service
+		$(TARGET_DIR)/usr/lib/systemd/system/sshd.service
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs ../sshd.service \
+	ln -fs ../../../../usr/lib/systemd/system/sshd.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/sshd.service
 endef
 
