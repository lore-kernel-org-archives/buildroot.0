From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  6 May 2017 15:49:48 +0200
Subject: [Buildroot] [autobuild-run: 1/2] autobuild-run: update cs nios2
	toolchain comment about PR19405.
Message-ID: <20170506134949.11995-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The toolchain was updated to 2017.02 but the PR19405 issue is still
present.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 scripts/autobuild-run | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 20e0033..ed3ddd2 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -495,11 +495,11 @@ def fixup_config(**kwargs):
     if 'BR2_PACKAGE_WESTON=y\n' in configlines and \
        'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
         return False
-    # The cs nios2 2016.05 toolchain is affected by binutils PR19405
+    # The cs nios2 2017.02 toolchain is affected by binutils PR19405
     if 'BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII=y\n' in configlines and \
        'BR2_PACKAGE_BOOST=y\n' in configlines:
         return False
-    # The cs nios2 2016.05 toolchain is affected by binutils PR19405
+    # The cs nios2 2017.02 toolchain is affected by binutils PR19405
     if 'BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII=y\n' in configlines and \
        'BR2_PACKAGE_QT5BASE_GUI=y\n' in configlines:
         return False
-- 
2.9.3
