From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Jun 2014 09:45:06 +0200
Subject: [Buildroot] [git commit] fmc: fmlib needs a linux kernel,
	so propagate dependency
Message-ID: <20140616075430.D9CE89CFF1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cc9726f7ff708e93bf479af55e396c3c4522dbc0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

At the same time fixup the comments to only be visible if we are
on a suitable arch.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fmc/Config.in |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/fmc/Config.in b/package/fmc/Config.in
index 35de28e..a50f80d 100644
--- a/package/fmc/Config.in
+++ b/package/fmc/Config.in
@@ -1,10 +1,16 @@
 comment "fmc needs a toolchain w/ C++"
+	depends on BR2_powerpc_e500mc
 	depends on !BR2_INSTALL_LIBSTDCPP
 
+comment "fmc needs a Linux kernel to be built"
+	depends on BR2_powerpc_e500mc
+	depends on !BR2_LINUX_KERNEL
+
 config BR2_PACKAGE_FMC
 	bool "fmc"
 	depends on BR2_powerpc_e500mc
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_LINUX_KERNEL # fmlib
 	select BR2_PACKAGE_TCLAP
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_FMLIB
