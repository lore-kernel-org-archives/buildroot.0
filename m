From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 02 Aug 2012 19:54:34 -0000
Subject: [Buildroot] [git commit branch/next] linux: clarify the
	BR2_LINUX_KERNEL_DEFCONFIG help text
Message-ID: <20120802195249.36C3A8E204@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8dfbaf20f546024acb8a03a82e676c7547c64ae6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The help text of BR2_LINUX_KERNEL_DEFCONFIG is confusing: it seems to
point to the defconfigs in the buildroot tree.  So explicitly refer to
the kernel tree in the help text.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

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
