From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 May 2021 15:56:51 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/mesa3d{,
 -headers}: add CPE variables
Message-ID: <20210519132812.2EA627F945@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e2008668d04f8e1e641a21a7b5d8e479386532f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:mesa3d:mesa is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amesa3d%3Amesa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr: add to mesa3d-headers too]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7fa481437e71484aa7064398e69aa63cdabb86b2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d-headers/mesa3d-headers.mk | 3 +++
 package/mesa3d/mesa3d.mk                 | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 5deea5f977..6389b2501b 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -18,6 +18,9 @@ MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
 MESA3D_HEADERS_LICENSE_FILES = docs/license.rst
+MESA3D_HEADERS_CPE_ID_VENDOR = mesa3d
+MESA3D_HEADERS_CPE_ID_PRODUCT = mesa
+
 
 # Only installs header files
 MESA3D_HEADERS_INSTALL_STAGING = YES
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index c9a7214aaa..36ea72f887 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -10,6 +10,8 @@ MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
 MESA3D_LICENSE_FILES = docs/license.rst
+MESA3D_CPE_ID_VENDOR = mesa3d
+MESA3D_CPE_ID_PRODUCT = mesa
 
 MESA3D_INSTALL_STAGING = YES
 
