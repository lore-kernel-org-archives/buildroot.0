From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 27 Aug 2016 00:26:26 +0200
Subject: [Buildroot] [PATCH] package/libraw: fix gcc-6 build
Message-ID: <20160826222626.17919-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Grab the patch from Debian.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libraw/libraw.hash | 1 +
 package/libraw/libraw.mk   | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/package/libraw/libraw.hash b/package/libraw/libraw.hash
index e23ca9c..2979425 100644
--- a/package/libraw/libraw.hash
+++ b/package/libraw/libraw.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256	e599651a4cc37e00cfc2d2b56be87c3a4e4dae2c360b680fe9ab3f93d07cdea1	LibRaw-0.17.1.tar.gz
+sha256	3c09bc4d70268e78798696c5ea3a8cc65fe4e161811d5321fc3ef2ca012d8fd1	0001-Fix_gcc6_narrowing_conversion.patch?id=d890937aaca6359df45a66b35e547c94ca564823
diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
index 7fc4709..d76a180 100644
--- a/package/libraw/libraw.mk
+++ b/package/libraw/libraw.mk
@@ -7,6 +7,9 @@
 LIBRAW_VERSION = 0.17.1
 LIBRAW_SOURCE = LibRaw-$(LIBRAW_VERSION).tar.gz
 LIBRAW_SITE = http://www.libraw.org/data
+LIBRAW_PATCH = \
+	https://anonscm.debian.org/cgit/pkg-phototools/libraw.git/plain/debian/patches/0001-Fix_gcc6_narrowing_conversion.patch?id=d890937aaca6359df45a66b35e547c94ca564823
+
 LIBRAW_INSTALL_STAGING = YES
 # we patch configure.ac
 LIBRAW_AUTORECONF = YES
-- 
2.9.3
