From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 13:46:03 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/mpg123: security
 bump to version 1.25.11
Message-ID: <20190902114320.103498900F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=42c69cc30017372eb25d5485d9027ab7cd0ece18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

From https://www.mpg123.de/cgi-bin/news.cgi:

Fixes a number of bugs found by OSS-Fuzz:
 * Fix out-of-bounds reads in ID3 parser for unsynced frames.
   (oss-fuzz-bug 15852)
 * Fix out-of-bounds read for RVA2 frames with non-delimited identifier.
   (oss-fuzz-bug 15852)
 * Fix implementation-defined parsing of RVA2 values.
   (oss-fuzz-bug 15862)
 * Fix undefined parsing of APE header for skipping. Also prevent endless loop
   on premature end of supposed APE header. (oss-fuzz-bug 15864)
 * Fix some syntax to make pedantic compiler happy.

The serious bugs trigger Denial of Service either via the nasty endless loop in
supposed APE tags or by crashes if the invalid reads hit a diagnostic by the OS
or, more likely, a security mechanism like the sanitizer instrumentation that
enabled finding the bugs.

I do not have CVE numbers for these bugs. I rather fix the bugs than name them.
Just update, will you?

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7291360fd8fa5ca63e7a304fa6e1e75f4ea99258)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpg123/mpg123.hash | 8 ++++----
 package/mpg123/mpg123.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mpg123/mpg123.hash b/package/mpg123/mpg123.hash
index 22db5bca3c..687662b4cf 100644
--- a/package/mpg123/mpg123.hash
+++ b/package/mpg123/mpg123.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/mpg123/files/mpg123/1.25.10/
-sha1 604784ddbcfe282bffdc595d1d45c677c7cf381f  mpg123-1.25.10.tar.bz2
-md5 ea32caa61d41d8be797f0b04a1b43ad9  mpg123-1.25.10.tar.bz2
+# From https://sourceforge.net/projects/mpg123/files/mpg123/1.25.11/
+sha1 25f3e8f8599d3ffc480858799ea6f8620f48543d  mpg123-1.25.11.tar.bz2
+md5 64749512a6fdc117227abe13fee4cc36  mpg123-1.25.11.tar.bz2
 # Locally calculated
-sha256 6c1337aee2e4bf993299851c70b7db11faec785303cfca3a5c3eb5f329ba7023  mpg123-1.25.10.tar.bz2
+sha256 e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855  mpg123-1.25.11.tar.bz2
 # License file
 sha256  f40e0dd86b27b52e429b693a87b3ca63ae0a98a4d142e77207aa6bdf1db7a295  COPYING
diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index dd2d39d978..9cac5fe722 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPG123_VERSION = 1.25.10
+MPG123_VERSION = 1.25.11
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = http://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_CONF_OPTS = --disable-lfs-alias
