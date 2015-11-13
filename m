From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Nov 2015 22:35:06 +0100
Subject: [Buildroot] [git commit] libpng: security bump to version 1.6.19
Message-ID: <20151113213546.605E781F0B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e50c333c35b938cd464d7e1d810732f55c65297e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
png_set_PLTE/png_get_PLTE functions failed to check for
an out-of-range palette when reading or writing PNG files with a bit_depth
less than 8.

CVE not yet assigned.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpng/libpng.hash |    6 +++---
 package/libpng/libpng.mk   |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index 92ac24f..a26538d 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/libpng/files/libpng16/1.6.18/
-md5	6a57c8e0f5469b9c9949a4b43d57b3a1	libpng-1.6.18.tar.xz
-sha1	c6e06510d30beba08c96c468ab269fafb2bb256f	libpng-1.6.18.tar.xz
+# From http://sourceforge.net/projects/libpng/files/libpng16/1.6.19/
+md5	1e6a458429e850fc93c1f3b6dc00a48f	libpng-1.6.19.tar.xz
+sha1	483d72ced11c9258f9d1119105273d9af9ff151c	libpng-1.6.19.tar.xz
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 5500a61..649a3e0 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.18
+LIBPNG_VERSION = 1.6.19
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng${LIBPNG_SERIES}/$(LIBPNG_VERSION)
