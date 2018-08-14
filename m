From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 13 Aug 2018 23:26:42 -0500
Subject: [Buildroot] [RFC 2/3] hardening testing: busybox test case to
 verify linker wrapper behavior with -r
In-Reply-To: <1534220803-26737-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1534220803-26737-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1534220803-26737-3-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 support/testing/tests/core/test_hardening.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/core/test_hardening.py b/support/testing/tests/core/test_hardening.py
index fcec46f..ab8d078 100644
--- a/support/testing/tests/core/test_hardening.py
+++ b/support/testing/tests/core/test_hardening.py
@@ -21,7 +21,7 @@ class TestHardeningBase(infra.basetest.BRTest):
         BR2_PACKAGE_HOST_CHECKSEC=y
         # BR2_TARGET_ROOTFS_TAR is not set
         """
-    checksec_files = ["usr/sbin/lighttpd"]
+    checksec_files = ["usr/sbin/lighttpd", "target/bin/busybox"]
 
     def checksec_run(self, target_file):
         filepath = os.path.join(self.builddir, "target", target_file)
-- 
1.9.1
