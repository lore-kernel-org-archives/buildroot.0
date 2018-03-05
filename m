From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 05 Mar 2018 20:07:21 -0000
Subject: [Buildroot] [git commit] package/openssh: also install ssh-copy-id
 script
Message-ID: <20180305200714.3392B7FD45@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0552b7fc3878d7e446ee082f492845bc33594bba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This script is useful to copy SSH keys between client and server [1] and
installed on most distributions (for example on debian: [2]).

[1] https://www.ssh.com/ssh/copy-id
[2] https://packages.debian.org/fr/jessie/armhf/openssh-client/filelist

Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Thomas: use full destination path.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openssh/openssh.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 6b7ac22c19..986bab413d 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -73,4 +73,10 @@ define OPENSSH_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S50sshd
 endef
 
+define OPENSSH_INSTALL_SSH_COPY_ID
+	$(INSTALL) -D -m 755 $(@D)/contrib/ssh-copy-id $(TARGET_DIR)/usr/bin/ssh-copy-id
+endef
+
+OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_INSTALL_SSH_COPY_ID
+
 $(eval $(autotools-package))
