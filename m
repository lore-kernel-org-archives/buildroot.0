From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Jul 2015 22:38:29 +0200
Subject: [Buildroot] [PATCH 03/12] libass: Bump version and change site
In-Reply-To: <1437943118-18060-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1437943118-18060-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1437943118-18060-4-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Google Code is a closing forge, libass has already made the move to Github.

Since a new release was available a bump was also in order.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/libass/libass.hash | 4 ++--
 package/libass/libass.mk   | 6 ++++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/libass/libass.hash b/package/libass/libass.hash
index b7510de..f300166 100644
--- a/package/libass/libass.hash
+++ b/package/libass/libass.hash
@@ -1,2 +1,2 @@
-# From https://code.google.com/p/libass/downloads/detail?name=libass-0.10.2.tar.xz&can=2&q=
-sha1 72a153364e838d3b561bae3653f1515169d479c4 libass-0.10.2.tar.xz
+# Locally computed
+sha256 a67c54ebaf5ec19ae72e86259ee6ab6adfe2e64ed9f9149db03dc863360ea38c  libass-0.12.3.tar.xz
diff --git a/package/libass/libass.mk b/package/libass/libass.mk
index 056ea8b..ed604b8 100644
--- a/package/libass/libass.mk
+++ b/package/libass/libass.mk
@@ -4,9 +4,11 @@
 #
 ################################################################################
 
-LIBASS_VERSION = 0.10.2
+LIBASS_VERSION = 0.12.3
 LIBASS_SOURCE = libass-$(LIBASS_VERSION).tar.xz
-LIBASS_SITE = http://libass.googlecode.com/files
+# Do not use the github helper here, the generated tarball is *NOT* the same
+# # as the one uploaded by upstream for the release.
+LIBASS_SITE = https://github.com/libass/libass/releases/download/$(LIBASS_VERSION)
 LIBASS_INSTALL_STAGING = YES
 LIBASS_LICENSE = ISC
 LIBASS_LICENSE_FILES = COPYING
-- 
2.1.4
