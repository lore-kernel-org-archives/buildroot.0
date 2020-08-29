From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Aug 2020 12:24:03 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/glibc: security
 bump for additional post-2.30.x fixes
Message-ID: <20200829101718.D820683947@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc3e09eba0023a9ad1255187ea9c4ac8744597ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes the following security issue:

arm: CVE-2020-6096: Fix multiarch memcpy for negative length [BZ #25620]
Unsigned branch instructions could be used for r2 to fix the wrong behavior
when a negative length is passed to memcpy.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../glibc.hash                                                          | 2 +-
 package/glibc/glibc.mk                                                  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glibc/2.30-67-g4748829f86a458b76642f3e98b1d80f7b868e427/glibc.hash b/package/glibc/2.30-73-gd59630f9959b0bb8991964758ab854ff4378b20d/glibc.hash
similarity index 70%
rename from package/glibc/2.30-67-g4748829f86a458b76642f3e98b1d80f7b868e427/glibc.hash
rename to package/glibc/2.30-73-gd59630f9959b0bb8991964758ab854ff4378b20d/glibc.hash
index 6677d32db9..21ee1faeaf 100644
--- a/package/glibc/2.30-67-g4748829f86a458b76642f3e98b1d80f7b868e427/glibc.hash
+++ b/package/glibc/2.30-73-gd59630f9959b0bb8991964758ab854ff4378b20d/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  4462f56696332efbc5b0c2f86d7aa75a2a02c3d44bc4345fa42b5bab1225de5c  glibc-2.30-67-g4748829f86a458b76642f3e98b1d80f7b868e427.tar.gz
+sha256  ce788d30851a215d58ff94c972d9cff5956725cc5ee906298711ddc63078c315  glibc-2.30-73-gd59630f9959b0bb8991964758ab854ff4378b20d.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 4621c9c2f9..08170fbbcf 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -17,7 +17,7 @@ else
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.30-67-g4748829f86a458b76642f3e98b1d80f7b868e427
+GLIBC_VERSION = 2.30-73-gd59630f9959b0bb8991964758ab854ff4378b20d
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
