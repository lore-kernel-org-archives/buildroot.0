From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Nov 2019 13:49:45 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/jailhouse: fix
 misc details in Config.in
Message-ID: <20191118124247.EE6F38F160@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d3dd70671bba0a8a04cd85ccaf1e6b608e11a0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

This commit fixes a number of small minor details in the jailhouse
Config.in file:

 - The Config.in comment is in the middle of the main
   BR2_PACKAGE_JAILHOUSE option and its sub-options, causing the
   sub-options to not be indented properly in menuconfig

 - jailhouse was capitalized as Jailhouse, while all Buildroot
   packages in menuconfig use small letters, so use "jailhouse"
   everywhere

 - no need to repeat "jailhouse" in the prompt of the sub-option for
   helper scripts, since it is not properly indented under the main
   jailhouse option. Ditto in the comment when python is disabled.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998 at free.fr:
  - further drop 'jailhouse' from the helper scripts comment when
    python is not enabled
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a1fddd832ea1e2955a75676f1e2d07244000c9b8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jailhouse/Config.in | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/jailhouse/Config.in b/package/jailhouse/Config.in
index d270a2ae8e..596b4951db 100644
--- a/package/jailhouse/Config.in
+++ b/package/jailhouse/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_JAILHOUSE
-	bool "Jailhouse"
+	bool "jailhouse"
 	depends on BR2_aarch64 || BR2_x86_64
 	depends on BR2_LINUX_KERNEL
 	help
@@ -7,14 +7,10 @@ config BR2_PACKAGE_JAILHOUSE
 
 	  https://github.com/siemens/jailhouse
 
-comment "Jailhouse needs a Linux kernel to be built"
-	depends on BR2_aarch64 || BR2_x86_64
-	depends on !BR2_LINUX_KERNEL
-
 if BR2_PACKAGE_JAILHOUSE
 
 config BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS
-	bool "Jailhouse helper scripts"
+	bool "helper scripts"
 	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON_MAKO # runtime
 	help
@@ -22,7 +18,11 @@ config BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS
 
 	  https://github.com/siemens/jailhouse
 
-comment "Jailhouse helper scripts require Python"
+comment "helper scripts require Python"
 	depends on !BR2_PACKAGE_PYTHON
 
 endif
+
+comment "jailhouse needs a Linux kernel to be built"
+	depends on BR2_aarch64 || BR2_x86_64
+	depends on !BR2_LINUX_KERNEL
