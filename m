From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Fri, 29 Oct 2010 20:06:24 +0200
Subject: [Buildroot] [git commit master 1/1] Fix libgtk2 post install hook
	regression
Message-ID: <20101029181143.DE2078D41D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=376dcb23adf6ff60884bd4393d1f3e2f79bc3602
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgtk2/libgtk2.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index e19025d..e41fcc9 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -119,7 +119,7 @@ define LIBGTK2_POST_INSTALL_TWEAKS
 	rm -rf $(TARGET_DIR)/usr/share/gtk-2.0/demo $(TARGET_DIR)/usr/bin/gtk-demo
 endef
 
-LIBGTK2_POST_INSTALL_TARGET_HOOKS += LIBGTK_POST_INSTALL_TWEAKS
+LIBGTK2_POST_INSTALL_TARGET_HOOKS += LIBGTK2_POST_INSTALL_TWEAKS
 
 # We do not build a full version of libgtk2 for the host, because that
 # requires compiling Cairo, Pango, ATK and X.org for the
-- 
1.7.1
