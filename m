From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Apr 2015 22:44:15 +0200
Subject: [Buildroot] [git commit] boot/gummiboot: drop largefile depends
Message-ID: <20150401205856.0F46E81918@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f8518c47ab785ac5bd6a4aedf78db94d576ffe23
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop the buildroot toolchain non-largefile support option since it's
being removed.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/gummiboot/Config.in |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/boot/gummiboot/Config.in b/boot/gummiboot/Config.in
index 8d70680..ad49793 100644
--- a/boot/gummiboot/Config.in
+++ b/boot/gummiboot/Config.in
@@ -4,7 +4,6 @@ config BR2_TARGET_GUMMIBOOT
 	select BR2_PACKAGE_GNU_EFI
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
-	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
 	help
 	  gummiboot is a simple UEFI boot manager which executes
@@ -24,5 +23,5 @@ config BR2_TARGET_GUMMIBOOT
 
 	  http://freedesktop.org/wiki/Software/gummiboot/
 
-comment "gummiboot needs a toolchain w/ largefile, wchar"
-	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
+comment "gummiboot needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
