From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Jul 2017 17:46:22 +0200
Subject: [Buildroot] [git commit] support/testing: strip /usr/ part from
	HOST_DIR
Message-ID: <20170710154309.4C9B481979@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=73e7bcdd87f72fb186c7f9bba11a44f93cf8c1a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/testing/infra/__init__.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/infra/__init__.py b/support/testing/infra/__init__.py
index a55ad7f..27e2a27 100644
--- a/support/testing/infra/__init__.py
+++ b/support/testing/infra/__init__.py
@@ -55,7 +55,7 @@ def get_elf_arch_tag(builddir, prefix, fpath, tag):
     v5TEJ
     >>>
     """
-    cmd = ["host/usr/bin/{}-readelf".format(prefix),
+    cmd = ["host/bin/{}-readelf".format(prefix),
            "-A", os.path.join("target", fpath)]
     out = subprocess.check_output(cmd, cwd=builddir, env={"LANG": "C"})
     regexp = re.compile("^  {}: (.*)$".format(tag))
@@ -80,7 +80,7 @@ def get_elf_prog_interpreter(builddir, prefix, fpath):
     /lib/ld-linux-armhf.so.3
     >>>
     """
-    cmd = ["host/usr/bin/{}-readelf".format(prefix),
+    cmd = ["host/bin/{}-readelf".format(prefix),
            "-l", os.path.join("target", fpath)]
     out = subprocess.check_output(cmd, cwd=builddir, env={"LANG": "C"})
     regexp = re.compile("^ *\[Requesting program interpreter: (.*)\]$")
