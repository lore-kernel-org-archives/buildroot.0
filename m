From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 May 2010 23:00:18 +0200
Subject: [Buildroot] [git commit master] valgrind: broken on ppc
Message-ID: <20100526210240.9E5AD12E244@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0346e90a8b611ecf62984eccf379a37262aeb7c6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Valgrind 3.2.3 needs linux/a.out.h, which hasn't been exported on ppc
since 2.6.28.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    2 +-
 package/valgrind/Config.in |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 67e20c8..354186a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -11,7 +11,7 @@
 	nbd, netsnmp, ntfsprogs, ntp, olsr, pango, pciutils, pcmanfm,
 	php, pkg-config, psmisc, qt, samba, shared-mime-info,
 	squashfs, squashfs3, sshfs, startup-notification, swfdec,
-	sylpheed, uemacs, util-linux, vpnc, webkit, xstroke
+	sylpheed, uemacs, util-linux, valgrind, vpnc, webkit, xstroke
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/valgrind/Config.in b/package/valgrind/Config.in
index d9113c9..db1bc3b 100644
--- a/package/valgrind/Config.in
+++ b/package/valgrind/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_VALGRIND
 	bool "valgrind"
-	depends on BR2_i386 || BR2_powerpc || BR2_x86_64
+	depends on BR2_i386 || BR2_x86_64
 	help
 	  Tool for debugging and profiling Linux programs.
 
-- 
1.6.3.3
