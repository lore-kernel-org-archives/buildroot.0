From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Nov 2016 16:55:21 +0100
Subject: [Buildroot] [PATCHv2] legacy: add entries for renamed/removed MIPS
	CPU cores
Message-ID: <1479052521-27651-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Cc: Arnout Vandecappelle <arnout@mind.be>

---
Changes v1 -> v2:
  - add entry for removed m5100
---
 Config.in.legacy | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Config.in.legacy b/Config.in.legacy
index 8c41b05..9de2034 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,33 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.11"
 
+config BR2_mips_m6250
+	bool "MIPS M6201 core option has been renamed"
+	select BR2_LEGACY
+	help
+	  The option has been renamed to BR2_mips_m6250, which is
+	  the real name for that core.
+
+	  Please verify that the correct core is selected in the
+	  architecture variant choice.
+
+config BR2_mips_m5101
+	bool "MIPS M5101 core option has been renamed"
+	select BR2_LEGACY
+	help
+	  The option has been renamed to BR2_mips_m5150, which is
+	  the real name for that core.
+
+	  Please verify that the correct core is selected in the
+	  architecture variant choice.
+
+config BR2_mips_m5100
+	bool "MIPS M5100 core option has been removed"
+	select BR2_LEGACY
+	help
+	  Please verify that the correct core is selected in the
+	  architecture variant choice.
+
 config BR2_PACKAGE_PHP_SAPI_CLI_CGI
 	bool "PHP CGI and CLI options are now seperate"
 	select BR2_PACKAGE_PHP_SAPI_CLI
-- 
2.7.4
