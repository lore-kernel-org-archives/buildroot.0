From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 Jul 2016 12:55:35 +0200
Subject: [Buildroot] [git commit] initscripts: remove SOURCE
Message-ID: <20160703111558.B80FF8015F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=83da51635065010fff5b6daff8ba75fdf9513fae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that the package infrastructure doesn't attempt to download a package
that has an empty version string, there's no need to define the SOURCE
variable in the initscripts package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/initscripts/initscripts.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/initscripts/initscripts.mk b/package/initscripts/initscripts.mk
index a5d8db7..cfee155 100644
--- a/package/initscripts/initscripts.mk
+++ b/package/initscripts/initscripts.mk
@@ -4,9 +4,6 @@
 #
 ################################################################################
 
-# source included in buildroot
-INITSCRIPTS_SOURCE =
-
 define INITSCRIPTS_INSTALL_TARGET_CMDS
 	mkdir -p  $(TARGET_DIR)/etc/init.d
 	$(INSTALL) -D -m 0755 package/initscripts/init.d/* $(TARGET_DIR)/etc/init.d/
