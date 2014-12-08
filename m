From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 8 Dec 2014 15:34:21 +0000
Subject: [Buildroot] [PATCH] autobuild-run: remove unnecessary exceptions
Message-ID: <1418052861-64388-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

br-mipsel-o32-full toolchain has been upgraded from 2014.08 to 2014.11
and the build failures we had have been now fixed, so we don't need to
these exceptions anymore.

Related:
  http://lists.busybox.net/pipermail/buildroot/2014-December/114527.html

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 scripts/autobuild-run |    8 --------
 1 files changed, 0 insertions(+), 8 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 993c578..4d9ef90 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -294,14 +294,6 @@ def fixup_config(instance, sysinfo):
     if 'BR2_PACKAGE_GDB=y\n' in configlines and \
        'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
         return False
-    # This MIPS uClibc toolchain fails to build the conntrack-tools package
-    if 'BR2_PACKAGE_CONNTRACK_TOOLS=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mipsel-o32-full-2014.08.tar.bz2"\n' in configlines:
-        return False
-    # This MIPS uClibc toolchain fails to build the rt-tests package
-    if 'BR2_PACKAGE_RT_TESTS=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mipsel-o32-full-2014.08.tar.bz2"\n' in configlines:
-        return False
     # This MIPS uClibc toolchain fails to build the rt-tests package
     if 'BR2_PACKAGE_RT_TESTS=y\n' in configlines and \
        'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
-- 
1.7.1
