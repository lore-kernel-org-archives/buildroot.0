From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Jan 2015 22:34:18 +0100
Subject: [Buildroot] [git commit] linux: clarify help text for 'custom
	tarball'
Message-ID: <20150116213509.AC4E980E32@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=74243211cb8204ee45b01ecdd5ba72fd6f974242
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The help text for Linux option 'Custom tarball' only refers to ftp or
http tarballs, while in reality file or scp protocols are also
supported.

Triggered by a recent support question, update the help text to clarify
this.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/Config.in |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

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
