From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Jun 2013 11:01:27 +0200
Subject: [Buildroot] [git commit] legacy: add options for the legacy Realtek
	WiFi options in linux-firmware
Message-ID: <20130605090359.87E769A95D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=860d37a27609a9d3040e19c82804ed506f41090b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in.legacy |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 7748ab3..bb9c4a9 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -41,6 +41,24 @@ comment "will fail.                                          "
 endif
 
 #
+# Legacy options since 2013.05
+#
+
+config BR2_PACKAGE_LINUX_FIRMWARE_RTL_8192
+	bool "Realtek 8192 replaced by Realtek 81xx"
+	select BR2_LEGACY
+	select BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX
+	help
+	  Now covers the whole Realtek 81xx familly: 8188/8192.
+
+config BR2_PACKAGE_LINUX_FIRMWARE_RTL_8712
+	bool "Realtek 8712 replaced by Realtek 87xx"
+	select BR2_LEGACY
+	select BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX
+	help
+	  Now covers the whole Realtek 87xx familly: 8712/8723.
+
+#
 # Legacy options since 2013.02
 #
 
