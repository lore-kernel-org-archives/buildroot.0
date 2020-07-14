From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 10:11:18 +0200
Subject: [Buildroot] [git commit] Makefile: add /etc/bash_completion.d to
 non-bash purge
Message-ID: <20200714080737.0C11D86CB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=18072ecc24b8f288cf131e0d3dcceb0bb6c955c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, we delete /usr/share/bash-completion when bash is not enabled.
We need to delete /etc/bash_completion.d too. For example, the jo package
installs files there:

/etc/bash_completion.d/jo.bash

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 8355de5ffa..7bd8ada488 100644
--- a/Makefile
+++ b/Makefile
@@ -756,6 +756,7 @@ ifneq ($(BR2_PACKAGE_GDB),y)
 endif
 ifneq ($(BR2_PACKAGE_BASH),y)
 	rm -rf $(TARGET_DIR)/usr/share/bash-completion
+	rm -rf $(TARGET_DIR)/etc/bash_completion.d
 endif
 ifneq ($(BR2_PACKAGE_ZSH),y)
 	rm -rf $(TARGET_DIR)/usr/share/zsh
