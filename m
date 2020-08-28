From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 18:32:16 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] support/testing:
 consistently use raw strings for re.compile
Message-ID: <20200828164650.378A4862C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=76bbb4344150aca3d63af632421fb69d2b7e1514
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Otherwise Python 3.x flake8 complains with:

W605 invalid escape sequence '\s'

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b0078c058a4a935083f9494518216a46df20b5af)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
