From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 27 Jul 2010 10:02:06 +0200
Subject: [Buildroot] [git commit master 1/1] at: fix configure cache issue
	with flex
Message-ID: <20100727200331.5B3B7826B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c43f21339e9417b5f6939e04e02089b445581102
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make sure flex is built before at if enabled, so it correctly detects
it and doesn't populate tgt-config.cache with invalid values.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES          |    2 +-
 package/at/at.mk |    2 ++
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 5aa39fb..2d3d32b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -18,7 +18,7 @@
 	New packages: cgilua, copas, coxpcall, ffmpeg, libsvgtiny,
 	luafilesystem, luasocket, rings, wsapi, xavante, xterm
 
-	Updated/fixed packages: alsa-lib, alsamixergui, avahi,
+	Updated/fixed packages: alsa-lib, alsamixergui, at, avahi,
 	berkeleydb, bash, blackbox, busybox, bzip2, cdrkit, cmake,
 	dash, dhcp, dialog, diffutils, distcc, dmalloc, dnsmasq,
 	dropbear, e2fsprogs, fbv, file, flex, fontconfig, gawk, gmpc,
diff --git a/package/at/at.mk b/package/at/at.mk
index 3eb99a4..57b7847 100644
--- a/package/at/at.mk
+++ b/package/at/at.mk
@@ -12,6 +12,8 @@ AT_INSTALL_TARGET = YES
 # no install-strip / install-exec
 AT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
+AT_DEPENDENCIES = $(if $(BR2_PACKAGE_FLEX),flex)
+
 AT_CONF_OPT = \
         --with-jobdir=/var/spool/cron/atjobs \
         --with-atspool=/var/spool/cron/atspool \
-- 
1.7.1
