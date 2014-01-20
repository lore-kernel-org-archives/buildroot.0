From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 20 Jan 2014 22:46:10 +0100
Subject: [Buildroot] [PATCH 5 of 5 v2] Config.in.legacy: fix misc. problems
 with libnfc-llcp removal
In-Reply-To: <patchbomb.1390254365@argentina>
References: <patchbomb.1390254365@argentina>
Message-ID: <77fb0983c163d2419e94.1390254370@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Config.in.legacy entry associated with the replacement of libnfc-llcp
was broken in multiple ways:

- it was not correctly added within the section for 2014.02 deprecation
  (incidentally fixed with the patch removing target lzma)
- it still had select/depend statement from the original symbol, which
  should not be added in Config.in.legacy.
- it did not select the replacement symbol as to make the transition for
  users more convenient.
- indentation of the help text was not tab+2spaces.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v2: new patch

 Config.in.legacy |  9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -110,14 +110,13 @@ config BR2_PACKAGE_LZMA
 	  Note: generating lzma-compressed rootfs images is still supported.
 
 config BR2_PACKAGE_LIBNFC_LLCP
-	bool "libnfc-llcp has been removed"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
-	select BR2_PACKAGE_LIBNFC
+	bool "libnfc-llcp has been replaced by libllcp"
 	select BR2_LEGACY
+	select BR2_PACKAGE_LIBLLCP
 	help
 	  The 'libnfc-llcp' package has been removed since upstream renamed
-          to 'libllcp'. We have added a new package for 'libllcp' and bumped
-          the version at the same time.
+	  to 'libllcp'. We have added a new package for 'libllcp' and bumped
+	  the version at the same time.
 
 config BR2_PACKAGE_TTCP
 	bool "ttcp has been removed"
