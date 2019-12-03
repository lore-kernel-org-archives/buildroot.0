From: Pascal de Bruijn <p.debruijn@unilogic.nl>
Date: Tue,  3 Dec 2019 10:00:50 +0100
Subject: [Buildroot] [PATCH] package/lvm2: install udev rules
Message-ID: <20191203090050.4382-1-p.debruijn@unilogic.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Without the device-mapper udev rules, dm devices will not get a proper
symlink like /dev/disk/by-label/LABEL, which in turn causes fstab
LABEL= mounts to fails.

And by extension causes shenanigans with systemd, where it will
unmount a manually mounted disk because it can't resolve the label.

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
---
 package/lvm2/lvm2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 7fdb9a7..65576f4 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -19,6 +19,7 @@ LVM2_CONF_OPTS += \
 	--enable-pkgconfig \
 	--enable-cmdlib \
 	--enable-dmeventd \
+	--enable-udev_rules \
 	--disable-nls \
 	--disable-symvers
 
-- 
2.7.4
