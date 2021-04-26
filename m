From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 26 Apr 2021 12:10:21 +0200
Subject: [Buildroot] [PATCH 2/2] package/{glibc, localedef}: bump to version
 2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c
In-Reply-To: <20210426101021.2418145-1-romain.naour@gmail.com>
References: <20210426101021.2418145-1-romain.naour@gmail.com>
Message-ID: <20210426101021.2418145-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See:
https://sourceware.org/pipermail/libc-alpha/2021-February/122207.html
https://sourceware.org/glibc/wiki/Release/2.33

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
Tested with all Qemu defconfigs.
---
 .../glibc.hash                                                  | 2 +-
 package/glibc/glibc.mk                                          | 2 +-
 .../0001-HACK-only-build-and-install-localedef.patch            | 0
 ...02-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch | 0
 .../localedef.hash                                              | 2 +-
 package/localedef/localedef.mk                                  | 2 +-
 6 files changed, 4 insertions(+), 4 deletions(-)
 rename package/glibc/{2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2 => 2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c}/glibc.hash (70%)
 rename package/localedef/{2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2 => 2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c}/0001-HACK-only-build-and-install-localedef.patch (100%)
 rename package/localedef/{2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2 => 2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c}/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch (100%)
 rename package/localedef/{2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2 => 2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c}/localedef.hash (70%)

diff --git a/package/glibc/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/glibc.hash b/package/glibc/2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c/glibc.hash
similarity index 70%
rename from package/glibc/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/glibc.hash
rename to package/glibc/2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c/glibc.hash
index b1d5243fcc..3f3598c31a 100644
--- a/package/glibc/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/glibc.hash
+++ b/package/glibc/2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  f4710e9a435a7b83e1d23dd75434f0d36b898eba9b4249c946c32b467d852fd4  glibc-2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2.tar.gz
+sha256  ec2d7b91c8bbe7887b0bb34ab2df9007b2b45c17b502fc333efca28eb7546df6  glibc-2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index f84f670fc0..e94df73bfe 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -16,7 +16,7 @@ ifeq ($(BR2_RISCV_32),y)
 # Until 2.33 is released, just use master
 GLIBC_VERSION = 2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99
 else
-GLIBC_VERSION = 2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2
+GLIBC_VERSION = 2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c
 endif
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
diff --git a/package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/0001-HACK-only-build-and-install-localedef.patch b/package/localedef/2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c/0001-HACK-only-build-and-install-localedef.patch
similarity index 100%
rename from package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/0001-HACK-only-build-and-install-localedef.patch
rename to package/localedef/2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c/0001-HACK-only-build-and-install-localedef.patch
diff --git a/package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch b/package/localedef/2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
similarity index 100%
rename from package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
rename to package/localedef/2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
diff --git a/package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/localedef.hash b/package/localedef/2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c/localedef.hash
similarity index 70%
rename from package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/localedef.hash
rename to package/localedef/2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c/localedef.hash
index b1d5243fcc..3f3598c31a 100644
--- a/package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/localedef.hash
+++ b/package/localedef/2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c/localedef.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  f4710e9a435a7b83e1d23dd75434f0d36b898eba9b4249c946c32b467d852fd4  glibc-2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2.tar.gz
+sha256  ec2d7b91c8bbe7887b0bb34ab2df9007b2b45c17b502fc333efca28eb7546df6  glibc-2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 57ab5a3458..a633855baf 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2
+LOCALEDEF_VERSION = 2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
 HOST_LOCALEDEF_DL_SUBDIR = glibc
-- 
2.30.2
