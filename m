From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2021 23:52:54 +0100
Subject: [Buildroot] [PATCH-2020.02.x] package/glibc: security bump for
 additional post-2.30.x fixes
Message-ID: <20210128225255.15309-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security issue:

- CVE-2021-3326: Assertion failure in ISO-2022-JP-3 gconv module related to
  combining characters

For details, see https://sourceware.org/bugzilla/show_bug.cgi?id=27256 and
https://www.openwall.com/lists/oss-security/2021/01/27/3

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../glibc.hash                                                  | 2 +-
 package/glibc/glibc.mk                                          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename package/glibc/{2.30-73-gd59630f9959b0bb8991964758ab854ff4378b20d => 2.30-85-g79bf3c9774b0c2aa865b2ca397554ff425225d3c}/glibc.hash (70%)

diff --git a/package/glibc/2.30-73-gd59630f9959b0bb8991964758ab854ff4378b20d/glibc.hash b/package/glibc/2.30-85-g79bf3c9774b0c2aa865b2ca397554ff425225d3c/glibc.hash
similarity index 70%
rename from package/glibc/2.30-73-gd59630f9959b0bb8991964758ab854ff4378b20d/glibc.hash
rename to package/glibc/2.30-85-g79bf3c9774b0c2aa865b2ca397554ff425225d3c/glibc.hash
index 21ee1faeaf..9985f93ed8 100644
--- a/package/glibc/2.30-73-gd59630f9959b0bb8991964758ab854ff4378b20d/glibc.hash
+++ b/package/glibc/2.30-85-g79bf3c9774b0c2aa865b2ca397554ff425225d3c/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  ce788d30851a215d58ff94c972d9cff5956725cc5ee906298711ddc63078c315  glibc-2.30-73-gd59630f9959b0bb8991964758ab854ff4378b20d.tar.gz
+sha256  b07ce01d26094074912cf718eb8715386758776d4c050ecbfc5ac64d21d63001  glibc-2.30-85-g79bf3c9774b0c2aa865b2ca397554ff425225d3c.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 08170fbbcf..75d73f9c16 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -17,7 +17,7 @@ else
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.30-73-gd59630f9959b0bb8991964758ab854ff4378b20d
+GLIBC_VERSION = 2.30-85-g79bf3c9774b0c2aa865b2ca397554ff425225d3c
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
-- 
2.20.1
