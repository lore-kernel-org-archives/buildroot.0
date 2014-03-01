From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  1 Mar 2014 15:53:06 +0100
Subject: [Buildroot] [PATCH 11/13] package/weston: requires kernel headers
	>= 3.0
In-Reply-To: <cover.1393685422.git.yann.morin.1998@free.fr>
References: <cover.1393685422.git.yann.morin.1998@free.fr>
Message-ID: <5ddf0e8063545185e06c96cd0da5631e2841feb9.1393685422.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

It needs K_OFF, introduced in 2.6.39.

Since we do not have dependencies on kernel headers before 3.0,
just depend on kernel headers 3.0.

Fixes:
    http://autobuild.buildroot.net/results/aa5/aa54b1aaf0ac89531d7a1e7dd3900b35605ae3f5

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/weston/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index 36bbb01..aaef405 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -1,6 +1,6 @@
-comment "weston needs udev and a toolchain w/ threads"
+comment "weston needs udev and a toolchain w/ threads, headers >= 3.0"
 	depends on !BR2_avr32
-	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 
 config BR2_PACKAGE_WESTON
 	bool "weston"
@@ -14,6 +14,7 @@ config BR2_PACKAGE_WESTON
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on !BR2_avr32 # wayland
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 	# Runtime dependency
 	select BR2_PACKAGE_XKEYBOARD_CONFIG
 	# Make sure at least one compositor is selected.
-- 
1.8.3.2
