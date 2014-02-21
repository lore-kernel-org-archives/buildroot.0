From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 21 Feb 2014 23:31:07 +0100
Subject: [Buildroot] [git commit] Config: default BR2_PACKAGE_OVERRIDE_FILE
	to $(CONFIG_DIR)/local.mk
Message-ID: <20140228133415.A85089BBF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eda3d0e1d01c3f3e32a24759ddd107574a118c8c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current default for BR2_PACKAGE_OVERRIDE_FILE points to:
    $(TOPDIR)/local.mk

This works well for in-tree builds, but is not very useful for
out-of-tree builds, when the Buildroot source tree may be shared for
different concurrent builds.

Also, it seems to be more sensible to have local.mk alognside
the .config file.

Hence, change the default for BR2_PACKAGE_OVERRIDE_FILE to point to:
    $(CONFIG_DIR)/local.mk

Note that this does not change the current behaviour for in-tree
builds, since in that case $(CONFIG_DIR) == $(TOPDIR).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Config.in b/Config.in
index c5c8aa8..55f5fd8 100644
--- a/Config.in
+++ b/Config.in
@@ -475,7 +475,7 @@ config BR2_PREFER_STATIC_LIB
 
 config BR2_PACKAGE_OVERRIDE_FILE
 	string "location of a package override file"
-	default "$(TOPDIR)/local.mk"
+	default "$(CONFIG_DIR)/local.mk"
 	help
 	  A package override file is a short makefile that contains
 	  variable definitions of the form <pkg>_OVERRIDE_SRCDIR,
