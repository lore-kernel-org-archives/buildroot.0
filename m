From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jun 2018 23:05:09 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] lrzsz: install symlinks
 for XMODEM and YMODEM
Message-ID: <20180611211537.4F8EB8832D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=48548d2c6861586e88f540890e3d9f4c544d3a44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

This sets the protocol choice according to the program invocation name.
That is the common lrzsz installation practice.

Cc: Matthew Starr <mstarr@hedonline.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6697e59403cfd837f4b07e44a89c3ce0d5db417b)
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
