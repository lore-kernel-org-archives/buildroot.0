From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  1 Jan 2015 23:08:19 +0100
Subject: [Buildroot] [PATCH] linux: change DEvice Tree prompt
Message-ID: <1420150099-13977-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current prompt seem to imp[ly that we want to add Device Tree
support to the Linux kernel:

    [*] Device tree support

But what it really means is that Buildroot will build a DTB.

Change the prompt so that it is obvious that this is the intended
behaviour, and users do not get mislead as to why Device Tree support is
not automatically added to their Linux kernel.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index ba4b574..541002e 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -269,7 +269,7 @@ config BR2_LINUX_KERNEL_UIMAGE_LOADADDR
 	  If unsure, let this option empty.
 
 config BR2_LINUX_KERNEL_DTS_SUPPORT
-	bool "Device tree support"
+	bool "Build a Device Tree Blob (DTB)"
 	help
 	  Compile a device tree source into a device tree blob.
 	  Select the dts file to compile in the options below.
-- 
1.9.1
