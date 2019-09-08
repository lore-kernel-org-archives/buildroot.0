From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Sep 2019 00:38:30 +0200
Subject: [Buildroot] [git commit] Revert "package/gperf: bump to version 3.1"
Message-ID: <20190908223525.ADFEA8D52A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7a029fec78e87832a041cdb5e2d2cfceae534e32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 3e29e1ed5bb5c9c6689ac9e78c46c2d458c00cfb, as it
breaks the build of host-libcap.

Fixes:

  http://autobuild.buildroot.net/results/4db6fcffd4f1432d2f2349ecb58992c6be568073/

Thanks to Ricardo Martincoski <ricardo.martincoski@gmail.com> for the
analysis of the problem.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gperf/gperf.hash | 4 +---
 package/gperf/gperf.mk   | 2 +-
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/gperf/gperf.hash b/package/gperf/gperf.hash
index 3d8aafbdca..21c76605b5 100644
--- a/package/gperf/gperf.hash
+++ b/package/gperf/gperf.hash
@@ -1,7 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/pub/gnu/gperf/gperf-3.1.tar.gz.sig
-# with key 93C08C88471097CD
-sha256	588546b945bba4b70b6a3a616e80b4ab466e3f33024a352fc2198112cdbb3ae2	gperf-3.1.tar.gz
+sha256	767112a204407e62dbc3106647cf839ed544f3cf5d0f0523aaa2508623aad63e	gperf-3.0.4.tar.gz
 
 # Locally calculated
 sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
diff --git a/package/gperf/gperf.mk b/package/gperf/gperf.mk
index 4b928a0ebd..2a6192a48b 100644
--- a/package/gperf/gperf.mk
+++ b/package/gperf/gperf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GPERF_VERSION = 3.1
+GPERF_VERSION = 3.0.4
 GPERF_SITE = $(BR2_GNU_MIRROR)/gperf
 GPERF_LICENSE = GPL-3.0+
 GPERF_LICENSE_FILES = COPYING
