From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  5 Mar 2012 20:59:54 +0100
Subject: [Buildroot] [PATCH 01/16] Add x86_64 variants to BR2_GCC_TARGET_ARCH
In-Reply-To: <cover.1330977548.git.thomas.petazzoni@free-electrons.com>
References: <cover.1330977548.git.thomas.petazzoni@free-electrons.com>
Message-ID: <f3a01cb0870b14776eda509bf3d592f9a8d349a7.1330977548.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the Sourcery CodeBench IA32/AMD64 toolchain, the proper -march=
switch must be passed. So, on x86_64, we make sure that
BR2_GCC_TARGET_ARCH gets defined to the correct value, just as we do
on x86.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/Config.in.arch |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/target/Config.in.arch b/target/Config.in.arch
index 417441d..73cecaf 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -678,6 +678,11 @@ config BR2_GCC_TARGET_ARCH
 	default athlon-4	if BR2_x86_athlon_4
 	default winchip-c6	if BR2_x86_winchip_c6
 	default winchip2	if BR2_x86_winchip2
+	default nocona		if BR2_x86_64_nocona
+	default core2		if BR2_x86_64_core2
+	default k8		if BR2_x86_64_opteron
+	default k8-sse3		if BR2_x86_64_opteron_sse3
+	default barcelona	if BR2_x86_64_barcelona
 	default c3		if BR2_x86_c3
 	default c3-2		if BR2_x86_c32
 	default geode		if BR2_x86_geode
-- 
1.7.4.1
