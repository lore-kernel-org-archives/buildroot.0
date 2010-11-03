From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Thu, 4 Nov 2010 00:03:52 +0100
Subject: [Buildroot] [git commit master 1/1] Makefile: compute the version
	string for all to use
Message-ID: <20101103230449.E79AF8CA74@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8258df279ab3e87ae1e9e63074ac93c8f3cf73c1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some packages use the buildroot version string (to set their own version
string). Computing the version string globally will makes it easy for
them to use it instead of re-computing it in every packages.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 8d53778..d6a7628 100644
--- a/Makefile
+++ b/Makefile
@@ -35,6 +35,10 @@ CONFIG_CONFIG_IN=Config.in
 CONFIG=package/config
 DATE:=$(shell date +%Y%m%d)
 
+# Compute the full local version string so packages can use it as-is
+# Need to export it, so it can be got from environment in children (eg. mconf)
+export BR2_VERSION_FULL:=$(BR2_VERSION)$(shell $(TOPDIR)/scripts/setlocalversion)
+
 noconfig_targets:=menuconfig nconfig gconfig xconfig config oldconfig randconfig \
 	defconfig %_defconfig savedefconfig allyesconfig allnoconfig silentoldconfig release \
 	randpackageconfig allyespackageconfig allnopackageconfig \
-- 
1.7.1
