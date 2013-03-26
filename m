From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 26 Mar 2013 19:42:45 +0100
Subject: [Buildroot] [PATCH 3 of 3] linux/uboot: line-up repository-related
 configuration options
In-Reply-To: <patchbomb.1364323362@BEANTN0L019720>
References: <patchbomb.1364323362@BEANTN0L019720>
Message-ID: <df66e274b33842955eb2.1364323365@BEANTN0L019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Although the configuration options for custom repository locations and
versions are very similar between the linux and uboot packages, there are
some minor differences. This patch lines up both packages.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
Note: one remaining difference is that there are help texts in linux for
options BR2_LINUX_KERNEL_CUSTOM_GIT and BR2_LINUX_KERNEL_CUSTOM_HG. I
didn't add them to uboot because it seems a bit redundant, but if you
prefer we can line this up as well (either add help texts to uboot or
remove them from linux).

 boot/uboot/Config.in |  5 +++++
 linux/Config.in      |  2 +-
 2 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -87,6 +87,11 @@ config BR2_TARGET_UBOOT_CUSTOM_REPO_URL
 
 config BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION
 	string "Custom repository version"
+	default "HEAD" if BR2_TARGET_UBOOT_CUSTOM_GIT
+	default "tip" if BR2_TARGET_UBOOT_CUSTOM_HG
+	help
+	  Revision to use in the typical format used by Git/Mercurial
+	  E.G. a sha id, a tag, branch, ..
 
 endif
 
diff --git a/linux/Config.in b/linux/Config.in
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -47,7 +47,7 @@ config BR2_LINUX_KERNEL_CUSTOM_TARBALL
 	  specific kernel source tarball
 
 config BR2_LINUX_KERNEL_CUSTOM_GIT
-	bool "Custom Git tree"
+	bool "Custom Git repository"
 	help
 	  This option allows Buildroot to get the Linux kernel source
 	  code from a Git repository.
