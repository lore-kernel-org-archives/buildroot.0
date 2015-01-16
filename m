From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 16 Jan 2015 09:07:05 +0100
Subject: [Buildroot] [PATCH] linux: clarify help text for 'custom tarball'
Message-ID: <1421395625-2672-1-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

The help text for Linux option 'Custom tarball' only refers to ftp or
http tarballs, while in reality file or scp protocols are also
supported.

Triggered by a recent support question, update the help text to clarify
this.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 linux/Config.in | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index a670802..1df0a49 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -48,8 +48,13 @@ config BR2_LINUX_KERNEL_CUSTOM_VERSION
 config BR2_LINUX_KERNEL_CUSTOM_TARBALL
 	bool "Custom tarball"
 	help
-	  This option allows to specify the http or ftp location of a
-	  specific kernel source tarball
+	  This option allows to specify a URL pointing to a kernel source
+	  tarball. This URL can use any protocol recognized by Buildroot,
+	  like http://, ftp://, file:// or scp://.
+
+	  When pointing to a local tarball using file://, you may want to
+	  use a make variable like $(TOPDIR) to reference the root of the
+	  Buildroot tree.
 
 config BR2_LINUX_KERNEL_CUSTOM_GIT
 	bool "Custom Git repository"
-- 
1.8.5.1
