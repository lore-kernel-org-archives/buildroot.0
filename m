From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 19:18:28 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/cairo: security
 bump to version 1.15.14
Message-ID: <20200314180746.08C3F83A5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0387eaaefc3c0658411e271c211236100e772e1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security issues:

- CVE-2017-9814:cairo-truetype-subset.c in cairo 1.15.6 and earlier allows
  remote attackers to cause a denial of service (out-of-bounds read) because
  of mishandling of an unexpected malloc(0) call.

- CVE-2018-19876: cairo 1.16.0, in cairo_ft_apply_variations() in
  cairo-ft-font.c, would free memory using a free function incompatible with
  WebKit's fastMalloc, leading to an application crash with a "free():
  invalid pointer" error.

For more details, see the announcement:
https://www.cairographics.org/news/cairo-1.15.14/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cairo/cairo.hash | 6 +++---
 package/cairo/cairo.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/cairo/cairo.hash b/package/cairo/cairo.hash
index 795a2eeea5..7e516aea36 100644
--- a/package/cairo/cairo.hash
+++ b/package/cairo/cairo.hash
@@ -1,7 +1,7 @@
-# From https://www.cairographics.org/snapshots/cairo-1.15.12.tar.xz.sha1
-sha1	4e64c6a48789edb4c60bc3fa95bd3992cc388b88	cairo-1.15.12.tar.xz
+# From https://www.cairographics.org/snapshots/cairo-1.15.14.tar.xz.sha1
+sha1	62ebffbaf4cc81c412f0ad3f87dc20499f85d046	cairo-1.15.14.tar.xz
 # Calculated based on the hash above
-sha256	7623081b94548a47ee6839a7312af34e9322997806948b6eec421a8c6d0594c9	cairo-1.15.12.tar.xz
+sha256	16566b6c015a761bb0b7595cf879b77f8de85f90b443119083c4c2769b93298d	cairo-1.15.14.tar.xz
 
 # Hash for license files:
 sha256	67228a9f7c5f9b67c58f556f1be178f62da4d9e2e6285318d8c74d567255abdf	COPYING
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 6dffff4b81..1d3059f4b4 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CAIRO_VERSION = 1.15.12
+CAIRO_VERSION = 1.15.14
 CAIRO_SOURCE = cairo-$(CAIRO_VERSION).tar.xz
 CAIRO_LICENSE = LGPL-2.1 or MPL-1.1 (library)
 CAIRO_LICENSE_FILES = COPYING COPYING-LGPL-2.1 COPYING-MPL-1.1
