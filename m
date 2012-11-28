From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 27 Nov 2012 17:11:45 -0800
Subject: [Buildroot] [git commit branch/next] toolchain-external: on ARM,
	show comment about the availability of Linaro toolchains
Message-ID: <20121128011246.13EFC8F461@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=90f763c77d2316c2fdefa1301e96d5b31376e2cf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

On ARM, Linaro external toolchains are only visible if the user
selects Cortex-A8 or Cortex-A9. Therefore, we add a comment that tells
the user that the Linaro toolchains are only available under those
conditions.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-external/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

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
