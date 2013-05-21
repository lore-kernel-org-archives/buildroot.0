From: Tzu-Jung Lee <roylee17@gmail.com>
Date: Tue, 21 May 2013 17:56:12 +0800
Subject: [Buildroot] [PATCH 1/1] <pkg>-rsync: support user custom cmds
Message-ID: <1369130172-15455-1-git-send-email-tjlee@ambarella.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Tzu-Jung Lee <tjlee@ambarella.com>
---
 package/pkg-generic.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 56fca6b..147e0de 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -311,6 +311,10 @@ $(2)_INSTALL_IMAGES		?= NO
 $(2)_INSTALL_TARGET		?= YES
 $(2)_DIR_PREFIX			= $(if $(4),$(4),$(TOP_SRCDIR)/package)
 
+# default rsync command
+$(2)_RSYNC_CMDS ?= \
+	rsync -au --cvs-exclude --include core $(SRCDIR)/ $(@D)
+
 # define sub-target stamps
 $(2)_TARGET_INSTALL_TARGET =	$$($(2)_DIR)/.stamp_target_installed
 $(2)_TARGET_INSTALL_STAGING =	$$($(2)_DIR)/.stamp_staging_installed
-- 
1.8.2.1
