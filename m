From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 20 Sep 2020 09:43:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/samba4: security bump version to
 4.11.13
Message-ID: <20200920074328.763948-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Version 4.11.11 fixed
o CVE-2020-10730: NULL pointer de-reference and use-after-free in Samba AD DC
		  LDAP Server with ASQ, VLV and paged_results.
o CVE-2020-10745: Parsing and packing of NBT and DNS packets can consume
		  excessive CPU
o CVE-2020-10760: LDAP Use-after-free in Samba AD DC Global Catalog with
		  paged_results and VLV.
o CVE-2020-14303: Empty UDP packet DoS in Samba AD DC nbtd.

Version 4.11.12 was a bugfix-only release.

Version 4.11.13 fixes CVE-2020-1472.

Release notes:
https://www.samba.org/samba/history/samba-4.11.11.html
https://www.samba.org/samba/history/samba-4.11.12.html
https://www.samba.org/samba/security/CVE-2020-1472.html

Rebased patches 0001 & 0002.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/samba4/0001-libreplace-disable-libbsd-support.patch  | 4 ++--
 ...uild-find-pre-built-heimdal-build-tools-in-case-of-.patch | 5 +++--
 package/samba4/samba4.hash                                   | 4 ++--
 package/samba4/samba4.mk                                     | 2 +-
 4 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/samba4/0001-libreplace-disable-libbsd-support.patch b/package/samba4/0001-libreplace-disable-libbsd-support.patch
index a303fa6669..79216860dd 100644
--- a/package/samba4/0001-libreplace-disable-libbsd-support.patch
+++ b/package/samba4/0001-libreplace-disable-libbsd-support.patch
@@ -9,7 +9,7 @@ This causes redefinition conflicts for link(2) when both standard
 unistd.h and bsd/unistd.h get included.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-[Bernd: rebased for versions 4.7.3, 4.8.0 & 4.8.5]
+[Bernd: rebased for versions 4.7.3, 4.8.0, 4.8.5 & 4.11.13]
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
  lib/replace/wscript | 15 ---------------
@@ -19,7 +19,7 @@ diff --git a/lib/replace/wscript b/lib/replace/wscript
 index 240d730cbee..c6d8df43c74 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
-@@ -381,21 +381,6 @@ def configure(conf):
+@@ -406,21 +406,6 @@ def configure(conf):
  
      strlcpy_in_bsd = False
  
diff --git a/package/samba4/0002-build-find-pre-built-heimdal-build-tools-in-case-of-.patch b/package/samba4/0002-build-find-pre-built-heimdal-build-tools-in-case-of-.patch
index 563b274d57..b8636958ee 100644
--- a/package/samba4/0002-build-find-pre-built-heimdal-build-tools-in-case-of-.patch
+++ b/package/samba4/0002-build-find-pre-built-heimdal-build-tools-in-case-of-.patch
@@ -33,6 +33,7 @@ BUG: https://bugzilla.samba.org/show_bug.cgi?id=14164
 
 Signed-off-by: Uri Simchoni <uri@samba.org>
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Bernd: rebased for version 4.11.13]
 ---
  wscript_configure_embedded_heimdal | 11 +++++++++++
  wscript_configure_system_heimdal   | 11 -----------
@@ -59,7 +60,7 @@ diff --git a/wscript_configure_system_heimdal b/wscript_configure_system_heimdal
 index 0ff6dad2f55..f77c177442f 100644
 --- a/wscript_configure_system_heimdal
 +++ b/wscript_configure_system_heimdal
-@@ -36,14 +36,6 @@ def check_system_heimdal_lib(name, functions='', headers='', onlyif=None):
+@@ -37,14 +37,6 @@ def check_system_heimdal_lib(name, functions='', headers='', onlyif=None):
      conf.define('USING_SYSTEM_%s' % name.upper(), 1)
      return True
  
@@ -74,7 +75,7 @@ index 0ff6dad2f55..f77c177442f 100644
  check_system_heimdal_lib("com_err", "com_right_r com_err", "com_err.h")
  
  if check_system_heimdal_lib("roken", "rk_socket_set_reuseaddr", "roken.h"):
-@@ -88,7 +88,4 @@
+@@ -96,7 +96,4 @@
  #if conf.CHECK_BUNDLED_SYSTEM('tommath', checkfunctions='mp_init', headers='tommath.h'):
  #    conf.define('USING_SYSTEM_TOMMATH', 1)
  
diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 34ae6f84bc..4d47871fc5 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.11.10.tar.asc
-sha256  4346ed80c90132a4117fe2dd3e846954f44f006f4d057de3a3544116364e012f  samba-4.11.10.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.11.13.tar.asc
+sha256  e71ed29ae01c5ce7be8cee1f53e0530db86dd19b911accb08fae60224e686ba1  samba-4.11.13.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index b6fe1a827c..48ac48c180 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.11.10
+SAMBA4_VERSION = 4.11.13
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.27.0
