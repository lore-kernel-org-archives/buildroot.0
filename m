From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Aug 2020 16:29:00 +0200
Subject: [Buildroot] [PATCH 2/7] support/testing: consistently use raw
 strings for re.compile
In-Reply-To: <20200812142906.598755-1-thomas.petazzoni@bootlin.com>
References: <20200812142906.598755-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200812142906.598755-3-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise Python 3.x flake8 complains with:

W605 invalid escape sequence '\s'

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/infra/__init__.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/infra/__init__.py b/support/testing/infra/__init__.py
index 6392aa679b..6522a265f3 100644
--- a/support/testing/infra/__init__.py
+++ b/support/testing/infra/__init__.py
@@ -78,7 +78,7 @@ def get_elf_arch_tag(builddir, prefix, fpath, tag):
     cmd = ["host/bin/{}-readelf".format(prefix),
            "-A", os.path.join("target", fpath)]
     out = run_cmd_on_host(builddir, cmd)
-    regexp = re.compile("^  {}: (.*)$".format(tag))
+    regexp = re.compile(r"^  {}: (.*)$".format(tag))
     for line in out.splitlines():
         m = regexp.match(line)
         if not m:
@@ -105,7 +105,7 @@ def get_elf_prog_interpreter(builddir, prefix, fpath):
     cmd = ["host/bin/{}-readelf".format(prefix),
            "-l", os.path.join("target", fpath)]
     out = run_cmd_on_host(builddir, cmd)
-    regexp = re.compile("^ *\[Requesting program interpreter: (.*)\]$")
+    regexp = re.compile(r"^ *\[Requesting program interpreter: (.*)\]$")
     for line in out.splitlines():
         m = regexp.match(line)
         if not m:
-- 
2.26.2
