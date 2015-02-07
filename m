From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Feb 2015 21:23:53 +0100
Subject: [Buildroot] [git commit] enlightenment: add missing indirect
	dependency on atomics
Message-ID: <20150207202910.A6E558046C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=25db4b974a583438926825137f9b02c09e3837c8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/enlightenment/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/enlightenment/Config.in b/package/enlightenment/Config.in
index f34140b..37e9e75 100644
--- a/package/enlightenment/Config.in
+++ b/package/enlightenment/Config.in
@@ -27,6 +27,8 @@ config BR2_PACKAGE_ENLIGHTENMENT
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_XORG7
 	depends on !BR2_avr32 # libevas
+	# libevas-generic-loaders-svg -> librsvg -> pango -> cairo
+	depends on BR2_ARCH_HAS_ATOMICS
 	help
 	  Enlightenment, also known simply as E, is a stacking window
 	  manager for the X Window System which can be used alone or
@@ -39,4 +41,5 @@ config BR2_PACKAGE_ENLIGHTENMENT
 comment "enlightenment needs a toolchain w/ wchar, C++, threads"
 	depends on BR2_PACKAGE_XORG7 && BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
+	depends on BR2_ARCH_HAS_ATOMICS
 	depends on !BR2_avr32
