From: Alex B <alexbaldwinmusic@gmail.com>
Date: Thu,  8 Feb 2018 20:37:48 +0100
Subject: [Buildroot] [PATCH v2 1/1] LIBLO : bump version to 0.29
Message-ID: <1518118669-24714-1-git-send-email-alexbaldwinmusic@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Alex <alexbaldwinmusic@gmail.com>

Starting from version 0.28, C++ wrappers are provided as well. The configure
script appropriately detects the availability of a C++ compiler so no Buildroot
changes are needed for this.

Building fails with --enable-ipv6 so --disable-ipv6 is needed in CONF_OPTS.
This is known by liblo developers and building without ipv6 support is recomennded.

Included hash for license files.

Signed-off-by: Alex Baldwin <alexbaldwinmusic@gmail.com>

---
CHANGELOG

No longer including a patch for liblo/configure. This was the wrong way of dealing with --enable-ipv6.
SHA256 for COPYING file instead of sha1.
Include  # License files comment for clarity.
---
 package/liblo/liblo.hash | 10 +++++++---
 package/liblo/liblo.mk   |  3 ++-
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/liblo/liblo.hash b/package/liblo/liblo.hash
index a4e01a6..862b6fb 100644
--- a/package/liblo/liblo.hash
+++ b/package/liblo/liblo.hash
@@ -1,3 +1,7 @@
-# From http://sourceforge.net/projects/liblo/files/liblo/0.26/
-sha1	21942c8f19e9829b5842cb85352f98c49dfbc823  liblo-0.26.tar.gz
-md5	5351de14262560e15e7f23865293b16f  liblo-0.26.tar.gz
+# From http://sourceforge.net/projects/liblo/files/liblo/0.29/
+sha1    6aa69456787d3d6ef915281b4a0f8f2c79548ce3  liblo-0.29.tar.gz
+md5	b0e70bc0fb2254addf94adddf85cffd3  liblo-0.29.tar.gz
+
+# Locally computed
+sha1    caeb68c46fa36651acf592771d09de7937926bb3  COPYING	
+md5 fbc093901857fcd118f065f900982c24  COPYING
diff --git a/package/liblo/liblo.mk b/package/liblo/liblo.mk
index 3c852be..856b437 100644
--- a/package/liblo/liblo.mk
+++ b/package/liblo/liblo.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-LIBLO_VERSION = 0.26
+LIBLO_VERSION = 0.29
 LIBLO_SITE = http://downloads.sourceforge.net/project/liblo/liblo/$(LIBLO_VERSION)
 
 LIBLO_LICENSE = LGPL-2.1+
 LIBLO_LICENSE_FILES = COPYING
 LIBLO_INSTALL_STAGING = YES
+LIBLO_CONF_OPTS += --disable-ipv6
 
 $(eval $(autotools-package))
-- 
2.7.4
