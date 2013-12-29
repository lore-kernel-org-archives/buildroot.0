From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Dec 2013 12:17:35 +0100
Subject: [Buildroot] [git commit] grub: enclose network driver options in a
	sub-menu
Message-ID: <20131229111948.652329C20D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cbbbe16714562a4ec4d90b85cd913cb66120b158
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In preparation to a change to the configuration options of the
supported filesystem in Grub, enclose the network driver options in a
sub-menu.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 boot/grub/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

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
