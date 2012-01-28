From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jan 2012 18:36:41 +0100
Subject: [Buildroot] [PATCH 01/16] Add x86_64 variants to BR2_GCC_TARGET_ARCH
In-Reply-To: <cover.1327772176.git.thomas.petazzoni@free-electrons.com>
References: <cover.1327772176.git.thomas.petazzoni@free-electrons.com>
Message-ID: <1bd4d66905113b00759c6c31082ef87afe58d552.1327772176.git.thomas.petazzoni@free-electrons.com>
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
index 5e9fad4..7faa010 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -659,6 +659,11 @@ config BR2_GCC_TARGET_ARCH
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
