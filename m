From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Aug 2019 08:47:37 +0200
Subject: [Buildroot] [PATCH] package/mpg123: security bump to version 1.25.12
Message-ID: <20190825064738.7957-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From the release notes:
- Fix an out-of-bounds read of maximal two bytes for truncated RVA2 frames
  (oss-fuzz-bug 15975). The earlier fix around the same location needed
  one thought more. Actually, another though was needed, oss-fuzz-bug 16009
  documents the incomplete fix.

- Fix an invalid write of one zero byte for empty ID3v2 frames that demand
  de-unsyncing (oss-fuzz-bug 16050).

- Fix dynamic build with gcc -fsanitize=address (check for all dl functions
  before deciding that separate -ldl is not needed).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpg123/mpg123.hash | 8 ++++----
 package/mpg123/mpg123.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mpg123/mpg123.hash b/package/mpg123/mpg123.hash
index edb916ee73..e5a549b577 100644
--- a/package/mpg123/mpg123.hash
+++ b/package/mpg123/mpg123.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/mpg123/files/mpg123/1.25.11/
-sha1 25f3e8f8599d3ffc480858799ea6f8620f48543d  mpg123-1.25.11.tar.bz2
-md5 64749512a6fdc117227abe13fee4cc36  mpg123-1.25.11.tar.bz2
+# From https://sourceforge.net/projects/mpg123/files/mpg123/1.25.12/
+sha1 4ece1ec124a6ca085e1d68f7ede6d5619fc587ff  mpg123-1.25.12.tar.bz2
+md5 ddb38254966eb38c77f220d456a1839d  mpg123-1.25.12.tar.bz2
 # Locally calculated
-sha256 df063307faa27c7d9efe63d2139b1564cfc7cdbb7c6f449c89ef8faabfa0eab2  mpg123-1.25.11.tar.bz2
+sha256 1ffec7c9683dfb86ea9040d6a53d6ea819ecdda215df347f79def08f1fe731d1  mpg123-1.25.12.tar.bz2
 # License file
 sha256  f40e0dd86b27b52e429b693a87b3ca63ae0a98a4d142e77207aa6bdf1db7a295  COPYING
diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index 9cac5fe722..6247e54a0a 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPG123_VERSION = 1.25.11
+MPG123_VERSION = 1.25.12
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = http://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_CONF_OPTS = --disable-lfs-alias
-- 
2.11.0
