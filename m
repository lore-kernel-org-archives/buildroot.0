From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 3 Jan 2015 21:40:54 +0100
Subject: [Buildroot] [git commit] package/upx: needs zlib
Message-ID: <20150103204058.A6F42803FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6457e638b5592ebd860ca331f3dc57d207e387ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes build issues like, observed on a stripped-down build system:
    compress.cpp:32:18: fatal error: zlib.h: No such file or directory
     #include <zlib.h>
                  ^
    compilation terminated.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/upx/upx.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/upx/upx.mk b/package/upx/upx.mk
index 30bb03b..400d283 100644
--- a/package/upx/upx.mk
+++ b/package/upx/upx.mk
@@ -10,7 +10,7 @@ UPX_SOURCE = upx-$(UPX_VERSION)-src.tar.bz2
 UPX_LICENSE = GPLv2+
 UPX_LICENSE_FILES = COPYING
 
-HOST_UPX_DEPENDENCIES = host-ucl
+HOST_UPX_DEPENDENCIES = host-ucl host-zlib
 
 # We need to specify all, otherwise the default target only prints a message
 # stating to "please choose a target for 'make'"... :-(
