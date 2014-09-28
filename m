From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Sep 2014 23:21:34 +0200
Subject: [Buildroot] [git commit] package/vde2: does not build on static
	only, needs dlopen()
Message-ID: <20140928212210.50DFC9D6C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ebec4b3835f3cd58cab0cbe0213877c4932280c5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
    http://autobuild.buildroot.net/results/f9d/f9d23455a138e2214546922486c03c9d3c35b04a/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vde2/Config.in |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/vde2/Config.in b/package/vde2/Config.in
index 2bbd822..18ff2e4 100644
--- a/package/vde2/Config.in
+++ b/package/vde2/Config.in
@@ -1,9 +1,14 @@
 config BR2_PACKAGE_VDE2
 	bool "vde2"
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_PREFER_STATIC_LIB # dlopen()
 	help
 	  VDE is an ethernet compliant virtual network that can be
 	  spawned over a set of physical computers over the Internet.
 	  VDE is part of the virtualsquare project.
 
 	  http://vde.sourceforge.net/
+
+comment "vde2 needs a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_PREFER_STATIC_LIB
