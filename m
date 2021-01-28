From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2021 22:35:08 +0100
Subject: [Buildroot] [PATCH] package/glibc: security bump for additional
 post-2.32.x fixes
Message-ID: <20210128213509.6056-1-peter@korsgaard.com>
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
 rename package/glibc/{2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2 => 2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2}/glibc.hash (72%)

diff --git a/package/glibc/2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2/glibc.hash b/package/glibc/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/glibc.hash
similarity index 72%
rename from package/glibc/2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2/glibc.hash
rename to package/glibc/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/glibc.hash
index 45ecc2895f..b1d5243fcc 100644
--- a/package/glibc/2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2/glibc.hash
+++ b/package/glibc/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  04946bb7cbaf4062bf5e727e0d6784e105b07611587d71f00d25ea896753c26d  glibc-2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2.tar.gz
+sha256  f4710e9a435a7b83e1d23dd75434f0d36b898eba9b4249c946c32b467d852fd4  glibc-2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index b0a1318b04..f84f670fc0 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -16,7 +16,7 @@ ifeq ($(BR2_RISCV_32),y)
 # Until 2.33 is released, just use master
 GLIBC_VERSION = 2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99
 else
-GLIBC_VERSION = 2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2
+GLIBC_VERSION = 2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2
 endif
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
-- 
2.20.1
