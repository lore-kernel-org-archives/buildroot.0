From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Nov 2013 17:47:30 +0100
Subject: [Buildroot] [PATCH 06/15] grub: sample menu.lst file improvements
In-Reply-To: <1384188459-1332-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1384188459-1332-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1384188459-1332-7-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Two improvements to the menu.lst file:

 * Do not enforce any video mode, let the kernel use whatever it wants
   as the default, or let the user customize it when needed.

 * Use /dev/sda1 instead of /dev/hda1. Nowadays, most hard disk
   controllers are handled using libata, and therefore the disks are
   visible as /dev/sd<X>.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/grub/menu.lst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.8.1.2
