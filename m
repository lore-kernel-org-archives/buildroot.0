From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Sep 2017 15:17:49 +0200
Subject: [Buildroot] [PATCH 9/9] [DON'T COMMIT] tests for all new arm cores
In-Reply-To: <cover.1504444617.git.yann.morin.1998@free.fr>
References: <cover.1504444617.git.yann.morin.1998@free.fr>
Message-ID: <a876f6b64754ba3b96492c57b18654f8ec465ca0.1504444617.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 .../tests/toolchain/test_internal_aarch64_all.py   | 162 +++++++++++++++++++++
 .../tests/toolchain/test_internal_arm_all.py       |  95 ++++++++++++
 2 files changed, 257 insertions(+)
 create mode 100644 support/testing/tests/toolchain/test_internal_aarch64_all.py
 create mode 100644 support/testing/tests/toolchain/test_internal_arm_all.py

diff --git a/support/testing/tests/toolchain/test_internal_aarch64_all.py b/support/testing/tests/toolchain/test_internal_aarch64_all.py
new file mode 100644
index 0000000000..77f5ce8fdb
--- /dev/null
+++ b/support/testing/tests/toolchain/test_internal_aarch64_all.py
@@ -0,0 +1,162 @@
+import os
+import infra
+
+class InternalToolchainAarch64Base(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_INIT_NONE=y
+        BR2_SYSTEM_BIN_SH_NONE=y
+        # BR2_PACKAGE_BUSYBOX is not set
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+################################################################################
+
+class TestInternalToolchainAarch64CortexA35(infra.basetest.BRTest):
+    config = InternalToolchainAarch64Base.config + \
+        """
+        BR2_cortex_a35=y
+        """
+
+    def test_run(self):
+        return True
+
+class TestInternalToolchainAarch64CortexA73(infra.basetest.BRTest):
+    config = InternalToolchainAarch64Base.config + \
+        """
+        BR2_cortex_a73=y
+        """
+
+    def test_run(self):
+        return True
+
+class TestInternalToolchainAarch64CortexA73A35(infra.basetest.BRTest):
+    config = InternalToolchainAarch64Base.config + \
+        """
+        BR2_cortex_a73_a35=y
+        """
+
+    def test_run(self):
+        return True
+
+class TestInternalToolchainAarch64CortexA73A53(infra.basetest.BRTest):
+    config = InternalToolchainAarch64Base.config + \
+        """
+        BR2_cortex_a73_a53=y
+        """
+
+    def test_run(self):
+        return True
+
+################################################################################
+
+class TestInternalToolchainAarch64Exynos1(infra.basetest.BRTest):
+    config = InternalToolchainAarch64Base.config + \
+        """
+        BR2_exynos_m1=y
+        """
+
+    def test_run(self):
+        return True
+
+class TestInternalToolchainAarch64Falkor(infra.basetest.BRTest):
+    config = InternalToolchainAarch64Base.config + \
+        """
+        BR2_falkor=y
+        """
+
+    def test_run(self):
+        return True
+
+class TestInternalToolchainAarch64Qdf24xx(infra.basetest.BRTest):
+    config = InternalToolchainAarch64Base.config + \
+        """
+        BR2_qdf24xx=y
+        """
+
+    def test_run(self):
+        return True
+
+class TestInternalToolchainAarch64ThunderX(infra.basetest.BRTest):
+    config = InternalToolchainAarch64Base.config + \
+        """
+        BR2_thunderx=y
+        """
+
+    def test_run(self):
+        return True
+
+class TestInternalToolchainAarch64ThunderXt81(infra.basetest.BRTest):
+    config = InternalToolchainAarch64Base.config + \
+        """
+        BR2_thunderxt81=y
+        """
+
+    def test_run(self):
+        return True
+
+class TestInternalToolchainAarch64ThunderXt83(infra.basetest.BRTest):
+    config = InternalToolchainAarch64Base.config + \
+        """
+        BR2_thunderxt83=y
+        """
+
+    def test_run(self):
+        return True
+
+class TestInternalToolchainAarch64ThunderXt88(infra.basetest.BRTest):
+    config = InternalToolchainAarch64Base.config + \
+        """
+        BR2_thunderxt88=y
+        """
+
+    def test_run(self):
+        return True
+
+class TestInternalToolchainAarch64ThunderXt88p1(infra.basetest.BRTest):
+    config = InternalToolchainAarch64Base.config + \
+        """
+        BR2_thunderxt88p1=y
+        """
+
+    def test_run(self):
+        return True
+
+class TestInternalToolchainAarch64Xgene1(infra.basetest.BRTest):
+    config = InternalToolchainAarch64Base.config + \
+        """
+        BR2_xgene1=y
+        """
+
+    def test_run(self):
+        return True
+
+################################################################################
+
+class TestInternalToolchainAarch64ThunderX2t99(infra.basetest.BRTest):
+    config = InternalToolchainAarch64Base.config + \
+        """
+        BR2_thunderx2t99=y
+        """
+
+    def test_run(self):
+        return True
+
+class TestInternalToolchainAarch64Vulcan(infra.basetest.BRTest):
+    config = InternalToolchainAarch64Base.config + \
+        """
+        BR2_vulcan=y
+        """
+
+    def test_run(self):
+        return True
+
+class TestInternalToolchainAarch64ThunderX2t99p1(infra.basetest.BRTest):
+    config = InternalToolchainAarch64Base.config + \
+        """
+        BR2_thunderx2t99p1=y
+        """
+
+    def test_run(self):
+        return True
diff --git a/support/testing/tests/toolchain/test_internal_arm_all.py b/support/testing/tests/toolchain/test_internal_arm_all.py
new file mode 100644
index 0000000000..8c3811cc5d
--- /dev/null
+++ b/support/testing/tests/toolchain/test_internal_arm_all.py
@@ -0,0 +1,95 @@
+import os
+import infra
+
+class InternalToolchainArmBase(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_arm=y
+        BR2_INIT_NONE=y
+        BR2_SYSTEM_BIN_SH_NONE=y
+        # BR2_PACKAGE_BUSYBOX is not set
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+class TestInternalToolchainArmCortexA32(infra.basetest.BRTest):
+    config = InternalToolchainArmBase.config + \
+        """
+        BR2_cortex_a32=y
+        """
+
+    def test_run(self):
+        return True
+
+class TestInternalToolchainArmCortexA35(infra.basetest.BRTest):
+    config = InternalToolchainArmBase.config + \
+        """
+        BR2_cortex_a35=y
+        """
+
+    def test_run(self):
+        return True
+
+class TestInternalToolchainArmCortexA73(infra.basetest.BRTest):
+    config = InternalToolchainArmBase.config + \
+        """
+        BR2_cortex_a73=y
+        """
+
+    def test_run(self):
+        return True
+
+class TestInternalToolchainArmCortexA73A35(infra.basetest.BRTest):
+    config = InternalToolchainArmBase.config + \
+        """
+        BR2_cortex_a73_a35=y
+        """
+
+    def test_run(self):
+        return True
+
+class TestInternalToolchainArmCortexA73A53(infra.basetest.BRTest):
+    config = InternalToolchainArmBase.config + \
+        """
+        BR2_cortex_a73_a53=y
+        """
+
+    def test_run(self):
+        return True
+
+################################################################################
+
+class TestInternalToolchainArmExynos1(infra.basetest.BRTest):
+    config = InternalToolchainArmBase.config + \
+        """
+        BR2_exynos_m1=y
+        """
+
+    def test_run(self):
+        return True
+
+class TestInternalToolchainArmFalkor(infra.basetest.BRTest):
+    config = InternalToolchainArmBase.config + \
+        """
+        BR2_falkor=y
+        """
+
+    def test_run(self):
+        return True
+
+class TestInternalToolchainArmQdf24xx(infra.basetest.BRTest):
+    config = InternalToolchainArmBase.config + \
+        """
+        BR2_qdf24xx=y
+        """
+
+    def test_run(self):
+        return True
+
+class TestInternalToolchainArmXgene1(infra.basetest.BRTest):
+    config = InternalToolchainArmBase.config + \
+        """
+        BR2_xgene1=y
+        """
+
+    def test_run(self):
+        return True
-- 
2.11.0
