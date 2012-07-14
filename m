From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 14 Jul 2012 21:40:04 +0200
Subject: [Buildroot] [PATCH] linux: clarify the BR2_LINUX_KERNEL_DEFCONFIG
	help text
Message-ID: <1342294805-11428-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The help text of BR2_LINUX_KERNEL_DEFCONFIG is confusing: it seems to
point to the defconfigs in the buildroot tree.  So explicitly refer to
the kernel tree in the help text.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
 linux/Config.in |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 9c26439..c969be6 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -115,8 +115,9 @@ config BR2_LINUX_KERNEL_DEFCONFIG
 	string "Defconfig name"
 	depends on BR2_LINUX_KERNEL_USE_DEFCONFIG
 	help
-	 Name of the defconfig file to use, without the trailing
-	 _defconfig
+	 Name of the kernel defconfig file to use, without the
+	 trailing _defconfig.  The defconfig is located in
+	 arch/<arch>/configs in the kernel tree.
 
 config BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE
 	string "Configuration file path"
-- 
tg: (830c586..) t/linux-clarify-defconfig (depends on: master)
