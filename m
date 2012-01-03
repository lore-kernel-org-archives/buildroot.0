From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  3 Jan 2012 21:22:43 +0100
Subject: [Buildroot] [PATCH 02/14] Add the Atom processor in the list of
	supported x86/x86_64 processors
In-Reply-To: <cover.1325622133.git.thomas.petazzoni@free-electrons.com>
References: <cover.1325622133.git.thomas.petazzoni@free-electrons.com>
Message-ID: <d0643d15e126a270c3d8b60593f620579a4e4b83.1325622133.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This allows to easily select the corresponding Atom multilib variant
in the Sourcery CodeBench toolchain.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/Config.in.arch |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/target/Config.in.arch b/target/Config.in.arch
index 7faa010..b5ff694 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -266,6 +266,8 @@ config BR2_x86_nocona
 	bool "nocona"
 config BR2_x86_core2
 	bool "core2"
+config BR2_x86_atom
+	bool "atom"
 config BR2_x86_k6
 	bool "k6"
 config BR2_x86_k6_2
@@ -311,6 +313,8 @@ config BR2_x86_64_nocona
 	bool "nocona"
 config BR2_x86_64_core2
 	bool "core2"
+config BR2_x86_64_atom
+	bool "atom"
 endchoice
 
 choice
@@ -482,6 +486,7 @@ config BR2_ARCH
 	default "i686"		if BR2_x86_pentiumpro
 	default "i686"		if BR2_x86_nocona
 	default "i686"		if BR2_x86_core2
+	default "i686"		if BR2_x86_atom
 	default "i686"		if BR2_x86_opteron
 	default "i686"		if BR2_x86_opteron_sse3
 	default "i686"		if BR2_x86_barcelona
@@ -507,6 +512,7 @@ config BR2_ARCH
 	default "x86_64"	if BR2_x86_64_generic
 	default "x86_64"	if BR2_x86_64_nocona
 	default "x86_64"	if BR2_x86_64_core2
+	default "x86_64"	if BR2_x86_64_atom
 	default "x86_64"	if BR2_x86_64_opteron
 	default "x86_64"	if BR2_x86_64_opteron_sse3
 	default "x86_64"	if BR2_x86_64_barcelona
@@ -536,6 +542,7 @@ config BR2_GCC_TARGET_TUNE
 	default prescott	if BR2_x86_prescott
 	default nocona		if BR2_x86_nocona
 	default core2		if BR2_x86_core2
+	default atom		if BR2_x86_atom
 	default k8		if BR2_x86_opteron
 	default k8-sse3		if BR2_x86_opteron_sse3
 	default barcelona	if BR2_x86_barcelona
@@ -551,6 +558,7 @@ config BR2_GCC_TARGET_TUNE
 	default generic		if BR2_x86_64_generic
 	default nocona		if BR2_x86_64_nocona
 	default core2		if BR2_x86_64_core2
+	default atom		if BR2_x86_64_atom
 	default k8		if BR2_x86_64_opteron
 	default k8-sse3		if BR2_x86_64_opteron_sse3
 	default barcelona	if BR2_x86_64_barcelona
@@ -650,6 +658,7 @@ config BR2_GCC_TARGET_ARCH
 	default prescott	if BR2_x86_prescott
 	default nocona		if BR2_x86_nocona
 	default core2		if BR2_x86_core2
+	default atom		if BR2_x86_atom
 	default k8		if BR2_x86_opteron
 	default k8-sse3		if BR2_x86_opteron_sse3
 	default barcelona	if BR2_x86_barcelona
@@ -661,6 +670,7 @@ config BR2_GCC_TARGET_ARCH
 	default winchip2	if BR2_x86_winchip2
 	default nocona		if BR2_x86_64_nocona
 	default core2		if BR2_x86_64_core2
+	default atom		if BR2_x86_64_atom
 	default k8		if BR2_x86_64_opteron
 	default k8-sse3		if BR2_x86_64_opteron_sse3
 	default barcelona	if BR2_x86_64_barcelona
-- 
1.7.4.1
