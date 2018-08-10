From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Aug 2018 10:16:48 +0200
Subject: [Buildroot] [git commit branch/next] gzip: bump to version 1.9
Message-ID: <20180810081020.B7C80863B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=05c23d35429ec4ec5eb318655a3c95c6a9c58458
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add reference to tarball signature and key.

Add license file hash.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gzip/gzip.hash | 6 +++++-
 package/gzip/gzip.mk   | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/gzip/gzip.hash b/package/gzip/gzip.hash
index 466f846e12..632176c2b6 100644
--- a/package/gzip/gzip.hash
+++ b/package/gzip/gzip.hash
@@ -1,2 +1,6 @@
 # Locally calculated after checking pgp signature
-sha256 ff1767ec444f71e5daf8972f6f8bf68cfcca1d2f76c248eb18e8741fc91dbbd3  gzip-1.8.tar.xz
+# https://ftp.gnu.org/gnu/gzip/gzip-1.9.tar.xz.sig
+# using key 155D3FC500C834486D1EEA677FD9FCCB000BEEEE
+sha256 ae506144fc198bd8f81f1f4ad19ce63d5a2d65e42333255977cf1dcf1479089a  gzip-1.9.tar.xz
+# Locally calculated
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gzip/gzip.mk b/package/gzip/gzip.mk
index d69215a850..d48cb1aa15 100644
--- a/package/gzip/gzip.mk
+++ b/package/gzip/gzip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GZIP_VERSION = 1.8
+GZIP_VERSION = 1.9
 GZIP_SOURCE = gzip-$(GZIP_VERSION).tar.xz
 GZIP_SITE = $(BR2_GNU_MIRROR)/gzip
 # Some other tools expect it to be in /bin
