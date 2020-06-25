From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 25 Jun 2020 22:44:51 +0200
Subject: [Buildroot] [git commit] package/fwup: bump to v1.8.0
Message-ID: <20200625204758.E9FDE821F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=be9e9cb68b9b61ca76b936c6c1cfd6d50d4440d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The libsodium dependency is no longer needed so this patch also drops
that requirement from host and target builds.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
[yann.morin.1998 at free.fr: two spaces in hash file]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/fwup/Config.in | 1 -
 package/fwup/fwup.hash | 4 ++--
 package/fwup/fwup.mk   | 6 +++---
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/fwup/Config.in b/package/fwup/Config.in
index fd40cf3261..0e3c57d33d 100644
--- a/package/fwup/Config.in
+++ b/package/fwup/Config.in
@@ -6,7 +6,6 @@ config BR2_PACKAGE_FWUP
 	# required by libarchive to include zip compression
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_LIBCONFUSE
-	select BR2_PACKAGE_LIBSODIUM
 	help
 	  Fwup is a scriptable embedded Linux firmware update creator
 	  and runner.
diff --git a/package/fwup/fwup.hash b/package/fwup/fwup.hash
index 337883f9a8..87263192e4 100644
--- a/package/fwup/fwup.hash
+++ b/package/fwup/fwup.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 20302dc96cef88438034e15551e178bb0652c28d99aa7ca5260100cb3bebbc2a  fwup-1.2.5.tar.gz
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
+sha256  9890f0328796f4315e6c1188df5c103855c530fbc14fbc8c12f4b24066c975f1  fwup-1.8.0.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/fwup/fwup.mk b/package/fwup/fwup.mk
index e1e5467765..77eaa528f3 100644
--- a/package/fwup/fwup.mk
+++ b/package/fwup/fwup.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-FWUP_VERSION = 1.2.5
+FWUP_VERSION = 1.8.0
 FWUP_SITE = $(call github,fhunleth,fwup,v$(FWUP_VERSION))
 FWUP_LICENSE = Apache-2.0
 FWUP_LICENSE_FILES = LICENSE
-FWUP_DEPENDENCIES = host-pkgconf libconfuse libarchive libsodium
-HOST_FWUP_DEPENDENCIES = host-pkgconf host-libconfuse host-libarchive host-libsodium
+FWUP_DEPENDENCIES = host-pkgconf libconfuse libarchive
+HOST_FWUP_DEPENDENCIES = host-pkgconf host-libconfuse host-libarchive
 FWUP_AUTORECONF = YES
 FWUP_CONF_ENV = ac_cv_path_HELP2MAN=""
 
