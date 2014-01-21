From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 21 Jan 2014 08:54:13 +0100
Subject: [Buildroot] [PATCH 5 of 5 v3] Config.in.legacy: fix misc. problems
 with libnfc-llcp removal
In-Reply-To: <patchbomb.1390290848@argentina>
References: <patchbomb.1390290848@argentina>
Message-ID: <74fde2563727aaf84a8f.1390290853@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Config.in.legacy entry associated with the replacement of libnfc-llcp
was broken in multiple ways:

- it was not correctly added within the section for 2014.02 deprecation
  (recently fixed by Yann E. Morin with commit
  f169e5e1055600fda1b3ff0c852ee84d2ec80460)
- it still had select/depend statements from the original symbol, which
  should not be added in Config.in.legacy.
- it did not select the replacement symbol as to make the transition for
  users more convenient.
- indentation of the help text was not tab+2spaces.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v3: rebase
v2: new patch

 Config.in.legacy |  9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -117,14 +117,13 @@ config BR2_PACKAGE_TTCP
 	  deprecated for more than four buildroot releases.
 
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
 
 config BR2_PACKAGE_SQUASHFS3
 	bool "squashfs3 has been removed"
