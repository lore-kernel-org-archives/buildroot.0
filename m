From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Jul 2018 09:22:36 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] package/file: bump
 version to 5.33
Message-ID: <20180717072800.149E488706@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d5e66d1bf3b76354a3a8c88a5a0aaa9d510d263f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

Added license hashes, added optional dependency to libseccomp provided
by upstream in this version bump.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit eacca09a8a219fdcd94f39ccab329a4d6a63092b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/file/file.hash | 5 ++++-
 package/file/file.mk   | 9 ++++++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/package/file/file.hash b/package/file/file.hash
index fee516c8e2..a6b40be349 100644
--- a/package/file/file.hash
+++ b/package/file/file.hash
@@ -1,2 +1,5 @@
 # Locally calculated
-sha256 8639dc4d1b21e232285cd483604afc4a6ee810710e00e579dbe9591681722b50  file-5.32.tar.gz
+sha256 1c52c8c3d271cd898d5511c36a68059cda94036111ab293f01f83c3525b737c6  file-5.33.tar.gz
+sha256 3c0ad13c36f891a9b4f951e59eb2fc108065a46f849697cc6fd3cdb41cc23a3d  COPYING
+sha256 d98ee4d8d95e7d021a5dfc41f137ecc3b624a7b98e8bd793130202d12a21ed57  src/mygetopt.h
+sha256 85e358d575ad4ac5b38b623a25b24246ccff3c7e680d930c0a9ff5228fe434b6  src/vasprintf.c
diff --git a/package/file/file.mk b/package/file/file.mk
index df0e0f0eb9..422e29b1ce 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FILE_VERSION = 5.32
+FILE_VERSION = 5.33
 FILE_SITE = ftp://ftp.astron.com/pub/file
 FILE_DEPENDENCIES = host-file zlib
 HOST_FILE_DEPENDENCIES = host-zlib
@@ -13,5 +13,12 @@ FILE_INSTALL_STAGING = YES
 FILE_LICENSE = BSD-2-Clause, BSD-4-Clause (one file), BSD-3-Clause (one file)
 FILE_LICENSE_FILES = COPYING src/mygetopt.h src/vasprintf.c
 
+ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
+FILE_CONF_OPTS += --enable-libseccomp
+FILE_DEPENDENCIES += libseccomp
+else
+FILE_CONF_OPTS += --disable-libseccomp
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
