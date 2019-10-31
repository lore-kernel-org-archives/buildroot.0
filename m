From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Oct 2019 15:34:13 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] boot/uboot: fix the help
 text of BR2_TARGET_UBOOT_ENVIMAGE_SOURCE
Message-ID: <20191031143059.0A4208E248@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cb7eb43f9ac31a3850716f88664d57cf8f8818fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

In commit 2c8ff251cb16d38fb417a488ee0367cd03eebda2 ("boot/uboot: add
option to generate env image from default env"), the possibility of
generating an environment image using the built-in U-Boot environment
as a source was added.

This is meant to happen when the string option
BR2_TARGET_UBOOT_ENVIMAGE_SOURCE is empty, but the original commit
added the Config.in help text to BR2_TARGET_UBOOT_ENVIMAGE, which is a
boolean option, and therefore cannot be empty.

Move the help text to BR2_TARGET_UBOOT_ENVIMAGE_SOURCE, where it
belongs.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f9ab00ba4606b46ac6114a634dc93cf3ee76a108)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 8642b58121..ca160dd5dd 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -487,8 +487,6 @@ menuconfig BR2_TARGET_UBOOT_ENVIMAGE
 
 	  The environment image will be called uboot-env.bin.
 
-	  Leave empty to generate image from compiled-in env.
-
 if BR2_TARGET_UBOOT_ENVIMAGE
 
 config BR2_TARGET_UBOOT_ENVIMAGE_SOURCE
@@ -500,6 +498,8 @@ config BR2_TARGET_UBOOT_ENVIMAGE_SOURCE
 
 	  Multiple source files are concatenated in the order listed.
 
+	  Leave empty to generate image from compiled-in env.
+
 config BR2_TARGET_UBOOT_ENVIMAGE_SIZE
 	string "Size of environment"
 	help
