From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jan 2014 13:31:56 +0100
Subject: [Buildroot] [git commit] lvm2: cleanup: remove the unused variable
	LVM2_BINS
Message-ID: <20140116123342.DA31E9C518@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=73ad2735a2e718151477b9ea01019792d27c5218
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The LVM2_BINS variable is a leftover of the
commit 564e0c7e655f4cbb225427230cf3b22be0575653.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lvm2/lvm2.mk |   11 -----------
 1 files changed, 0 insertions(+), 11 deletions(-)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 2761100..6566b32 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -11,17 +11,6 @@ LVM2_INSTALL_STAGING = YES
 LVM2_LICENSE = GPLv2 LGPLv2.1
 LVM2_LICENSE_FILES = COPYING COPYING.LIB
 
-LVM2_BINS = \
-	dmsetup fsadm lvm lvmconf lvmdump vgimportclone \
-	lvchange lvconvert lvcreate lvdisplay lvextend 	\
-	lvmchange lvmdiskscan lvmsadc lvmsar lvreduce  	\
-	lvremove lvrename lvresize lvs lvscan pvchange 	\
-	pvck pvcreate pvdisplay pvmove pvremove 	\
-	pvresize pvs pvscan vgcfgbackup vgcfgrestore 	\
-	vgchange vgck vgconvert vgcreate vgdisplay 	\
-	vgexport vgextend vgimport vgmerge vgmknodes 	\
-	vgreduce vgremove vgrename vgs vgscan vgsplit
-
 # Make sure that binaries and libraries are installed with write
 # permissions for the owner.
 LVM2_CONF_OPT += --enable-write_install --enable-pkgconfig
