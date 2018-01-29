From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jan 2018 23:14:24 +0100
Subject: [Buildroot] [git commit] pycompile: fix code style
Message-ID: <20180129221637.58EFE8271E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=253e0166163c7dde0e18f549e7875cae5cc13f44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix these warnings:
E302 expected 2 blank lines, found 1
E305 expected 2 blank lines after class or function definition, found 1

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/pycompile.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/support/scripts/pycompile.py b/support/scripts/pycompile.py
index 8e164ab9d1..9192a7016a 100644
--- a/support/scripts/pycompile.py
+++ b/support/scripts/pycompile.py
@@ -12,6 +12,7 @@ import py_compile
 import compileall
 import argparse
 
+
 def check_for_errors(comparison):
     '''Wrap comparison operator with code checking for PyCompileError.
     If PyCompileError was raised, re-raise it again to abort execution,
@@ -28,6 +29,7 @@ def check_for_errors(comparison):
 
     return operator
 
+
 class ReportProblem(int):
     '''Class that pretends to be an int() object but implements all of its
     comparison operators such that it'd detect being called in
@@ -55,6 +57,7 @@ class ReportProblem(int):
     def __ne__(self, other):
         return not self == other
 
+
 parser = argparse.ArgumentParser(description='Compile Python source files in a directory tree.')
 parser.add_argument("target", metavar='DIRECTORY',
                     help='Directory to scan')
