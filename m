From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 29 Oct 2019 02:18:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/libwpe: bump to version 1.4.0.1
Message-ID: <20191029001836.2467270-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a very minor bugfix release which solves an issue with wrong
version numbers in the headers included in the 1.4.0 release tarball,
without any functional changes. Programs which explicitly check for
version 1.4.0 of libwpe will not build or run without this update.
While Buildroot which use libwpe do not need this applied, they may
in the future. Also, third-party packages added through a BR2_EXTERNAL
may depend on using a version of libwpe which corrects the issue with
the version numbers.

Release notes:

  https://wpewebkit.org/release/libwpe-1.4.0.1.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/libwpe/libwpe.hash | 8 ++++----
 package/libwpe/libwpe.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libwpe/libwpe.hash b/package/libwpe/libwpe.hash
index 981d44b46b..0a616a31cc 100644
--- a/package/libwpe/libwpe.hash
+++ b/package/libwpe/libwpe.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/libwpe-1.4.0.tar.xz.sums
-md5 4b6dbaa2d40408975fe1be935367b4e8 libwpe-1.4.0.tar.xz
-sha1 18825932749edecd92a3bd31d4feffb5fd1150b4 libwpe-1.4.0.tar.xz
-sha256 e2d3494fc33fe946ad917fd6a3abd127462b91bba62ef8b35507e92f8ede4188 libwpe-1.4.0.tar.xz
+# From https://wpewebkit.org/releases/libwpe-1.4.0.1.tar.xz.sums
+md5 1d4d38413ee0d0043f74d0445cab906f libwpe-1.4.0.1.tar.xz
+sha1 a41480a0a85cfa11b3f87f801b7c37bc3410e060 libwpe-1.4.0.1.tar.xz
+sha256 09849dfb34877354f34f318e138971cf22e677b2179e1f0a8ea00ab0b7bd8e9b libwpe-1.4.0.1.tar.xz
 
 # Hashes for license files:
 sha256 35bef295cedbbf179eaee14328002587a0e7dc08ebf3f15ea080a6f2815f0d7b COPYING
diff --git a/package/libwpe/libwpe.mk b/package/libwpe/libwpe.mk
index aec8802b2f..09518ce9b1 100644
--- a/package/libwpe/libwpe.mk
+++ b/package/libwpe/libwpe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBWPE_VERSION = 1.4.0
+LIBWPE_VERSION = 1.4.0.1
 LIBWPE_SITE = https://wpewebkit.org/releases
 LIBWPE_SOURCE = libwpe-$(LIBWPE_VERSION).tar.xz
 LIBWPE_INSTALL_STAGING = YES
-- 
2.23.0
