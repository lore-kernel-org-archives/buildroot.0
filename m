From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 21:23:29 +0200
Subject: [Buildroot] [git commit] package/libarchive: remove double handling
 of zstd
Message-ID: <20200425191033.D513390053@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=37e853d63c88271d678fe8b36cb40d6bd76b02f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When 4bcc34446485d27efd41de70a86355a0e3798838 was applied, it was not
noticed that 96dc6701af877a4aa4da20a9e0d5b849cc5c8356 (from another
contributor) had already been
applied. 4bcc34446485d27efd41de70a86355a0e3798838 essentially did the
same thing as 96dc6701af877a4aa4da20a9e0d5b849cc5c8356, except it also
disable zstd support explicitly in the host-libarchive package.

Let's drop the part of 4bcc34446485d27efd41de70a86355a0e3798838 that
duplicates 96dc6701af877a4aa4da20a9e0d5b849cc5c8356.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libarchive/libarchive.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 516d929763..89eeffe92e 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -111,13 +111,6 @@ else
 LIBARCHIVE_CONF_OPTS += --without-zlib
 endif
 
-ifeq ($(BR2_PACKAGE_ZSTD),y)
-LIBARCHIVE_CONF_OPTS += --with-zstd
-LIBARCHIVE_DEPENDENCIES += zstd
-else
-LIBARCHIVE_CONF_OPTS += --without-zstd
-endif
-
 # libarchive requires LZMA with thread support in the toolchain
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)$(BR2_PACKAGE_XZ),yy)
 LIBARCHIVE_DEPENDENCIES += xz
