From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Apr 2015 21:32:59 +0200
Subject: [Buildroot] [git commit] lirc-tools: needs threads
Message-ID: <20150407193302.D8CA8819BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=39956bbae7eed612dd873c1f2777f5b55579cb36
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/c20/c20a98dfacfa79579a0d401e081f2cca13a7a7b0/
http://autobuild.buildroot.net/results/0fe/0fe9b4a3a5128844886e4bf89b5bc0d3008b43aa/
http://autobuild.buildroot.net/results/482/4826409b3d3177eff3e7f2c3b7360058c73fd406/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lirc-tools/Config.in |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/lirc-tools/Config.in b/package/lirc-tools/Config.in
index 0f58662..8ce83a0 100644
--- a/package/lirc-tools/Config.in
+++ b/package/lirc-tools/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIRC_TOOLS
 	bool "lirc-tools"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  LIRC is a package that supports receiving and sending IR
 	  signals of the most common IR remote controls. It contains a
@@ -13,3 +14,7 @@ config BR2_PACKAGE_LIRC_TOOLS
 	  enable the kernel drivers to support your hardware.
 
 	  http://www.lirc.org/
+
+comment "lirc-tools needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
