From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Mar 2020 15:54:29 +0100
Subject: [Buildroot] [git commit]
 support/testing/tests/package/sample_python_gobject.py: fix flake8 warnings
Message-ID: <20200324144153.73CEB8281C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=75371a4a12673ff992ca482b503eed70509154af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  support/testing/tests/package/sample_python_gobject.py:5:1: E302 expected 2 blank lines, found 1
  support/testing/tests/package/sample_python_gobject.py:8:7: E111 indentation is not a multiple of four
  support/testing/tests/package/sample_python_gobject.py:11:1: E305 expected 2 blank lines after class or function definition, found 1

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/sample_python_gobject.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/package/sample_python_gobject.py b/support/testing/tests/package/sample_python_gobject.py
index ecce0b0575..50564aa79f 100644
--- a/support/testing/tests/package/sample_python_gobject.py
+++ b/support/testing/tests/package/sample_python_gobject.py
@@ -2,11 +2,13 @@
 """A simple test that uses python-gobject to find the path of sh."""
 from gi.repository import GLib
 
+
 def main():
     sh_path = GLib.find_program_in_path('sh')
     if sh_path == "/bin/sh":
-      return True
+        return True
     return False
 
+
 if __name__ == '__main__':
     main()
