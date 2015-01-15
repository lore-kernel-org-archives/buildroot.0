From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 15 Jan 2015 11:03:19 -0300
Subject: [Buildroot] [PATCH] samba4: security bump to version 4.1.16
Message-ID: <1421330599-28068-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2014-8143 - dsdb-samldb: Check for extended access rights
before we allow changes to userAccountControl.

Also rename patches to new naming convention.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...via-array.patch => 0001-build-find-FILE_OFFSET_BITS-via-array.patch} | 0
 ...ides.patch => 0002-build-allow-some-python-variable-overrides.patch} | 0
 ...ze-via-array.patch => 0003-build-find-blkcnt_t-size-via-array.patch} | 0
 ...x-endian-tests.patch => 0004-build-unify-and-fix-endian-tests.patch} | 0
 ...> 0005-build-make-wafsamba-CHECK_SIZEOF-cross-compile-friendl.patch} | 0
 ...OF-utmp-ut_line.patch => 0006-build-tweak-SIZEOF-utmp-ut_line.patch} | 0
 .../{samba4-0009-disable-libbsd.patch => 0007-disable-libbsd.patch}     | 0
 package/samba4/samba4.hash                                              | 2 +-
 package/samba4/samba4.mk                                                | 2 +-
 9 files changed, 2 insertions(+), 2 deletions(-)
 rename package/samba4/{samba4-0003-build-find-FILE_OFFSET_BITS-via-array.patch => 0001-build-find-FILE_OFFSET_BITS-via-array.patch} (100%)
 rename package/samba4/{samba4-0004-build-allow-some-python-variable-overrides.patch => 0002-build-allow-some-python-variable-overrides.patch} (100%)
 rename package/samba4/{samba4-0005-build-find-blkcnt_t-size-via-array.patch => 0003-build-find-blkcnt_t-size-via-array.patch} (100%)
 rename package/samba4/{samba4-0006-build-unify-and-fix-endian-tests.patch => 0004-build-unify-and-fix-endian-tests.patch} (100%)
 rename package/samba4/{samba4-0007-build-make-wafsamba-CHECK_SIZEOF-cross-compile-friendl.patch => 0005-build-make-wafsamba-CHECK_SIZEOF-cross-compile-friendl.patch} (100%)
 rename package/samba4/{samba4-0008-build-tweak-SIZEOF-utmp-ut_line.patch => 0006-build-tweak-SIZEOF-utmp-ut_line.patch} (100%)
 rename package/samba4/{samba4-0009-disable-libbsd.patch => 0007-disable-libbsd.patch} (100%)

diff --git a/package/samba4/samba4-0003-build-find-FILE_OFFSET_BITS-via-array.patch b/package/samba4/0001-build-find-FILE_OFFSET_BITS-via-array.patch
similarity index 100%
rename from package/samba4/samba4-0003-build-find-FILE_OFFSET_BITS-via-array.patch
rename to package/samba4/0001-build-find-FILE_OFFSET_BITS-via-array.patch
diff --git a/package/samba4/samba4-0004-build-allow-some-python-variable-overrides.patch b/package/samba4/0002-build-allow-some-python-variable-overrides.patch
similarity index 100%
rename from package/samba4/samba4-0004-build-allow-some-python-variable-overrides.patch
rename to package/samba4/0002-build-allow-some-python-variable-overrides.patch
diff --git a/package/samba4/samba4-0005-build-find-blkcnt_t-size-via-array.patch b/package/samba4/0003-build-find-blkcnt_t-size-via-array.patch
similarity index 100%
rename from package/samba4/samba4-0005-build-find-blkcnt_t-size-via-array.patch
rename to package/samba4/0003-build-find-blkcnt_t-size-via-array.patch
diff --git a/package/samba4/samba4-0006-build-unify-and-fix-endian-tests.patch b/package/samba4/0004-build-unify-and-fix-endian-tests.patch
similarity index 100%
rename from package/samba4/samba4-0006-build-unify-and-fix-endian-tests.patch
rename to package/samba4/0004-build-unify-and-fix-endian-tests.patch
diff --git a/package/samba4/samba4-0007-build-make-wafsamba-CHECK_SIZEOF-cross-compile-friendl.patch b/package/samba4/0005-build-make-wafsamba-CHECK_SIZEOF-cross-compile-friendl.patch
similarity index 100%
rename from package/samba4/samba4-0007-build-make-wafsamba-CHECK_SIZEOF-cross-compile-friendl.patch
rename to package/samba4/0005-build-make-wafsamba-CHECK_SIZEOF-cross-compile-friendl.patch
diff --git a/package/samba4/samba4-0008-build-tweak-SIZEOF-utmp-ut_line.patch b/package/samba4/0006-build-tweak-SIZEOF-utmp-ut_line.patch
similarity index 100%
rename from package/samba4/samba4-0008-build-tweak-SIZEOF-utmp-ut_line.patch
rename to package/samba4/0006-build-tweak-SIZEOF-utmp-ut_line.patch
diff --git a/package/samba4/samba4-0009-disable-libbsd.patch b/package/samba4/0007-disable-libbsd.patch
similarity index 100%
rename from package/samba4/samba4-0009-disable-libbsd.patch
rename to package/samba4/0007-disable-libbsd.patch
diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index bd6f6e9..bff18a8 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	9d84112124512428ddc9cc0d9975524bab730b9a598a9ff90458666afb3f42f4	samba-4.1.15.tar.gz
+sha256	12a09c167bfa25f50b82775bcbeda94c71c5d71d3b0d1210f6dae0f23020a87b	samba-4.1.16.tar.gz
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 4a2f207..4239b42 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.1.15
+SAMBA4_VERSION = 4.1.16
 SAMBA4_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_LICENSE = GPLv3+
-- 
2.0.5
