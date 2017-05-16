From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 16 May 2017 22:45:30 +0200
Subject: [Buildroot] [PATCH 2/3] support/testing: document
	get_elf_prog_interpreter
In-Reply-To: <1494967531-6463-1-git-send-email-luca@lucaceresoli.net>
References: <1494967531-6463-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1494967531-6463-2-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 support/testing/infra/__init__.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/support/testing/infra/__init__.py b/support/testing/infra/__init__.py
index c3f645cf99d7..b5634f6f64d7 100644
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
-- 
2.7.4
