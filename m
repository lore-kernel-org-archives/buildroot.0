From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  2 Jan 2015 13:26:27 +0100
Subject: [Buildroot] [PATCH] linux: change Device Tree prompt
Message-ID: <1420201587-27417-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current prompt seems to imply that we want to add Device Tree
support to the Linux kernel:

    [*] Device tree support

But what it really means is that Buildroot will build a DTB.

Change the prompt so that it is obvious that this is the intended
behaviour, and users do not get mislead as to why Device Tree support is
not automatically added to their Linux kernel.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Changes v1 -> v2:
  - tweak help entry to state this can be multiple DTBs  (Thomas)
---
 linux/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index ba4b574..bf30426 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -269,10 +269,10 @@ config BR2_LINUX_KERNEL_UIMAGE_LOADADDR
 	  If unsure, let this option empty.
 
 config BR2_LINUX_KERNEL_DTS_SUPPORT
-	bool "Device tree support"
+	bool "Build a Device Tree Blob (DTB)"
 	help
-	  Compile a device tree source into a device tree blob.
-	  Select the dts file to compile in the options below.
+	  Compile one or more device tree sources into device tree blobs.
+	  Select the dts files to compile in the options below.
 
 if BR2_LINUX_KERNEL_DTS_SUPPORT
 
-- 
1.9.1
