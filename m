From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 23 Nov 2009 13:03:59 +0100
Subject: [Buildroot] [git commit master] vice: mark as broken
Message-ID: <20091123120647.D7FA977782@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=87d74d94ccedc0724681e256573ba42cb9fa8593
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Dependencies are wrong, and it has never seen any updates, so it probably
doesn't have any users.

Will remove completely before 2010.02 unless someone fixes it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                      |    2 +-
 package/games/vice/Config.in |    2 ++
 package/games/vice/vice.mk   |    2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index ff911ff..f1cec36 100644
--- a/CHANGES
+++ b/CHANGES
@@ -32,7 +32,7 @@
 	tcpdump, u-boot, util-linux, valgrind, vsftpd, wipe, wpa-supplicant,
 	xdata_xcursor-themes, xstroke, zlib
 
-	Removed package: mdnsresponder, mpatrol, gcc 3.4.6 + 4.0.4
+	Removed package: mdnsresponder, mpatrol, gcc 3.4.6 + 4.0.4, vice
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/games/vice/Config.in b/package/games/vice/Config.in
index 48967e4..e4c5621 100644
--- a/package/games/vice/Config.in
+++ b/package/games/vice/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_VICE
 	bool "vice"
+	depends on BROKEN # doesn't build, wrong dependencies
+	# remove before 2010.02 release
 	help
 	  VICE is a Commodore emulator
 
diff --git a/package/games/vice/vice.mk b/package/games/vice/vice.mk
index b04b892..305809d 100644
--- a/package/games/vice/vice.mk
+++ b/package/games/vice/vice.mk
@@ -9,7 +9,7 @@ VICE_SITE = http://www.viceteam.org/online
 VICE_INSTALL_STAGING = NO
 VICE_INSTALL_TARGET = YES
 
-VICE_CONF_OPT = --without-resid --with-alsa CFLAGS="-O0"
+VICE_CONF_OPT = --without-resid --with-alsa
 
 $(eval $(call AUTOTARGETS,package/games,vice))
 
-- 
1.6.3.3
