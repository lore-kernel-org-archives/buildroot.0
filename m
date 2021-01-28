From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2021 23:13:08 +0100
Subject: [Buildroot] [PATCH-2020.11.x] package/glibc: security bump for
 additional post-2.31.x fixes
Message-ID: <20210128221308.28572-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security issue:

- CVE-2021-3326): Assertion failure in ISO-2022-JP-3 gconv module related to
  combining characters

For details, see https://sourceware.org/bugzilla/show_bug.cgi?id=27256 and
https://www.openwall.com/lists/oss-security/2021/01/27/3

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../glibc.hash                                                  | 2 +-
 package/glibc/glibc.mk                                          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename package/glibc/{2.31-70-gc4f5e32aae3094491641025a42fe2d55222c8f16 => 2.31-74-gd0c84d22b6a67f85a1eed3b93aef30e6953294b5}/glibc.hash (70%)

diff --git a/package/glibc/2.31-70-gc4f5e32aae3094491641025a42fe2d55222c8f16/glibc.hash b/package/glibc/2.31-74-gd0c84d22b6a67f85a1eed3b93aef30e6953294b5/glibc.hash
similarity index 70%
rename from package/glibc/2.31-70-gc4f5e32aae3094491641025a42fe2d55222c8f16/glibc.hash
rename to package/glibc/2.31-74-gd0c84d22b6a67f85a1eed3b93aef30e6953294b5/glibc.hash
index e7aaeab07c..df58d6f47a 100644
--- a/package/glibc/2.31-70-gc4f5e32aae3094491641025a42fe2d55222c8f16/glibc.hash
+++ b/package/glibc/2.31-74-gd0c84d22b6a67f85a1eed3b93aef30e6953294b5/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  9897155423ea50bfa255b0130d13608b7d11129e79848a52cf82670bb206439a  glibc-2.31-70-gc4f5e32aae3094491641025a42fe2d55222c8f16.tar.gz
+sha256  d7495fb929497bedff9827d01091a4df681cfcbe5204de1d47fc5dab1ba7457c  glibc-2.31-74-gd0c84d22b6a67f85a1eed3b93aef30e6953294b5.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index f4bba24ca0..b068a006a4 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -20,7 +20,7 @@ else ifeq ($(BR2_RISCV_32),y)
 # Until 2.33 is released, just use master
 GLIBC_VERSION = 2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99
 else
-GLIBC_VERSION = 2.31-70-gc4f5e32aae3094491641025a42fe2d55222c8f16
+GLIBC_VERSION = 2.31-74-gd0c84d22b6a67f85a1eed3b93aef30e6953294b5
 endif
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
-- 
2.20.1
