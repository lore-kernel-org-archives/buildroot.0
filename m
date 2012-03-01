From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Mar 2012 20:26:36 +0100
Subject: [Buildroot] [git commit] Add the Atom processor in the list of
	supported x86/x86_64 processors
Message-ID: <20120306223951.5940C90D16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b5bebeaebd873af7ca6899ab2b9088d33a429b19
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This allows to easily select the corresponding Atom multilib variant
in the Sourcery CodeBench toolchain.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/Config.in.arch |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/target/Config.in.arch b/target/Config.in.arch
index 73cecaf..25c6e50 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -266,6 +266,9 @@ config BR2_x86_nocona
 	bool "nocona"
 config BR2_x86_core2
 	bool "core2"
+config BR2_x86_atom
+	bool "atom"
+comment "atom needs gcc >= 4.5.x"
 config BR2_x86_k6
 	bool "k6"
 config BR2_x86_k6_2
@@ -311,6 +314,9 @@ config BR2_x86_64_nocona
 	bool "nocona"
 config BR2_x86_64_core2
 	bool "core2"
+config BR2_x86_64_atom
+	bool "atom"
+comment "atom needs gcc >= 4.5.x"
 endchoice
 
 choice
@@ -500,6 +506,7 @@ config BR2_ARCH
 	default "i686"		if BR2_x86_pentiumpro
 	default "i686"		if BR2_x86_nocona
 	default "i686"		if BR2_x86_core2
+	default "i686"		if BR2_x86_atom
 	default "i686"		if BR2_x86_opteron
 	default "i686"		if BR2_x86_opteron_sse3
 	default "i686"		if BR2_x86_barcelona
@@ -525,6 +532,7 @@ config BR2_ARCH
 	default "x86_64"	if BR2_x86_64_generic
 	default "x86_64"	if BR2_x86_64_nocona
 	default "x86_64"	if BR2_x86_64_core2
+	default "x86_64"	if BR2_x86_64_atom
 	default "x86_64"	if BR2_x86_64_opteron
 	default "x86_64"	if BR2_x86_64_opteron_sse3
 	default "x86_64"	if BR2_x86_64_barcelona
@@ -554,6 +562,7 @@ config BR2_GCC_TARGET_TUNE
 	default prescott	if BR2_x86_prescott
 	default nocona		if BR2_x86_nocona
 	default core2		if BR2_x86_core2
+	default atom		if BR2_x86_atom
 	default k8		if BR2_x86_opteron
 	default k8-sse3		if BR2_x86_opteron_sse3
 	default barcelona	if BR2_x86_barcelona
@@ -569,6 +578,7 @@ config BR2_GCC_TARGET_TUNE
 	default generic		if BR2_x86_64_generic
 	default nocona		if BR2_x86_64_nocona
 	default core2		if BR2_x86_64_core2
+	default atom		if BR2_x86_64_atom
 	default k8		if BR2_x86_64_opteron
 	default k8-sse3		if BR2_x86_64_opteron_sse3
 	default barcelona	if BR2_x86_64_barcelona
@@ -669,6 +679,7 @@ config BR2_GCC_TARGET_ARCH
 	default prescott	if BR2_x86_prescott
 	default nocona		if BR2_x86_nocona
 	default core2		if BR2_x86_core2
+	default atom		if BR2_x86_atom
 	default k8		if BR2_x86_opteron
 	default k8-sse3		if BR2_x86_opteron_sse3
 	default barcelona	if BR2_x86_barcelona
@@ -680,6 +691,7 @@ config BR2_GCC_TARGET_ARCH
 	default winchip2	if BR2_x86_winchip2
 	default nocona		if BR2_x86_64_nocona
 	default core2		if BR2_x86_64_core2
+	default atom		if BR2_x86_64_atom
 	default k8		if BR2_x86_64_opteron
 	default k8-sse3		if BR2_x86_64_opteron_sse3
 	default barcelona	if BR2_x86_64_barcelona
