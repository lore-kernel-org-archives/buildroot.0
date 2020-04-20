From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Apr 2020 07:51:08 +0200
Subject: [Buildroot] [git commit] package/python-greenlet: enable only on
 supported architectures
Message-ID: <20200420053725.044B98F385@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=30f1decec2ca190deea072f4d490a8de830ac9a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/4161bfcd9577cdc6b9795fc3d6903f3bcc124f99/
  http://autobuild.buildroot.net/results/be709462bbab54e4f405302d54d157218f867939/
  http://autobuild.buildroot.net/results/b0ca52e3948cbbc5bb8c6ce08932e355653b08d7/
  http://autobuild.buildroot.net/results/cd748aa26fdabcef72a581e1fe26edac14d07d2d/

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-greenlet/Config.in | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/package/python-greenlet/Config.in b/package/python-greenlet/Config.in
index ef82375b0b..44ab96b488 100644
--- a/package/python-greenlet/Config.in
+++ b/package/python-greenlet/Config.in
@@ -1,5 +1,18 @@
+config BR2_PACKAGE_PYTHON_GREENLET_ARCH_SUPPORTS
+	bool
+	default y if BR2_arm || BR2_armeb
+	default y if BR2_aarch64
+	default y if BR2_csky
+	default y if BR2_m68k
+	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	default y if BR2_riscv
+	default y if BR2_sparc || BR2_sparc64
+	default y if BR2_x86
+
 config BR2_PACKAGE_PYTHON_GREENLET
 	bool "python-greenlet"
+	depends on BR2_PACKAGE_PYTHON_GREENLET_ARCH_SUPPORTS
 	help
 	  Lightweight in-process concurrent programming.
 
