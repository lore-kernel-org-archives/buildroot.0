From: Alex Xu (Hello71) <alex_y_xu@yahoo.ca>
Date: Tue,  7 May 2019 08:43:45 -0400
Subject: [Buildroot] [PATCH] support/check-bin-arch: ignore /usr/lib/grub
Message-ID: <20190507124345.6424-1-alex_y_xu@yahoo.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

/lib/grub is already ignored, so add /usr/lib/grub to support
BR2_ROOTFS_MERGED_USR.

Signed-off-by: Alex Xu (Hello71) <alex_y_xu@yahoo.ca>
---
 support/scripts/check-bin-arch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/scripts/check-bin-arch b/support/scripts/check-bin-arch
index 66b8d89932..0c6ce83b4f 100755
--- a/support/scripts/check-bin-arch
+++ b/support/scripts/check-bin-arch
@@ -24,6 +24,7 @@ declare -a IGNORES=(
 	# Skip files in /lib/grub, since it is possible to have it
 	# for a different architecture (e.g. i386 grub on x86_64).
 	"/lib/grub"
+	"/usr/lib/grub"
 )
 
 while getopts p:l:r:a:i: OPT ; do
-- 
2.21.0
