From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 6 Dec 2019 00:32:34 +0100
Subject: [Buildroot] [git commit] support/testing: test_python_django: add
 missing line
Message-ID: <20191205232559.0A463882B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=17638bc3ada60c7cedc71f4a546c7b75fae6113e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

flake8 complains with:

test_python_django.py:25:1: E302 expected 2 blank lines, found 1

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/testing/tests/package/test_python_django.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/tests/package/test_python_django.py b/support/testing/tests/package/test_python_django.py
index eb93d4fca9..6b31833a0f 100644
--- a/support/testing/tests/package/test_python_django.py
+++ b/support/testing/tests/package/test_python_django.py
@@ -22,6 +22,7 @@ class TestPythonDjango(TestPythonPackageBase):
         cmd = "netstat -ltn 2>/dev/null | grep 0.0.0.0:1234"
         self.assertRunOk(cmd)
 
+
 class TestPythonPy3Django(TestPythonDjango):
     __test__ = True
     config = TestPythonDjango.config + \
