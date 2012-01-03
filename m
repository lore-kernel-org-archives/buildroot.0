From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  3 Jan 2012 21:22:42 +0100
Subject: [Buildroot] [PATCH 01/14] Add x86_64 variants to BR2_GCC_TARGET_ARCH
In-Reply-To: <cover.1325622133.git.thomas.petazzoni@free-electrons.com>
References: <cover.1325622133.git.thomas.petazzoni@free-electrons.com>
Message-ID: <f9dc6aa657ca5df40d228684611ae8ee5fb1b360.1325622133.git.thomas.petazzoni@free-electrons.com>
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
