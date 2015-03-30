From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 30 Mar 2015 18:07:29 -0300
Subject: [Buildroot] [PATCH v3 10/15] boot/gummiboot: drop largefile depends
In-Reply-To: <1427749654-30153-1-git-send-email-gustavo@zacarias.com.ar>
References: <1427749654-30153-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1427749654-30153-11-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop the buildroot toolchain non-largefile support option since it's
being removed.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 boot/gummiboot/Config.in | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

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
-- 
2.0.5
