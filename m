From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 25 Jan 2015 16:31:18 +0100
Subject: [Buildroot] [PATCH 1/2] Config.in.legacy: add an option to get rid
	of all legacy at once
Message-ID: <1422199879-7825-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The new option BR2_SKIP_LEGACY completely disables the legacy handling,
which effectively removes all the legacy options from the .config.

This option will become particularly useful for the next commit, which
improves legacy handling for randconfig.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Config.in.legacy b/Config.in.legacy
index 69608c7..fbe0b88 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -52,6 +52,9 @@
 #
 # [End of example]
 
+# BR2_SKIP_LEGACY is defined at the end of the file: it looks nicer in the menu
+if !BR2_SKIP_LEGACY
+
 config BR2_LEGACY
 	bool
 	help
@@ -1186,3 +1189,15 @@ config BR2_BFIN_FLAT
 	select BR2_LEGACY
 
 endmenu
+
+endif # BR2_SKIP_LEGACY
+
+config BR2_SKIP_LEGACY
+	bool "Forget all legacy options"
+	help
+	  Remove all the legacy options from this configuration.
+
+	  Warning: if you upgrade buildroot in the future, you will no
+	  longer be warned of legacy options that have been removed. We
+	  therefore advise to use this option only temporarily to
+	  quickly get rid of all legacy options you still have.
-- 
2.1.4
