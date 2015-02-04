From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed,  4 Feb 2015 01:34:17 +0100
Subject: [Buildroot] [PATCH 19/21] enlightenment: add missing indirect
	dependency on atomics
In-Reply-To: <1423010059-23446-1-git-send-email-arnout@mind.be>
References: <1423010059-23446-1-git-send-email-arnout@mind.be>
Message-ID: <1423010059-23446-20-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/enlightenment/Config.in | 3 +++
 1 file changed, 3 insertions(+)

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
-- 
2.1.4
