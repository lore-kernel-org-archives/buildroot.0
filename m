From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 May 2017 21:56:32 +0200
Subject: [Buildroot] [git commit] support/testing: rename check_broken_links
	to has_broken_links
Message-ID: <20170517195656.C55D382940@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=52258901eccb72eeafab61f855f4b8ce34bf4159
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

has_broken_links makes it self-explanatory that this is a predicate
function, and that the return value tells whether there _are_ broken
links, not the opposite.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/testing/tests/toolchain/test_external.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/support/testing/tests/toolchain/test_external.py b/support/testing/tests/toolchain/test_external.py
index 1fbf81f..0b15d48 100644
--- a/support/testing/tests/toolchain/test_external.py
+++ b/support/testing/tests/toolchain/test_external.py
@@ -7,7 +7,7 @@ BR2_TARGET_ROOTFS_CPIO=y
 # BR2_TARGET_ROOTFS_TAR is not set
 """
 
-def check_broken_links(path):
+def has_broken_links(path):
     for root, dirs, files in os.walk(path):
         for f in files:
             fpath = os.path.join(root, f)
@@ -20,9 +20,9 @@ class TestExternalToolchain(infra.basetest.BRTest):
         # Check for broken symlinks
         for d in ["lib", "usr/lib"]:
             path = os.path.join(self.builddir, "staging", d)
-            self.assertFalse(check_broken_links(path))
+            self.assertFalse(has_broken_links(path))
             path = os.path.join(self.builddir, "target", d)
-            self.assertFalse(check_broken_links(path))
+            self.assertFalse(has_broken_links(path))
 
         interp = infra.get_elf_prog_interpreter(self.builddir,
                                                 self.toolchain_prefix,
