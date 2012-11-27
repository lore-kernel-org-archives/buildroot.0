From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Nov 2012 15:07:03 +0100
Subject: [Buildroot] [PATCH for-next 3/3] toolchain-external: on ARM,
	show comment about the availability of Linaro toolchains
In-Reply-To: <1354025223-14474-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1354025223-14474-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1354025223-14474-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On ARM, Linaro external toolchains are only visible if the user
selects Cortex-A8 or Cortex-A9. Therefore, we add a comment that tells
the user that the Linaro toolchains are only available under those
conditions.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 469c283..4fe605d 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -54,6 +54,10 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_09
 
 	  To use this toolchain, you must disable soft float usage.
 
+comment "Linaro toolchains available for Cortex-A{8,9}"
+	depends on BR2_arm
+	depends on !BR2_cortex_a8 && !BR2_cortex_a9
+
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203
 	bool "Sourcery CodeBench ARM 2012.03"
 	depends on BR2_arm
-- 
1.7.9.5
