From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 2 Apr 2020 21:56:32 +0200
Subject: [Buildroot] [git commit] package/libpjsip: bump version to 2.10
Message-ID: <20200402195008.3C42B81518@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dfbf7370dc65ced3797719c8d21efe7e0035057e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Other changes:
  - Change the site URL as the upstream project has migrated to Github

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpjsip/libpjsip.hash | 5 +----
 package/libpjsip/libpjsip.mk   | 8 +++++---
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/libpjsip/libpjsip.hash b/package/libpjsip/libpjsip.hash
index bcf46ea5fb..68c2208885 100644
--- a/package/libpjsip/libpjsip.hash
+++ b/package/libpjsip/libpjsip.hash
@@ -1,6 +1,3 @@
-# From https://www.pjsip.org/release/2.9/MD5SUM.TXT
-md5	66757078e7bd7cf316acb0425c2fdd6f  pjproject-2.9.tar.bz2
-
 # Locally computed
-sha256	d185ef7855c8ec07191dde92f54b65a7a4b7a6f7bf8c46f7af35ceeb1da2a636	pjproject-2.9.tar.bz2
+sha256	936a4c5b98601b52325463a397ddf11ab4106c6a7b04f8dc7cdd377efbb597de	pjproject-2.10.tar.gz
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 447f76be7f..f0956d11ae 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -4,9 +4,11 @@
 #
 ################################################################################
 
-LIBPJSIP_VERSION = 2.9
-LIBPJSIP_SOURCE = pjproject-$(LIBPJSIP_VERSION).tar.bz2
-LIBPJSIP_SITE = https://www.pjsip.org/release/$(LIBPJSIP_VERSION)
+LIBPJSIP_VERSION = 2.10
+LIBPJSIP_SOURCE = pjproject-$(LIBPJSIP_VERSION).tar.gz
+LIBPJSIP_SITE = $(call github,pjsip,pjproject,$(LIBPJSIP_VERSION))
+# https://github.com/pjsip/pjproject/archive/2.10.tar.gz
+
 LIBPJSIP_DEPENDENCIES = libsrtp
 LIBPJSIP_LICENSE = GPL-2.0+
 LIBPJSIP_LICENSE_FILES = COPYING
