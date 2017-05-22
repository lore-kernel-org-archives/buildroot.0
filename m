From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 May 2017 16:00:49 +0200
Subject: [Buildroot] [git commit branch/next] package/augeas: bump version
	to 1.8.0
Message-ID: <20170522140057.A9F9D82756@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa73c012186a05ad443863137f95f94fb642c4b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Removed AUGEAS_PATCH, patch is included in version bump.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/augeas/augeas.hash | 3 +--
 package/augeas/augeas.mk   | 5 +----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/augeas/augeas.hash b/package/augeas/augeas.hash
index 04fbcba..797bddb 100644
--- a/package/augeas/augeas.hash
+++ b/package/augeas/augeas.hash
@@ -1,3 +1,2 @@
 # Locally calculated
-sha256  b9315575d07f7ba28ca2f9f60b4987dfe77b5970c98b59dc6ca7873fc4979763  augeas-1.7.0.tar.gz
-sha256  12a987e78166032b59d816aced96c97813cb109108e7c2336cb8ae369c32e2bf  05a27f4e374e9f0dc2cda6301b52d2a6b109b2e8.patch
+sha256  515ce904138d99ff51d45ba7ed0d809bdee6c42d3bc538c8c820e010392d4cc5  augeas-1.8.0.tar.gz
diff --git a/package/augeas/augeas.mk b/package/augeas/augeas.mk
index 4c855a3..1c1461e 100644
--- a/package/augeas/augeas.mk
+++ b/package/augeas/augeas.mk
@@ -4,16 +4,13 @@
 #
 ################################################################################
 
-AUGEAS_VERSION = 1.7.0
+AUGEAS_VERSION = 1.8.0
 AUGEAS_SITE = http://download.augeas.net
 AUGEAS_INSTALL_STAGING = YES
 AUGEAS_LICENSE = LGPL-2.1+
 AUGEAS_LICENSE_FILES = COPYING
 AUGEAS_DEPENDENCIES = host-pkgconf readline libxml2
 
-# Fetch upstream patch to fix static linking
-AUGEAS_PATCH = https://github.com/hercules-team/augeas/commit/05a27f4e374e9f0dc2cda6301b52d2a6b109b2e8.patch
-
 AUGEAS_CONF_OPTS = --disable-gnulib-tests
 
 # Remove the test lenses which occupy about 1.4 MB on the target
