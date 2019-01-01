From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  1 Jan 2019 15:37:02 +0100
Subject: [Buildroot] [PATCH 4/4] package/opus-tools: bump to version 0.2
In-Reply-To: <20190101143702.2736-1-thomas.petazzoni@bootlin.com>
References: <20190101143702.2736-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190101143702.2736-4-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In this release the Opus decoder opusdec has been converted to use the
opusfile library, and the Opus encoder opusenc has been converted to
use the libopusenc library. These libraries make it easy to robustly
read and write Ogg Opus audio files, and enable some new features.

Due to this, opus-tools now needs to depend on opusfile and
libopusenc. We take this opportunity to reorder alphabetically the
dependencies in Config.in and .mk files.

The license file hash has changed for two reasons:

 - The xiph.org URL was changed from http:// to https://
 - White-space changes

There are no other changes, and no change that affect the licensing
conditions.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/opus-tools/Config.in       | 4 +++-
 package/opus-tools/opus-tools.hash | 4 ++--
 package/opus-tools/opus-tools.mk   | 4 ++--
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/opus-tools/Config.in b/package/opus-tools/Config.in
index 2552d19515..c045239ea7 100644
--- a/package/opus-tools/Config.in
+++ b/package/opus-tools/Config.in
@@ -1,7 +1,9 @@
 config BR2_PACKAGE_OPUS_TOOLS
 	bool "opus-tools"
-	select BR2_PACKAGE_OPUS
 	select BR2_PACKAGE_LIBOGG
+	select BR2_PACKAGE_LIBOPUSENC
+	select BR2_PACKAGE_OPUS
+	select BR2_PACKAGE_OPUSFILE
 	help
 	  Opus codec command line tools. This package provides the
 	  reference implementations of encoder and decoder utilities
diff --git a/package/opus-tools/opus-tools.hash b/package/opus-tools/opus-tools.hash
index c7759e559f..1b87458f53 100644
--- a/package/opus-tools/opus-tools.hash
+++ b/package/opus-tools/opus-tools.hash
@@ -1,5 +1,5 @@
 # From http://downloads.xiph.org/releases/opus/SHA256SUMS.txt
-sha256 a2357532d19471b70666e0e0ec17d514246d8b3cb2eb168f68bb0f6fd372b28c  opus-tools-0.1.10.tar.gz
+sha256 b4e56cb00d3e509acfba9a9b627ffd8273b876b4e2408642259f6da28fa0ff86  opus-tools-0.2.tar.gz
 
 # Hash for license file
-sha256 88021117568c64038175d7fb3b8286056f7cdb54f09dc806578f6bd9342c62cc  COPYING
+sha256 c28016e58544119d6b93aea28297d040f17dcef7a9f548d3e6a4d0b558c5d248  COPYING
diff --git a/package/opus-tools/opus-tools.mk b/package/opus-tools/opus-tools.mk
index ab00ced705..f69c3bef8b 100644
--- a/package/opus-tools/opus-tools.mk
+++ b/package/opus-tools/opus-tools.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-OPUS_TOOLS_VERSION = 0.1.10
+OPUS_TOOLS_VERSION = 0.2
 OPUS_TOOLS_SITE = https://downloads.xiph.org/releases/opus
 OPUS_TOOLS_LICENSE = BSD-2-Clause, GPL-2.0 (opusinfo)
 OPUS_TOOLS_LICENSE_FILES = COPYING
 OPUS_TOOLS_CONF_OPTS = --disable-oggtest --disable-opustest
-OPUS_TOOLS_DEPENDENCIES = opus libogg host-pkgconf
+OPUS_TOOLS_DEPENDENCIES = libogg libopusenc opus opusfile host-pkgconf
 
 ifeq ($(BR2_PACKAGE_LIBPCAP),y)
 OPUS_TOOLS_DEPENDENCIES += libpcap
-- 
2.20.1
