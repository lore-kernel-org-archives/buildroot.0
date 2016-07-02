From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  2 Jul 2016 12:05:08 +0200
Subject: [Buildroot] [autobuild-script] autobuild-run: remove the CS SH4
	toolchain exception
Message-ID: <1467453908-27165-1-git-send-email-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201209 has been renamed
in Buildroot and PRBOOM has been disabled for this toolchain.
The exception can be safely be removed.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 scripts/autobuild-run | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 1fbf482..7f90eb2 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -448,9 +448,6 @@ def fixup_config(**kwargs):
     if 'BR2_PACKAGE_PYTHON3=y\n' in configlines and \
        'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mips64el-ctng_n64-linux-gnu.tar.xz"\n' in configlines:
         return False
-    if 'BR2_PACKAGE_PRBOOM=y\n' in configlines and \
-            'BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201209=y\n' in configlines:
-        return False
     if 'BR2_sh2a=y\n' in configlines and  'BR2_PACKAGE_LIBFFI=y\n' in configlines:
         return False
     if 'BR2_PACKAGE_SUNXI_BOARDS=y\n' in configlines:
-- 
2.5.5
