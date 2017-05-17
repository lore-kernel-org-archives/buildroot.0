From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 May 2017 21:56:38 +0200
Subject: [Buildroot] [git commit] support/testing: document
	get_elf_prog_interpreter
Message-ID: <20170517195656.D0EA282940@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee72dbe576e0c8e11a0bd61028950b2f8de29642
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/testing/infra/__init__.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/support/testing/infra/__init__.py b/support/testing/infra/__init__.py
index c3f645c..b5634f6 100644
--- a/support/testing/infra/__init__.py
+++ b/support/testing/infra/__init__.py
@@ -77,6 +77,16 @@ def get_file_arch(builddir, prefix, fpath):
     return get_elf_arch_tag(builddir, prefix, fpath, "Tag_CPU_arch")
 
 def get_elf_prog_interpreter(builddir, prefix, fpath):
+    """
+    Runs the cross readelf on 'fpath' to extract the program interpreter
+    name and returns it.
+    Example:
+    >>> get_elf_prog_interpreter('br-tests/TestExternalToolchainLinaroArm',
+                                 'arm-linux-gnueabihf',
+                                 'bin/busybox')
+    /lib/ld-linux-armhf.so.3
+    >>>
+    """
     cmd = ["host/usr/bin/{}-readelf".format(prefix),
            "-l", os.path.join("target", fpath)]
     out = subprocess.check_output(cmd, cwd=builddir, env={"LANG": "C"})
