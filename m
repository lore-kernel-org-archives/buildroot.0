From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 10:04:51 +0100
Subject: [Buildroot] [git commit branch/2017.08.x] apr-util: security bump
 to version 1.6.1
Message-ID: <20171126184640.516EA802DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d030e29fb2568e4359f708f6793ad70fe21c09b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

Fixes CVE-2017-12618: Out-of-bounds access in corrupted SDBM database.

Switch to bz2 compressed tarball.

Use upstream provided SHA256 hash.

Add license hash.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 1d3c611dee82090d9456730e24af368b51dcb4a9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apr-util/apr-util.hash | 6 ++++--
 package/apr-util/apr-util.mk   | 3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/apr-util/apr-util.hash b/package/apr-util/apr-util.hash
index 3db4396..82ad475 100644
--- a/package/apr-util/apr-util.hash
+++ b/package/apr-util/apr-util.hash
@@ -1,2 +1,4 @@
-# From http://archive.apache.org/dist/apr/apr-util-1.5.4.tar.gz.sha1
-sha1	72cc3ac693b52fb831063d5c0de18723bc8e0095	apr-util-1.5.4.tar.gz
+# From http://www.apache.org/dist/apr/apr-util-1.6.1.tar.bz2.sha256
+sha256	d3e12f7b6ad12687572a3a39475545a072608f4ba03a6ce8a3778f607dd0035b	apr-util-1.6.1.tar.bz2
+# Locally calculated
+sha256	ef5609d18601645ad6fe22c6c122094be40e976725c1d0490778abacc836e7a2	LICENSE
diff --git a/package/apr-util/apr-util.mk b/package/apr-util/apr-util.mk
index bc0572e..c44cef0 100644
--- a/package/apr-util/apr-util.mk
+++ b/package/apr-util/apr-util.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-APR_UTIL_VERSION = 1.5.4
+APR_UTIL_VERSION = 1.6.1
+APR_UTIL_SOURCE = apr-util-$(APR_UTIL_VERSION).tar.bz2
 APR_UTIL_SITE = http://archive.apache.org/dist/apr
 APR_UTIL_LICENSE = Apache-2.0
 APR_UTIL_LICENSE_FILES = LICENSE
