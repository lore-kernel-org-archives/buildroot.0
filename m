From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 May 2020 12:06:08 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/libarchive:
 remove double handling of zstd
Message-ID: <20200508143236.4201291051@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=54d0ae1bfef0d5930ad3a3b6158b4689947d029b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

When 4bcc34446485d27efd41de70a86355a0e3798838 was applied, it was not
noticed that 96dc6701af877a4aa4da20a9e0d5b849cc5c8356 (from another
contributor) had already been
applied. 4bcc34446485d27efd41de70a86355a0e3798838 essentially did the
same thing as 96dc6701af877a4aa4da20a9e0d5b849cc5c8356, except it also
disable zstd support explicitly in the host-libarchive package.

Let's drop the part of 4bcc34446485d27efd41de70a86355a0e3798838 that
duplicates 96dc6701af877a4aa4da20a9e0d5b849cc5c8356.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 37e853d63c88271d678fe8b36cb40d6bd76b02f0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libarchive/libarchive.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 99360eaf3c..ad0823e548 100644
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
