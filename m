From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 15:57:33 +0100
Subject: [Buildroot] [git commit] sshfs: use SSHFS_VERSION variable in URL
Message-ID: <20151230145745.439F882712@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a3c6943ffb0d64267675e756e97a1c96564414c2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sshfs/sshfs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sshfs/sshfs.mk b/package/sshfs/sshfs.mk
index 93f2522..f59f7ea 100644
--- a/package/sshfs/sshfs.mk
+++ b/package/sshfs/sshfs.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SSHFS_VERSION = 2.5
-SSHFS_SITE = https://github.com/libfuse/sshfs/releases/download/sshfs_2_5
+SSHFS_SITE = https://github.com/libfuse/sshfs/releases/download/sshfs_$(subst .,_,$(SSHFS_VERSION))
 SSHFS_SOURCE = sshfs-fuse-$(SSHFS_VERSION).tar.gz
 SSHFS_LICENSE = GPLv2
 SSHFS_LICENSE_FILES = COPYING
