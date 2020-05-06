From: Maxim Kochetkov <fido_max@inbox.ru>
Date: Thu, 7 May 2020 02:04:44 +0300
Subject: [Buildroot] [PATCH] package/gcc9: Fix parallel build problem (xgcc
 not found)
Message-ID: <b60c5da0-cf8e-3f5b-d271-659345733aff@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some times gcc 9.2.0, 9.3.0 failed to build with a message: "xgcc: No 
such file or directory"

When it fails, it's trying to execute selftests.

So to fix this problem we can disable selftests.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

---
  package/gcc/9.3.0/0001-disable-selftest.patch | 11 +++++++++++
  1 file changed, 11 insertions(+)
  create mode 100644 package/gcc/9.3.0/0001-disable-selftest.patch

diff --git a/package/gcc/9.3.0/0001-disable-selftest.patch 
b/package/gcc/9.3.0/0001-disable-selftest.patch
new file mode 100644
index 0000000000..d7150b0fb1
--- /dev/null
+++ b/package/gcc/9.3.0/0001-disable-selftest.patch
@@ -0,0 +1,11 @@
+--- a/gcc/Makefile.in    2019-09-04 10:05:38.483715500 +0300
++++ b/gcc/Makefile.in    2019-04-25 17:32:16.000000000 +0300
+@@ -1961,7 +1961,7 @@
+ # require the selftests to be run by defining their selftest-<LANG> as
+ # s-selftest-<LANG>.  Otherwise, they should define it as empty.
+
+-SELFTEST_TARGETS = @selftest_languages@
++SELFTEST_TARGETS =
+ selftest: $(SELFTEST_TARGETS)
+
+ # Recompile all the language-independent object files.
-- 
2.25.1
