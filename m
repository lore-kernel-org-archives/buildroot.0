From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Oct 2019 23:12:49 +0200
Subject: [Buildroot] [git commit] package/libtasn1: bump version to 4.14
Message-ID: <20191007210751.905038B33B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c9779f53d0fc0e39f08dc3204b9224f059e6d029
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.gnu.org/archive/html/help-libtasn1/2019-07/msg00000.html

Upstream moved license files COPYING/COPYING.LIB to doc/ and added
LICENSE:
https://gitlab.com/gnutls/libtasn1/commit/142a25a1dfe3034fc468f093ea887f12af0da5f4

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libtasn1/libtasn1.hash | 9 +++++----
 package/libtasn1/libtasn1.mk   | 4 ++--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/libtasn1/libtasn1.hash b/package/libtasn1/libtasn1.hash
index 9ed7a7a42c..e25e18abf8 100644
--- a/package/libtasn1/libtasn1.hash
+++ b/package/libtasn1/libtasn1.hash
@@ -1,6 +1,7 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/libtasn1/libtasn1-4.13.tar.gz.sig
-sha256	7e528e8c317ddd156230c4e31d082cd13e7ddeb7a54824be82632209550c8cca	libtasn1-4.13.tar.gz
+# https://ftp.gnu.org/gnu/libtasn1/libtasn1-4.14.tar.gz.sig
+sha256	9e604ba5c5c8ea403487695c2e407405820d98540d9de884d6e844f9a9c5ba08	libtasn1-4.14.tar.gz
 # Locally calculated
-sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
-sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING.LIB
+sha256	7446831f659f7ebfd8d497acc7f05dfa8e31c6cb6ba1b45df33d4895ab80f5a6	LICENSE
+sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	doc/COPYING
+sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	doc/COPYING.LESSER
diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
index f14d57abd3..50afc4cdf9 100644
--- a/package/libtasn1/libtasn1.mk
+++ b/package/libtasn1/libtasn1.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-LIBTASN1_VERSION = 4.13
+LIBTASN1_VERSION = 4.14
 LIBTASN1_SITE = $(BR2_GNU_MIRROR)/libtasn1
 LIBTASN1_DEPENDENCIES = host-bison
 LIBTASN1_LICENSE = GPL-3.0+ (tests, tools), LGPL-2.1+ (library)
-LIBTASN1_LICENSE_FILES = COPYING COPYING.LIB
+LIBTASN1_LICENSE_FILES = LICENSE doc/COPYING doc/COPYING.LESSER
 LIBTASN1_INSTALL_STAGING = YES
 # 'missing' fallback logic botched so disable it completely
 LIBTASN1_CONF_ENV = MAKEINFO="true"
