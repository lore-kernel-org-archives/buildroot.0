From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 10 Jul 2017 01:21:19 +0200
Subject: [Buildroot] [PATCH 3/7] support/testing: strip /usr/ part from
	HOST_DIR
In-Reply-To: <20170709232123.30120-1-arnout@mind.be>
References: <20170709232123.30120-1-arnout@mind.be>
Message-ID: <20170709232123.30120-4-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/testing/infra/__init__.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/infra/__init__.py b/support/testing/infra/__init__.py
index a55ad7fdf5..27e2a2708d 100644
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
-- 
2.13.2
