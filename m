From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Tue,  6 Oct 2009 20:26:05 +0200
Subject: [Buildroot] [PATCH 3/6] default to EABI on arm
In-Reply-To: <4a5a0f10dbaecfd7b024c0cf1e90fd68a6730eac.1254853146.git.rep.dot.nop@gmail.com>
References: <cover.1254853146.git.rep.dot.nop@gmail.com>
	<1a6b4f990a536bfd23ae1e57a2cd11527761f8ec.1254853146.git.rep.dot.nop@gmail.com>
	<4a5a0f10dbaecfd7b024c0cf1e90fd68a6730eac.1254853146.git.rep.dot.nop@gmail.com>
Message-ID: <6fe0ac8fa1f42152f604ca708aff08b8f119073a.1254853146.git.rep.dot.nop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use of OABI is strongly discouraged since years now.

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 target/Config.in.arch |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/Config.in.arch b/target/Config.in.arch
index e63fc02..e82c8f4 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -116,14 +116,17 @@ config BR2_ARM_TYPE
 choice
 	prompt "Target ABI"
 	depends on BR2_arm || BR2_armeb
-	default BR2_ARM_OABI
+	default BR2_ARM_EABI
 	help
 	  Application Binary Interface to use
 
-config BR2_ARM_OABI
-	bool "OABI"
+	  Note:
+	    Using OABI is discouraged.
+
 config BR2_ARM_EABI
 	bool "EABI"
+config BR2_ARM_OABI
+	bool "OABI"
 endchoice
 
 choice
-- 
1.6.3.3
