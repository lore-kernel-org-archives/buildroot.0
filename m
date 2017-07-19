From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Jul 2017 00:11:56 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] mpg123: security bump to
	version 1.25.2
Message-ID: <20170720055508.9252B800CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=020c65779156d48c463f94cabbf676767ab57b0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

From the release notes:

 - Extend pow tables for layer III to properly handle files with i-stereo and
   5-bit scalefactors. Never observed them for real, just as fuzzed input to
   trigger the read overflow. Note: This one goes on record as CVE-2017-11126,
   calling remote denial of service. While the accesses are out of bounds for
   the pow tables, they still are safely within libmpg123's memory (other
   static tables). Just wrong values are used for computation, no actual crash
   unless you use something like GCC's AddressSanitizer, nor any information
   disclosure.
 - Avoid left-shifts of negative integers in layer I decoding.

While we're at it, add a hash for the license file.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 474daa20f8da2a677250146e8ee1652206923ee8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpg123/mpg123.hash | 5 ++++-
 package/mpg123/mpg123.mk   | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/mpg123/mpg123.hash b/package/mpg123/mpg123.hash
index 69fbef3..cbab6f3 100644
--- a/package/mpg123/mpg123.hash
+++ b/package/mpg123/mpg123.hash
@@ -1,2 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	0fe7270a4071367f97a7c1fb45fb2ef3cfef73509c205124e080ea569217b05f	mpg123-1.25.1.tar.bz2
+sha256	5314b0fb8ad291bfc79ff4c5c321b971916819a65233ec065434358fcf8aee38	mpg123-1.25.2.tar.bz2
+
+# License file
+sha256  f40e0dd86b27b52e429b693a87b3ca63ae0a98a4d142e77207aa6bdf1db7a295  COPYING
diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index 8eaaa62..44218ed 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPG123_VERSION = 1.25.1
+MPG123_VERSION = 1.25.2
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = http://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_CONF_OPTS = --disable-lfs-alias
