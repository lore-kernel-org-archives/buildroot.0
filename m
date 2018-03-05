From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 05 Mar 2018 20:07:17 -0000
Subject: [Buildroot] [git commit] liblo : bump version to 0.29
Message-ID: <20180305200713.3DAA680FFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e0e460df83865bb45567d5283e0f3528629a7050
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Starting from version 0.28, C++ wrappers are provided as well. The
configure script appropriately detects the availability of a C++
compiler so no Buildroot changes are needed for this.

Building fails with --enable-ipv6 so --disable-ipv6 is needed in
CONF_OPTS.  This is known by liblo developers and building without
ipv6 support is recomennded.

Included hash for license files.

Signed-off-by: Alex Baldwin <alexbaldwinmusic@gmail.com>
[Thomas: use single sha256 hash for license file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/liblo/liblo.hash | 9 ++++++---
 package/liblo/liblo.mk   | 5 ++++-
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/package/liblo/liblo.hash b/package/liblo/liblo.hash
index a4e01a6d73..fe61f82e67 100644
--- a/package/liblo/liblo.hash
+++ b/package/liblo/liblo.hash
@@ -1,3 +1,6 @@
-# From http://sourceforge.net/projects/liblo/files/liblo/0.26/
-sha1	21942c8f19e9829b5842cb85352f98c49dfbc823  liblo-0.26.tar.gz
-md5	5351de14262560e15e7f23865293b16f  liblo-0.26.tar.gz
+# From http://sourceforge.net/projects/liblo/files/liblo/0.29/
+sha1	6aa69456787d3d6ef915281b4a0f8f2c79548ce3	liblo-0.29.tar.gz
+md5	b0e70bc0fb2254addf94adddf85cffd3		liblo-0.29.tar.gz
+
+# Locally computed
+sha256	  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a	COPYING
diff --git a/package/liblo/liblo.mk b/package/liblo/liblo.mk
index 3c852be7e3..14b0527966 100644
--- a/package/liblo/liblo.mk
+++ b/package/liblo/liblo.mk
@@ -4,11 +4,14 @@
 #
 ################################################################################
 
-LIBLO_VERSION = 0.26
+LIBLO_VERSION = 0.29
 LIBLO_SITE = http://downloads.sourceforge.net/project/liblo/liblo/$(LIBLO_VERSION)
 
 LIBLO_LICENSE = LGPL-2.1+
 LIBLO_LICENSE_FILES = COPYING
 LIBLO_INSTALL_STAGING = YES
 
+# IPv6 support broken, issue known upstream
+LIBLO_CONF_OPTS = --disable-ipv6
+
 $(eval $(autotools-package))
