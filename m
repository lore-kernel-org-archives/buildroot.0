From: Alexander Dahl <post@lespocky.de>
Date: Sat,  8 May 2021 21:53:42 +0200
Subject: [Buildroot] [PATCH] package/putty: bump to version 0.75
Message-ID: <20210508195342.18415-1-post@lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream does not set -Werror in its build files anymore.  License file
just changed copyright years and holders.  PGP signatures of source
tarball and hashes were checked.

Link: https://www.chiark.greenend.org.uk/~sgtatham/putty/releases/0.75.html
Link: https://www.chiark.greenend.org.uk/~sgtatham/putty/changes.html
Signed-off-by: Alexander Dahl <post@lespocky.de>
---
 package/putty/putty.hash | 12 ++++++------
 package/putty/putty.mk   |  3 +--
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/putty/putty.hash b/package/putty/putty.hash
index 3885cef9b8..8974aaac5e 100644
--- a/package/putty/putty.hash
+++ b/package/putty/putty.hash
@@ -1,8 +1,8 @@
-# Hashes from: http://the.earth.li/~sgtatham/putty/0.74/{md5,sha1,sha256,sha512}sums
-md5  dbfa58f22a91b22b7489173e9dd09e30  putty-0.74.tar.gz
-sha1  17b160e9720f67f9af9399d7d185b913b81f18fe  putty-0.74.tar.gz
-sha256  ddd5d388e51dd9e6e294005b30037f6ae802239a44c9dc9808c779e6d11b847d  putty-0.74.tar.gz
-sha512  0da86849ea764cd88643bd2c1984ac7211ae72dd7c41232307b1960a29ca9518044b022d87c60272d6db71a3357026862a112bedb90ee732b41494fca3acde9b  putty-0.74.tar.gz
+# Hashes from: http://the.earth.li/~sgtatham/putty/0.75/{md5,sha1,sha256,sha512}sums
+md5  fae57a9ab209f303cc9e9f83eecaa27c  putty-0.75.tar.gz
+sha1  cdb976811a35eed67c5a2c588908b08edf6e3e1d  putty-0.75.tar.gz
+sha256  d3173b037eddbe9349abe978101277b4ba9f9959e25dedd44f87e7b85cc8f9f5  putty-0.75.tar.gz
+sha512  3dbc15485008a98daf60236061253e66b94a6e5da123fc84c5f0ac006c84e17c70fe748987677775e3b54a12297eb826cccf70a4fc039b633bc2d512938b3028  putty-0.75.tar.gz
 
 # Locally calculated
-sha256  92028b6d56212bd3e4ce6a36bd2e2454851dca7e8ffe4c6ab51385ca214ca322  LICENCE
+sha256  3f3e870dd3d0867d79370b1d433602c60bb91b59de04e5d8f2a149b788530d53  LICENCE
diff --git a/package/putty/putty.mk b/package/putty/putty.mk
index c40cac9dc5..1e5a89ea9f 100644
--- a/package/putty/putty.mk
+++ b/package/putty/putty.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-PUTTY_VERSION = 0.74
+PUTTY_VERSION = 0.75
 PUTTY_SITE = http://the.earth.li/~sgtatham/putty/$(PUTTY_VERSION)
 PUTTY_LICENSE = MIT
 PUTTY_LICENSE_FILES = LICENCE
 PUTTY_CPE_ID_VENDOR = putty
 PUTTY_CONF_OPTS = --disable-gtktest
-PUTTY_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -Wno-error"
 
 ifeq ($(BR2_PACKAGE_LIBGTK2),y)
 PUTTY_CONF_OPTS += --with-gtk=2

base-commit: dc5d9c98355f8c82192fe2cff1c8c9bfcea5b03d
-- 
2.20.1
