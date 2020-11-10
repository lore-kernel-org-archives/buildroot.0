From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 10 Nov 2020 23:29:01 +0100
Subject: [Buildroot] [PATCH] support/testing: update to the new text
 representation of capabilities
Message-ID: <20201110222901.1289515-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since libcap 2.41, the text representation of capabilities now use
the '=' instead of '+' [1].

This break our capabilities tests since we still use the old
representation.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/morgan/libcap.git/commit/?id=177cd418031b1acfcf73fe3b1af9f3279828681c

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 support/testing/tests/core/test_file_capabilities.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/core/test_file_capabilities.py b/support/testing/tests/core/test_file_capabilities.py
index 945b48a4c3..b9ece18d7b 100644
--- a/support/testing/tests/core/test_file_capabilities.py
+++ b/support/testing/tests/core/test_file_capabilities.py
@@ -44,4 +44,4 @@ class TestFileCapabilities(infra.basetest.BRTest):
         self.assertIn("cap_kill", output[0])
         self.assertIn("cap_sys_nice", output[0])
         self.assertIn("cap_sys_time", output[0])
-        self.assertIn("+eip", output[0])
+        self.assertIn("=eip", output[0])
-- 
2.25.4
