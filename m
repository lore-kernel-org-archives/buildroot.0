From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Jun 2018 22:46:17 +0200
Subject: [Buildroot] [git commit] libgit2: bump version to 0.27.1
Message-ID: <20180604205102.EE2858399A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d1e383d365c0eeb327312823e67c3c2ae92e0e8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes a security vulnerability similar to git's CVE-2018-11235

This release changes some configuration options, so tweak them
accordingly.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libgit2/libgit2.hash | 2 +-
 package/libgit2/libgit2.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index cc09af3627..43d8f9930e 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	6a62393e0ceb37d02fe0d5707713f504e7acac9006ef33da1e88960bd78b6eac  libgit2-v0.26.0.tar.gz
+sha256	837b11927bc5f64e7f9ab0376f57cfe3ca5aa52ffd2007ac41184b21124fb086  libgit2-v0.27.1.tar.gz
 sha256	d9a8038088df84fde493fa33a0f1e537252eeb9642122aa4b862690197152813  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index fcace39290..8b7b9f6d77 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = v0.26.0
+LIBGIT2_VERSION = v0.27.1
 LIBGIT2_SITE = $(call github,libgit2,libgit2,$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = GPL-2.0 with linking exception
 LIBGIT2_LICENSE_FILES = COPYING
@@ -36,9 +36,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBGIT2_DEPENDENCIES += openssl
-LIBGIT2_CONF_OPTS += -DUSE_OPENSSL=ON
+LIBGIT2_CONF_OPTS += -DUSE_HTTPS=OpenSSL
 else
-LIBGIT2_CONF_OPTS += -DUSE_OPENSSL=OFF
+LIBGIT2_CONF_OPTS += -DUSE_HTTPS=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
