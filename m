From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jan 2014 21:58:26 +0100
Subject: [Buildroot] [git commit] Config.in.legacy: fix misc. problems with
	libnfc-llcp removal
Message-ID: <20140121205928.3DACB9AB97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=93341046d8e25ee6f135a34a8989598de22e32ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 631286a..40bc805 100644
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
