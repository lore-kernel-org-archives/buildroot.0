From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 24 Jul 2017 22:06:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/kismet: bump version to 2016-07-R1
Message-ID: <20170724200655.32491-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changed _SITE from git clone to tarball provided by upstream.
Rebased patches 0003 & 0004.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
Partly tested by test-pkg using this defconfig

BR2_PACKAGE_KISMET=y
BR2_PACKAGE_KISMET_CLIENT=y
BR2_PACKAGE_KISMET_DRONE=y
BR2_PACKAGE_KISMET_SERVER=y

                armv5-ctng-linux-gnueabi [ 1/47]: OK
              armv7-ctng-linux-gnueabihf [ 2/47]: OK
                        br-aarch64-glibc [ 3/47]: OK
                           br-arcle-hs38 [ 4/47]: OK
                            br-arm-basic [ 5/47]: SKIPPED
                  br-arm-cortex-a9-glibc [ 6/47]: OK
                   br-arm-cortex-a9-musl [ 7/47]: OK
                   br-arm-cortex-m4-full [ 8/47]: SKIPPED
                             br-arm-full [ 9/47]: OK
                    br-arm-full-nothread [10/47]: SKIPPED
                      br-arm-full-static [11/47]: SKIPPED
                            br-bfin-full [12/47]: SKIPPED
                   br-i386-pentium4-full [13/47]: OK
                br-i386-pentium-mmx-musl [14/47]: OK
                       br-m68k-5208-full [15/47]: SKIPPED
                      br-m68k-68040-full [16/47]: OK
                    br-microblazeel-full [17/47]: OK
                 br-mips32r6-el-hf-glibc [18/47]: OK
                      br-mips64-n64-full [19/47]: OK
                 br-mips64r6-el-hf-glibc [20/47]: OK
                      br-mipsel-o32-full [21/47]: OK
                          br-nios2-glibc [22/47]: OK
                      br-openrisc-uclibc [23/47]: OK
               br-powerpc-603e-basic-cpp [24/47]: OK
             br-powerpc64le-power8-glibc [25/47]: OK
               br-powerpc64-power7-glibc [26/47]: OK
                  br-powerpc-e500mc-full [27/47]: OK
                             br-sh4-full [28/47]: OK
                        br-sparc64-glibc [29/47]: OK
                         br-sparc-uclibc [30/47]: OK


 package/kismet/0003-fix-curses-libs-ordering.patch | 8 +++++---
 package/kismet/0004-no-include-host-paths.patch    | 6 ++++--
 package/kismet/kismet.hash                         | 2 +-
 package/kismet/kismet.mk                           | 6 +++---
 4 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/package/kismet/0003-fix-curses-libs-ordering.patch b/package/kismet/0003-fix-curses-libs-ordering.patch
index b579c96d4..8d2b91140 100644
--- a/package/kismet/0003-fix-curses-libs-ordering.patch
+++ b/package/kismet/0003-fix-curses-libs-ordering.patch
@@ -14,10 +14,12 @@ at the *front* of the list, not at the end.
 Reported-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+[bernd.kuhls at t-online.de: update for 2016-07-R1]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 
 diff -durN kismet-Kismet-2014-02-R1.orig/configure.in kismet-Kismet-2014-02-R1/configure.in
---- kismet-Kismet-2014-02-R1.orig/configure.in	2014-02-19 05:37:43.000000000 +0100
-+++ kismet-Kismet-2014-02-R1/configure.in	2014-12-26 16:46:55.770692349 +0100
+--- kismet-Kismet-2014-02-R1.orig/configure.ac	2014-02-19 05:37:43.000000000 +0100
++++ kismet-Kismet-2014-02-R1/configure.ac	2014-12-26 16:46:55.770692349 +0100
 @@ -437,10 +434,10 @@
  		AC_MSG_ERROR(Failed to find curses.h or ncurses.h.  You probably need to install the curses-devel package from your distribution)
  	fi
@@ -25,7 +27,7 @@ diff -durN kismet-Kismet-2014-02-R1.orig/configure.in kismet-Kismet-2014-02-R1/c
 -	LIBS="$LIBS $curseaux"
 +	LIBS="$curseaux $LIBS"
  	AC_CHECK_LIB([panel], [new_panel],
- 				 AC_DEFINE(HAVE_LIBPANEL, 1, Panel terminal lib) 
+ 				 AC_DEFINE(HAVE_LIBPANEL, 1, Panel terminal lib)
 -				 curseaux="$curseaux -lpanel",
 +				 curseaux="-lpanel $curseaux",
  				 AC_MSG_ERROR(Failed to find libpanel extension to curses/ncurses.  Install it, or disable building the Kismet client with --disable-client.  Disabling the client is probably not something you want to do normally.))
diff --git a/package/kismet/0004-no-include-host-paths.patch b/package/kismet/0004-no-include-host-paths.patch
index 1dcf1200f..6819bf425 100644
--- a/package/kismet/0004-no-include-host-paths.patch
+++ b/package/kismet/0004-no-include-host-paths.patch
@@ -7,10 +7,12 @@ Remove that directory from the include search dirs.
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+[bernd.kuhls at t-online.de: update for 2016-07-R1]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 
 diff -durN kismet-Kismet-2014-02-R1.orig/configure.in kismet-Kismet-2014-02-R1/configure.in
---- kismet-Kismet-2014-02-R1.orig/configure.in	2014-02-19 05:37:43.000000000 +0100
-+++ kismet-Kismet-2014-02-R1/configure.in	2014-12-26 16:46:55.770692349 +0100
+--- kismet-Kismet-2014-02-R1.orig/configure.ac	2014-02-19 05:37:43.000000000 +0100
++++ kismet-Kismet-2014-02-R1/configure.ac	2014-12-26 16:46:55.770692349 +0100
 @@ -406,9 +406,6 @@
  )
  AC_SUBST(wantclient)
diff --git a/package/kismet/kismet.hash b/package/kismet/kismet.hash
index e4dc5a481..913dffc9d 100644
--- a/package/kismet/kismet.hash
+++ b/package/kismet/kismet.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 23b693baa29549b051e95e9d597b115bd94f7267c4677307ebd87f2a00e5a52b kismet-Kismet-2014-02-R1.tar.gz
+sha256 bdb21f153311f1ff3b16621bf0d6740f66369bf0982b0a289c9a12af8847e237  kismet-2016-07-R1.tar.xz
diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index 8abf712c0..cee814b52 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-KISMET_VERSION = Kismet-2014-02-R1
-KISMET_SITE = http://www.kismetwireless.net/kismet.git
-KISMET_SITE_METHOD = git
+KISMET_VERSION = 2016-07-R1
+KISMET_SOURCE = kismet-$(KISMET_VERSION).tar.xz
+KISMET_SITE = http://www.kismetwireless.net/code
 KISMET_DEPENDENCIES = host-pkgconf libpcap ncurses libnl
 KISMET_CONF_OPTS += --with-netlink-version=3
 KISMET_LICENSE = GPL-2.0+
-- 
2.11.0
