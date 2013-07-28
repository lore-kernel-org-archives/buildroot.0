From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jul 2013 16:19:58 +0200
Subject: [Buildroot] [git commit] tcl: remove strip command
Message-ID: <20130728142001.1C2C29AB40@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=06bbffb5f2f6fb66007306282890621d9ed94677
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Stripping is done at the end of the buildroot process, for all files at
once.
There's no need to do it here.
(Suggested by Thomas Petazzoni)

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tcl/tcl.mk |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index 7c08ee6..564d5bc 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -22,11 +22,6 @@ HOST_TCL_CONF_OPT = \
 		--disable-langinfo \
 		--disable-framework
 
-define TCL_POST_INSTALL_CLEANUP
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libtcl8.4.so
-endef
-TCL_POST_INSTALL_TARGET_HOOKS += TCL_POST_INSTALL_CLEANUP
-
 ifeq ($(BR2_PACKAGE_TCL_DEL_ENCODINGS),y)
 define TCL_REMOVE_ENCODINGS
 	rm -rf $(TARGET_DIR)/usr/lib/tcl$(TCL_VERSION_MAJOR)/encoding/*
