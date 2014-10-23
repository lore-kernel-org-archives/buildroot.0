From: Karoly Kasza <kaszak@gmail.com>
Date: Thu, 23 Oct 2014 16:48:27 +0200
Subject: [Buildroot] [PATCH 01/11] package/*: move download URLs to
	snapshot.debian.org
In-Reply-To: <1414075717-7333-1-git-send-email-kaszak@gmail.com>
References: <1414075717-7333-1-git-send-email-kaszak@gmail.com>
Message-ID: <1414075717-7333-2-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---
 package/at/at.mk                         |    2 +-
 package/cvs/cvs.mk                       |    4 ++--
 package/dash/dash.mk                     |    2 +-
 package/input-tools/input-tools.mk       |    2 +-
 package/liblockfile/liblockfile.mk       |    2 +-
 package/lockfile-progs/lockfile-progs.mk |    2 +-
 package/memstat/memstat.mk               |    2 +-
 package/mii-diag/mii-diag.mk             |    2 +-
 package/rsh-redone/rsh-redone.mk         |    2 +-
 package/sredird/sredird.mk               |    2 +-
 package/sysvinit/sysvinit.mk             |    4 ++--
 package/thttpd/thttpd.mk                 |    2 +-
 package/usbmount/usbmount.mk             |    2 +-
 package/whois/whois.mk                   |    2 +-
 14 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/package/at/at.mk b/package/at/at.mk
index 93ff08b..efce57e 100644
--- a/package/at/at.mk
+++ b/package/at/at.mk
@@ -6,7 +6,7 @@
 
 AT_VERSION = 3.1.13
 AT_SOURCE = at_$(AT_VERSION).orig.tar.gz
-AT_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/a/at
+AT_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/a/at
 # missing deps for parsetime.l
 AT_MAKE = $(MAKE1)
 AT_AUTORECONF = YES
diff --git a/package/cvs/cvs.mk b/package/cvs/cvs.mk
index f1a63c8..f453286 100644
--- a/package/cvs/cvs.mk
+++ b/package/cvs/cvs.mk
@@ -6,8 +6,8 @@
 
 CVS_VERSION = 1.12.13
 CVS_SOURCE = cvs_$(CVS_VERSION).orig.tar.gz
-CVS_PATCH = cvs_$(CVS_VERSION)-12.diff.gz
-CVS_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/c/cvs
+CVS_PATCH = cvs_$(CVS_VERSION)-12+squeeze1.diff.gz
+CVS_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/c/cvs
 CVS_DEPENDENCIES = ncurses
 
 CVS_CONF_ENV = cvs_cv_func_printf_ptr=yes
diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index 656748c..ed8525c 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -6,7 +6,7 @@
 
 DASH_VERSION = 0.5.8
 DASH_SOURCE = dash_$(DASH_VERSION).orig.tar.gz
-DASH_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/d/dash
+DASH_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/d/dash
 DASH_PATCH = dash_$(DASH_VERSION)-1.diff.gz
 DASH_LICENSE = BSD-3c, GPLv2+ (mksignames.c)
 DASH_LICENSE_FILES = COPYING
diff --git a/package/input-tools/input-tools.mk b/package/input-tools/input-tools.mk
index e7b1561..db1c3b6 100644
--- a/package/input-tools/input-tools.mk
+++ b/package/input-tools/input-tools.mk
@@ -7,7 +7,7 @@
 INPUT_TOOLS_VERSION = 20051019
 INPUT_TOOLS_SOURCE = joystick_$(INPUT_TOOLS_VERSION).orig.tar.gz
 INPUT_TOOLS_PATCH = joystick_$(INPUT_TOOLS_VERSION)-5.diff.gz
-INPUT_TOOLS_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/j/joystick
+INPUT_TOOLS_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/j/joystick
 INPUT_TOOLS_LICENSE = GPLv2+
 INPUT_TOOLS_LICENSE_FILES = utils/Makefile
 
diff --git a/package/liblockfile/liblockfile.mk b/package/liblockfile/liblockfile.mk
index 83dc21b..4f7a67e 100644
--- a/package/liblockfile/liblockfile.mk
+++ b/package/liblockfile/liblockfile.mk
@@ -6,7 +6,7 @@
 
 LIBLOCKFILE_VERSION = 1.08
 LIBLOCKFILE_SOURCE = liblockfile_$(LIBLOCKFILE_VERSION).orig.tar.gz
-LIBLOCKFILE_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/libl/liblockfile
+LIBLOCKFILE_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/libl/liblockfile
 LIBLOCKFILE_PATCH = liblockfile_$(LIBLOCKFILE_VERSION)-4.debian.tar.bz2
 
 LIBLOCKFILE_LICENSE = LGPLv2+, dotlockfile GPLv2+
diff --git a/package/lockfile-progs/lockfile-progs.mk b/package/lockfile-progs/lockfile-progs.mk
index fbe1080..e2e0a44 100644
--- a/package/lockfile-progs/lockfile-progs.mk
+++ b/package/lockfile-progs/lockfile-progs.mk
@@ -6,7 +6,7 @@
 
 LOCKFILE_PROGS_VERSION = 0.1.17
 LOCKFILE_PROGS_SOURCE = lockfile-progs_$(LOCKFILE_PROGS_VERSION).tar.gz
-LOCKFILE_PROGS_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/l/lockfile-progs
+LOCKFILE_PROGS_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/l/lockfile-progs
 LOCKFILE_PROGS_DEPENDENCIES = liblockfile
 LOCKFILE_PROGS_LICENSE = GPLv2
 LOCKFILE_PROGS_LICENSE_FILES = COPYING
diff --git a/package/memstat/memstat.mk b/package/memstat/memstat.mk
index 5e96405..074e985 100644
--- a/package/memstat/memstat.mk
+++ b/package/memstat/memstat.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MEMSTAT_VERSION = 0.8
-MEMSTAT_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/m/memstat
+MEMSTAT_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/m/memstat
 MEMSTAT_SOURCE = memstat_$(MEMSTAT_VERSION).tar.gz
 MEMSTAT_LICENSE = GPL
 MEMSTAT_LICENSE_FILES = debian/copyright
diff --git a/package/mii-diag/mii-diag.mk b/package/mii-diag/mii-diag.mk
index af2d8776..e0e0110 100644
--- a/package/mii-diag/mii-diag.mk
+++ b/package/mii-diag/mii-diag.mk
@@ -7,7 +7,7 @@
 MII_DIAG_VERSION = 2.11
 MII_DIAG_SOURCE = mii-diag_$(MII_DIAG_VERSION).orig.tar.gz
 MII_DIAG_PATCH = mii-diag_$(MII_DIAG_VERSION)-3.diff.gz
-MII_DIAG_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/m/mii-diag
+MII_DIAG_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/m/mii-diag
 MII_DIAG_LICENSE = GPL # No version specified
 MII_DIAG_LICENSE_FILES = mii-diag.c
 
diff --git a/package/rsh-redone/rsh-redone.mk b/package/rsh-redone/rsh-redone.mk
index 9c8a39d..a62c2df 100644
--- a/package/rsh-redone/rsh-redone.mk
+++ b/package/rsh-redone/rsh-redone.mk
@@ -6,7 +6,7 @@
 
 RSH_REDONE_VERSION = 85
 RSH_REDONE_SOURCE = rsh-redone_$(RSH_REDONE_VERSION).orig.tar.gz
-RSH_REDONE_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/r/rsh-redone
+RSH_REDONE_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/r/rsh-redone
 RSH_REDONE_LICENSE = GPLv2
 RSH_REDONE_LICENSE_FILES = rsh.c
 
diff --git a/package/sredird/sredird.mk b/package/sredird/sredird.mk
index 0a0f398..ebd7122 100644
--- a/package/sredird/sredird.mk
+++ b/package/sredird/sredird.mk
@@ -6,7 +6,7 @@
 
 SREDIRD_VERSION = 2.2.1-1.1
 SREDIRD_SOURCE = sredird_$(SREDIRD_VERSION).tar.gz
-SREDIRD_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/s/sredird
+SREDIRD_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/s/sredird
 SREDIRD_LICENSE = GPLv2+
 SREDIRD_LICENSE_FILES = COPYING
 
diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index d588122..49d85c4 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -6,8 +6,8 @@
 
 SYSVINIT_VERSION = 2.88
 SYSVINIT_SOURCE = sysvinit_$(SYSVINIT_VERSION)dsf.orig.tar.gz
-SYSVINIT_PATCH = sysvinit_$(SYSVINIT_VERSION)dsf-13.1.diff.gz
-SYSVINIT_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/s/sysvinit
+SYSVINIT_PATCH = sysvinit_$(SYSVINIT_VERSION)dsf-13.1+squeeze1.diff.gz
+SYSVINIT_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/s/sysvinit
 SYSVINIT_LICENSE = GPLv2+
 SYSVINIT_LICENSE_FILES = COPYING
 
diff --git a/package/thttpd/thttpd.mk b/package/thttpd/thttpd.mk
index a621ae0..47838ef 100644
--- a/package/thttpd/thttpd.mk
+++ b/package/thttpd/thttpd.mk
@@ -7,7 +7,7 @@
 THTTPD_VERSION = 2.25b
 THTTPD_SOURCE = thttpd_$(THTTPD_VERSION).orig.tar.gz
 THTTPD_PATCH = thttpd_$(THTTPD_VERSION)-11.diff.gz
-THTTPD_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/t/thttpd
+THTTPD_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/t/thttpd
 THTTPD_LICENSE = BSD-2c
 THTTPD_LICENSE_FILES = thttpd.c
 
diff --git a/package/usbmount/usbmount.mk b/package/usbmount/usbmount.mk
index ca165fa..cc25e4b 100644
--- a/package/usbmount/usbmount.mk
+++ b/package/usbmount/usbmount.mk
@@ -6,7 +6,7 @@
 
 USBMOUNT_VERSION = 0.0.22
 USBMOUNT_SOURCE = usbmount_$(USBMOUNT_VERSION).tar.gz
-USBMOUNT_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/u/usbmount
+USBMOUNT_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/u/usbmount
 USBMOUNT_DEPENDENCIES = udev lockfile-progs
 USBMOUNT_LICENSE = BSD-2c
 USBMOUNT_LICENSE_FILES = debian/copyright
diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index 193aafe..13c0230 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 WHOIS_VERSION = 5.2.1
-WHOIS_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/w/whois
+WHOIS_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/w/whois
 WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
 # take precedence over busybox implementation
 WHOIS_DEPENDENCIES = host-gettext $(if $(BR2_PACKAGE_BUSYBOX),busybox)
-- 
1.7.10.4
