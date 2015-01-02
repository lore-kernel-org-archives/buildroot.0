From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Jan 2015 14:44:15 +0100
Subject: [Buildroot] [git commit] linux: change Device Tree prompt
Message-ID: <20150102134521.70D34803E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=be529e22189b425edb3e6c23dea91f3c1d91a694
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current prompt seems to imply that we want to add Device Tree
support to the Linux kernel:

    [*] Device tree support

But what it really means is that Buildroot will build a DTB.

Change the prompt so that it is obvious that this is the intended
behaviour, and users do not get mislead as to why Device Tree support is
not automatically added to their Linux kernel.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

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
 
