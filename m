From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Wed,  7 Feb 2018 19:35:59 +0100
Subject: [Buildroot] [PATCH] package/openssh: also install ssh-copy-id script
Message-ID: <1518028559-22988-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien BOIBESSOT <julien.boibessot@armadeus.com>

This script is useful to copy SSH keys between client and server [1] and
installed on most distributions (for example on debian: [2]).

[1] https://www.ssh.com/ssh/copy-id
[2] https://packages.debian.org/fr/jessie/armhf/openssh-client/filelist

Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 6b7ac22..b0075e9 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -73,4 +73,10 @@ define OPENSSH_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S50sshd
 endef
 
+define OPENSSH_INSTALL_SSH_COPY_ID
+	$(INSTALL) -D -m 755 $(@D)/contrib/ssh-copy-id $(TARGET_DIR)/usr/bin
+endef
+
+OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_INSTALL_SSH_COPY_ID
+
 $(eval $(autotools-package))
-- 
2.1.4
