From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 19:48:12 +0100
Subject: [Buildroot] [git commit] package/weston: requires kernel headers >=
	3.0
Message-ID: <20140301193723.867FF96DFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5395f6d305850a0545864b7dda1fae8976ecdeba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It needs K_OFF, introduced in 2.6.39.

Since we do not have dependencies on kernel headers before 3.0,
just depend on kernel headers 3.0.

Fixes:
    http://autobuild.buildroot.net/results/aa5/aa54b1aaf0ac89531d7a1e7dd3900b35605ae3f5

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/weston/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

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
