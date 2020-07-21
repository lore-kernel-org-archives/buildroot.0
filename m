From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jul 2020 22:51:17 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] Makefile: add
 /etc/bash_completion.d to non-bash purge
Message-ID: <20200721204654.2E04986A5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9704c56af1c7b5b5c2f7e547478309a9850f803d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Currently, we delete /usr/share/bash-completion when bash is not enabled.
We need to delete /etc/bash_completion.d too. For example, the jo package
installs files there:

/etc/bash_completion.d/jo.bash

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 18072ecc24b8f288cf131e0d3dcceb0bb6c955c8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index c6e0529498..413e565dae 100644
--- a/Makefile
+++ b/Makefile
@@ -757,6 +757,7 @@ ifneq ($(BR2_PACKAGE_GDB),y)
 endif
 ifneq ($(BR2_PACKAGE_BASH),y)
 	rm -rf $(TARGET_DIR)/usr/share/bash-completion
+	rm -rf $(TARGET_DIR)/etc/bash_completion.d
 endif
 ifneq ($(BR2_PACKAGE_ZSH),y)
 	rm -rf $(TARGET_DIR)/usr/share/zsh
