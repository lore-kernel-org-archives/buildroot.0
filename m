From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Dec 2013 15:56:33 +0100
Subject: [Buildroot] [PATCH 2/9] grub: enclose network driver options in a
	sub-menu
In-Reply-To: <1388242600-2580-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1388242600-2580-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1388242600-2580-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In preparation to a change to the configuration options of the
supported filesystem in Grub, enclose the network driver options in a
sub-menu.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/grub/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/boot/grub/Config.in b/boot/grub/Config.in
index c90770f..c3a729f 100644
--- a/boot/grub/Config.in
+++ b/boot/grub/Config.in
@@ -58,6 +58,8 @@ config BR2_TARGET_GRUB_DISKLESS
 	help
 	  enable diskless support
 
+menu "network drivers"
+
 config BR2_TARGET_GRUB_3c595
 	bool "3Com595 driver"
 	help
@@ -163,4 +165,6 @@ config BR2_TARGET_GRUB_w89c840
 	help
 	  enable Winbond W89c840 driver
 
+endmenu
+
 endif # BR2_TARGET_GRUB
-- 
1.8.3.2
