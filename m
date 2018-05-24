From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 May 2018 23:11:13 +0200
Subject: [Buildroot] [git commit] lrzsz: install symlinks for XMODEM and
 YMODEM
Message-ID: <20180524211315.02F7582618@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6697e59403cfd837f4b07e44a89c3ce0d5db417b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This sets the protocol choice according to the program invocation name.
That is the common lrzsz installation practice.

Cc: Matthew Starr <mstarr@hedonline.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lrzsz/lrzsz.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/lrzsz/lrzsz.mk b/package/lrzsz/lrzsz.mk
index 5dac07a295..25ecf3dead 100644
--- a/package/lrzsz/lrzsz.mk
+++ b/package/lrzsz/lrzsz.mk
@@ -24,6 +24,10 @@ define LRZSZ_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/src/lsz $(TARGET_DIR)/usr/bin/sz
 	ln -sf rz $(TARGET_DIR)/usr/bin/lrz
 	ln -sf sz $(TARGET_DIR)/usr/bin/lsz
+	ln -sf rz $(TARGET_DIR)/usr/bin/rb
+	ln -sf sz $(TARGET_DIR)/usr/bin/sb
+	ln -sf rz $(TARGET_DIR)/usr/bin/rx
+	ln -sf sz $(TARGET_DIR)/usr/bin/sx
 endef
 
 $(eval $(autotools-package))
