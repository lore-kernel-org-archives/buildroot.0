From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Jun 2019 09:41:15 +0200
Subject: [Buildroot] [git commit branch/2019.02.x]
 support/scripts/check-bin-arch: ignore /usr/lib/grub
Message-ID: <20190606074234.80CCC813D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2b161eef94ef71db15f2bda25f7971227bdfa80f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

/lib/grub is already ignored, so add /usr/lib/grub to support
BR2_ROOTFS_MERGED_USR.

Signed-off-by: Alex Xu <alex_y_xu@yahoo.ca>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b7fddc06224f10e847dd4af8a259bbdee58e837b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/check-bin-arch | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/support/scripts/check-bin-arch b/support/scripts/check-bin-arch
index 66b8d89932..3449bd1aeb 100755
--- a/support/scripts/check-bin-arch
+++ b/support/scripts/check-bin-arch
@@ -21,9 +21,10 @@ declare -a IGNORES=(
 	# are not for the target architecture
 	"/usr/share"
 
-	# Skip files in /lib/grub, since it is possible to have it
-	# for a different architecture (e.g. i386 grub on x86_64).
+	# Skip files in {/usr,}/lib/grub, since it is possible to have
+	# it for a different architecture (e.g. i386 grub on x86_64).
 	"/lib/grub"
+	"/usr/lib/grub"
 )
 
 while getopts p:l:r:a:i: OPT ; do
