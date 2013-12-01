From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Dec 2013 23:38:58 +0100
Subject: [Buildroot] [git commit] grub: sample menu.lst file improvements
Message-ID: <20131201225017.236EC9BE95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=97362f571cd877274cfd9bef30c6a4b99723135c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Two improvements to the menu.lst file:

 * Do not enforce any video mode, let the kernel use whatever it wants
   as the default, or let the user customize it when needed.

 * Use /dev/sda1 instead of /dev/hda1. Nowadays, most hard disk
   controllers are handled using libata, and therefore the disks are
   visible as /dev/sd<X>.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/grub/menu.lst |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/boot/grub/menu.lst b/boot/grub/menu.lst
index d76bf63..41e9b62 100644
--- a/boot/grub/menu.lst
+++ b/boot/grub/menu.lst
@@ -4,4 +4,4 @@ splashimage=(hd0,0)/boot/grub/splash.xpm.gz
 hiddenmenu
 title Buildroot
 	root (hd0,0)
-	kernel /boot/bzImage rw root=/dev/hda1 vga=791 
+	kernel /boot/bzImage rw root=/dev/sda1
