From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Dec 2015 21:46:34 +0100
Subject: [Buildroot] [git commit] libpng: security bump to version 1.6.20
Message-ID: <20151204205655.04B4A81F84@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=371e2f7f3c2f66eadba91e5d33c32f462f9691b7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2015-8126 - incorrect implementation of png_set_PLTE() that uses
png_ptr not info_ptr, that left png_set_PLTE() open to this vuln.

(fix in previous release was incomplete)

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpng/libpng.hash | 6 +++---
 package/libpng/libpng.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index a26538d..264dd45 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/libpng/files/libpng16/1.6.19/
-md5	1e6a458429e850fc93c1f3b6dc00a48f	libpng-1.6.19.tar.xz
-sha1	483d72ced11c9258f9d1119105273d9af9ff151c	libpng-1.6.19.tar.xz
+# From http://sourceforge.net/projects/libpng/files/libpng16/1.6.20/
+md5	3968acb7c66ef81a9dab867f35d0eb4b	libpng-1.6.20.tar.xz
+sha1	c4f02051e0b86613076ce390fd15824f3506a148	libpng-1.6.20.tar.xz
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 649a3e0..36ccf83 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.19
+LIBPNG_VERSION = 1.6.20
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng${LIBPNG_SERIES}/$(LIBPNG_VERSION)
