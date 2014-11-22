From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 22 Nov 2014 13:52:25 +0100
Subject: [Buildroot] [git commit] package/weston: Fix wrong condition to
	display the comment
Message-ID: <20141122131802.F02C37FE2B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d52118ddd6f272201a4af43e71b2ee02f1d35707
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/weston/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index fafdf95..cf242d1 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -2,7 +2,7 @@ comment "weston needs udev and a toolchain w/ threads, dynamic library, headers
 	depends on !BR2_avr32
 	depends on BR2_ARCH_HAS_ATOMICS
 	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 || !BR2_PREFER_STATIC_LIB
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 || BR2_PREFER_STATIC_LIB
 
 config BR2_PACKAGE_WESTON
 	bool "weston"
