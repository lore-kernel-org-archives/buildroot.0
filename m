From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 10 Jun 2012 13:46:49 +0200
Subject: [Buildroot] [PATCH v3 2/6] target: add symbols for PowerPC cpu
	features
In-Reply-To: <1339328813-6269-1-git-send-email-s.martin49@gmail.com>
References: <1339328813-6269-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1339328813-6269-5-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>

diff --git a/target/Config.in.arch b/target/Config.in.arch
index 49c01e5..02aa931 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -600,6 +600,14 @@ config BR2_xtensa_core_name
 	default "dc232b"		if BR2_xtensa_dc232b
 #	default "s5000"			if BR2_xtensa_s5000
 
+# PowerPC cpu features
+config BR2_POWERPC_CPU_G3
+	bool
+config BR2_POWERPC_CPU_G4
+	bool
+config BR2_POWERPC_CPU_G5
+	bool
+
 choice
 	prompt "Target Architecture Variant"
 	depends on BR2_powerpc
@@ -640,12 +648,18 @@ config BR2_powerpc_630
 	bool "630"
 config BR2_powerpc_740
 	bool "740"
+	select BR2_POWERPC_CPU_G3
 config BR2_powerpc_7400
 	bool "7400"
+	select BR2_POWERPC_CPU_G3
+	select BR2_POWERPC_CPU_G4
 config BR2_powerpc_7450
 	bool "7450"
+	select BR2_POWERPC_CPU_G3
+	select BR2_POWERPC_CPU_G4
 config BR2_powerpc_750
 	bool "750"
+	select BR2_POWERPC_CPU_G3
 config BR2_powerpc_801
 	bool "801"
 config BR2_powerpc_821
@@ -656,6 +670,9 @@ config BR2_powerpc_860
 	bool "860"
 config BR2_powerpc_970
 	bool "970"
+	select BR2_POWERPC_CPU_G3
+	select BR2_POWERPC_CPU_G4
+	select BR2_POWERPC_CPU_G5
 config BR2_powerpc_8540
 	bool "8540 / e500v1"
 config BR2_powerpc_8548
-- 
1.7.10.4
