From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Jul 2017 21:21:01 +0200
Subject: [Buildroot] [git commit] package/lapack: bump version to 3.7.1
Message-ID: <20170731191654.AFC0F8163E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b63c29ad209b3e7b47f6e85a7a8e5b0154bbb990
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lapack does not support in-source builds anymore:
https://github.com/Reference-LAPACK/lapack/commit/ea081254b4a0538f81c74bdb8338b29a068303aa

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lapack/lapack.hash | 2 +-
 package/lapack/lapack.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/lapack/lapack.hash b/package/lapack/lapack.hash
index e57cebc..fd3feef 100644
--- a/package/lapack/lapack.hash
+++ b/package/lapack/lapack.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  888a50d787a9d828074db581c80b2d22bdb91435a673b1bf6cd6eb51aa50d1de  lapack-3.6.1.tgz
+sha256 f6c53fd9f56932f3ddb3d5e24c1c07e4cd9b3b08e7f89de9c867125eecc9a1c8  lapack-3.7.1.tgz
diff --git a/package/lapack/lapack.mk b/package/lapack/lapack.mk
index b747c76..4e74bbd 100644
--- a/package/lapack/lapack.mk
+++ b/package/lapack/lapack.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-LAPACK_VERSION = 3.6.1
+LAPACK_VERSION = 3.7.1
 LAPACK_SOURCE = lapack-$(LAPACK_VERSION).tgz
 LAPACK_LICENSE = BSD-3-Clause
 LAPACK_LICENSE_FILES = LICENSE
 LAPACK_SITE = http://www.netlib.org/lapack
 LAPACK_INSTALL_STAGING = YES
+LAPACK_SUPPORTS_IN_SOURCE_BUILD = NO
 LAPACK_CONF_OPTS = -DLAPACKE=ON -DCBLAS=ON
 
 ifeq ($(BR2_PACKAGE_LAPACK_COMPLEX),y)
