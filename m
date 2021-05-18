From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 18 May 2021 22:15:36 +0200
Subject: [Buildroot] [git commit] support/testing: test_hardening disable
 PIC/PIE
Message-ID: <20210518194800.BC8ED868BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45a13be315f2e3dd9caa29dae8c84280975d4807
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since [1], PIC/PIE is enabled by default but the TestRelroPartial
test expect implicitely PIC/PIE being disabled.

Disable PIC/PIE from the config fragment provided by
TestRelroPartial.

[1] 810ba387bec3c5b6904e8893fb4cb6f9d3717466

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1255661757

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/testing/tests/core/test_hardening.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/tests/core/test_hardening.py b/support/testing/tests/core/test_hardening.py
index 60e14303a3..e9d30f3a38 100644
--- a/support/testing/tests/core/test_hardening.py
+++ b/support/testing/tests/core/test_hardening.py
@@ -52,6 +52,7 @@ class TestRelroPartial(TestHardeningBase):
     config = TestHardeningBase.config + \
         """
         BR2_RELRO_PARTIAL=y
+        # BR2_PIC_PIE is not set
         """
 
     def test_run(self):
