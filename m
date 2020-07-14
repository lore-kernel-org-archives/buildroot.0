From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon, 13 Jul 2020 22:24:59 -0400
Subject: [Buildroot] [PATCH 1/1] Makefile: add /etc/bash_completion.d to
 non-bash purge
Message-ID: <20200714022459.1926-1-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we delete /usr/share/bash-completion when bash is not enabled.
We need to delete /etc/bash_completion.d too. For example, the jo package
installs files there:

/etc/bash_completion.d/jo.bash

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 04c29b1..d6540ac 100644
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
-- 
2.7.4
