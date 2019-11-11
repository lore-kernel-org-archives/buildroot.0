From: Avi Shukron <avraham.shukron@gmail.com>
Date: Mon, 11 Nov 2019 23:31:46 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/qemu: add host-python as an
 explicit dependency
In-Reply-To: <20191111213154.19409-1-avraham.shukron@gmail.com>
References: <20191111213154.19409-1-avraham.shukron@gmail.com>
Message-ID: <20191111213154.19409-2-avraham.shukron@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

qemu requires python in its configre script. Yet host-python was
not listed as one of the package's dependencies. If no other package
requested host-python, then configuring this package will fail since
it won't find any executable named python in the host dir.

In order to reproduce this issue you must not have python2 installed
on your host machine.

Signed-off-by: Avi Shukron <avraham.shukron@gmail.com>
---
 package/qemu/qemu.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index a91f9d3eeb..00d413b68d 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -21,7 +21,7 @@ QEMU_LICENSE_FILES = COPYING COPYING.LIB
 #-------------------------------------------------------------
 # Target-qemu
 
-QEMU_DEPENDENCIES = host-pkgconf libglib2 zlib pixman
+QEMU_DEPENDENCIES = host-pkgconf libglib2 zlib pixman host-python
 
 # Need the LIBS variable because librt and libm are
 # not automatically pulled. :-(
@@ -182,7 +182,7 @@ $(eval $(generic-package))
 #-------------------------------------------------------------
 # Host-qemu
 
-HOST_QEMU_DEPENDENCIES = host-pkgconf host-zlib host-libglib2 host-pixman
+HOST_QEMU_DEPENDENCIES = host-pkgconf host-zlib host-libglib2 host-pixman host-python
 
 #       BR ARCH         qemu
 #       -------         ----
-- 
2.17.1
