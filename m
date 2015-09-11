From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 11 Sep 2015 10:50:48 +0100
Subject: [Buildroot] [PATCH buildroot-test 2/2] autobuild-run: amend a
	comment to be more precise
In-Reply-To: <1441965048-30856-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1441965048-30856-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1441965048-30856-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Saying "The ctng toolchain has a too old glibc version" is not very
accurate. Is better to say "This MIPS toolchain uses eglibc-2.18".

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 scripts/autobuild-run |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 6e98b2c..2b309fa 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -393,7 +393,7 @@ def fixup_config(**kwargs):
     if 'BR2_PACKAGE_STRONGSWAN=y\n' in configlines and \
        'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mips64el-ctng_n64-linux-gnu.tar.xz"\n' in configlines:
         return False
-    # The ctng toolchain has a too old glibc version, which lacks SYS_getdents64
+    # This MIPS toolchain uses eglibc-2.18 which lacks SYS_getdents64
     if 'BR2_PACKAGE_PYTHON3=y\n' in configlines and \
        'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mips64el-ctng_n64-linux-gnu.tar.xz"\n' in configlines:
         return False
-- 
1.7.1
