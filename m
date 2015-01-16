From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Jan 2015 22:37:56 +0100
Subject: [Buildroot] [git commit] samba4: security bump to version 4.1.16
Message-ID: <20150116213818.36CC4807EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3ac6390abd6dd304987116bd35ee4f72361dbb12
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2014-8143 - dsdb-samldb: Check for extended access rights
before we allow changes to userAccountControl.

Also rename patches to new naming convention.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...01-build-find-FILE_OFFSET_BITS-via-array.patch} |    0
 ...ild-allow-some-python-variable-overrides.patch} |    0
 ... 0003-build-find-blkcnt_t-size-via-array.patch} |    0
 ...=> 0004-build-unify-and-fix-endian-tests.patch} |    0
 ...samba-CHECK_SIZEOF-cross-compile-friendl.patch} |    0
 ... => 0006-build-tweak-SIZEOF-utmp-ut_line.patch} |    0
 ...able-libbsd.patch => 0007-disable-libbsd.patch} |    0
 package/samba4/samba4.hash                         |    2 +-
 package/samba4/samba4.mk                           |    2 +-
 9 files changed, 2 insertions(+), 2 deletions(-)

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
