From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 May 2010 23:00:18 +0200
Subject: [Buildroot] [git commit master] vsftpd: fix build without largefile
	support
Message-ID: <20100526210240.DA40A12E244@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9d07fcd08e710beff30841b47db8b8772a9d3b7b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix lfs patch to include <features.h> before checking any of the
uClibc defines.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    3 ++-
 ...ibc_lfs.patch => vsftpd-2.0.7-uclibc_lfs.patch} |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)
 rename package/vsftpd/{vsftpd-2.0.5-uclibc_lfs.patch => vsftpd-2.0.7-uclibc_lfs.patch} (96%)

diff --git a/CHANGES b/CHANGES
index 354186a..83242aa 100644
--- a/CHANGES
+++ b/CHANGES
@@ -11,7 +11,8 @@
 	nbd, netsnmp, ntfsprogs, ntp, olsr, pango, pciutils, pcmanfm,
 	php, pkg-config, psmisc, qt, samba, shared-mime-info,
 	squashfs, squashfs3, sshfs, startup-notification, swfdec,
-	sylpheed, uemacs, util-linux, valgrind, vpnc, webkit, xstroke
+	sylpheed, uemacs, util-linux, valgrind, vpnc, vsftpd, webkit,
+	xstroke
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/vsftpd/vsftpd-2.0.5-uclibc_lfs.patch b/package/vsftpd/vsftpd-2.0.7-uclibc_lfs.patch
similarity index 96%
rename from package/vsftpd/vsftpd-2.0.5-uclibc_lfs.patch
rename to package/vsftpd/vsftpd-2.0.7-uclibc_lfs.patch
index ebd25ca..610b782 100644
--- a/package/vsftpd/vsftpd-2.0.5-uclibc_lfs.patch
+++ b/package/vsftpd/vsftpd-2.0.7-uclibc_lfs.patch
@@ -5,7 +5,7 @@ diff -rdup vsftpd-2.0.5.orig/sysutil.c vsftpd-2.0.5/sysutil.c
  #include "utility.h"
  #include "tunables.h"
  
-+#include "builddefs.h"
++#include <features.h>
 +
 +#if !defined __UCLIBC__ || (defined __UCLIBC__ && defined __UCLIBC_HAS_LFS__)
  /* Activate 64-bit file support on Linux/32bit plus others */
-- 
1.6.3.3
