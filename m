From: Mike Williams <mike@mikebwilliams.com>
Date: Thu, 19 Mar 2015 13:56:40 -0400
Subject: [Buildroot] [PATCH 08/15] openssh: move systemd service files to
	/usr/lib
In-Reply-To: <1426787807-29510-1-git-send-email-mike@mikebwilliams.com>
References: <1426787807-29510-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <1426787807-29510-9-git-send-email-mike@mikebwilliams.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
---
 package/openssh/openssh.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 08f3fa0..eccfad1 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -36,10 +36,10 @@ endif
 
 define OPENSSH_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/openssh/sshd.service \
-		$(TARGET_DIR)/etc/systemd/system/sshd.service
+		$(TARGET_DIR)/usr/lib/systemd/system/sshd.service
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs ../sshd.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/sshd.service
+	ln -fs /usr/lib/systemd/system/sshd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/multi-user.target.wants/sshd.service
 endef
 
 define OPENSSH_INSTALL_INIT_SYSV
-- 
2.1.0
