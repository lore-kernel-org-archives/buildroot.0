From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 31 Jan 2016 08:38:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/mosh: Update upstream URLs after
	move to github.com
Message-ID: <1454225902-21407-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The project moved to github.com, our current download URL was broken:
http://mailman.mit.edu/pipermail/mosh-users/2015-July/000284.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mosh/Config.in | 2 +-
 package/mosh/mosh.hash | 4 ++--
 package/mosh/mosh.mk   | 5 +++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/mosh/Config.in b/package/mosh/Config.in
index 868b9ff..ab6eeb8 100644
--- a/package/mosh/Config.in
+++ b/package/mosh/Config.in
@@ -21,4 +21,4 @@ config BR2_PACKAGE_MOSH
 	  allows roaming, and provides speculative local echo and line editing
 	  of user keystrokes.
 
-	  https://mosh.mit.edu
+	  https://github.com/mobile-shell/mosh
diff --git a/package/mosh/mosh.hash b/package/mosh/mosh.hash
index ab925b5..b0a0906 100644
--- a/package/mosh/mosh.hash
+++ b/package/mosh/mosh.hash
@@ -1,2 +1,2 @@
-# From: http://mailman.mit.edu/pipermail/mosh-users/2015-July/000283.html
-sha256 1af809e5d747c333a852fbf7acdbf4d354dc4bbc2839e3afe5cf798190074be3 mosh-1.2.5.tar.gz
+# Locally computed
+sha256	35025d412046ee5199ebaa8d876131fc683dccedde18b3945b3bc3662bc9f373	mosh-mosh-1.2.5.tar.gz
diff --git a/package/mosh/mosh.mk b/package/mosh/mosh.mk
index f8c45e8..3967f41 100644
--- a/package/mosh/mosh.mk
+++ b/package/mosh/mosh.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-MOSH_VERSION = 1.2.5
-MOSH_SITE = https://mosh.mit.edu
+MOSH_VERSION = mosh-1.2.5
+MOSH_SITE = $(call github,mobile-shell,mosh,$(MOSH_VERSION))
 MOSH_DEPENDENCIES = zlib ncurses protobuf openssl host-pkgconf
 MOSH_LICENSE = GPLv3+ with exception
 MOSH_LICENSE_FILES = COPYING COPYING.iOS
+MOSH_AUTORECONF = YES
 
 # help the detection of the SSP support: mosh configure.ac doesn't do
 # a link test, so it doesn't detect when the toolchain doesn't have
-- 
2.7.0.rc3
