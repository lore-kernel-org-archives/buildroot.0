From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 Aug 2014 10:11:45 +0200
Subject: [Buildroot] [git commit] synergy: needs mmu
Message-ID: <20140815090111.3529D9D462@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f588eaf8a54a5bf6b8d34ee908e3b64d3f8458e3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/8d4/8d435c1605204f154c8a0a94ebc06d9c29a1768a/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/synergy/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/synergy/Config.in b/package/synergy/Config.in
index 20a3a9a..6b64b79 100644
--- a/package/synergy/Config.in
+++ b/package/synergy/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_SYNERGY
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_XLIB_LIBXTST
 	help
 	  Synergy lets you easily share a single mouse and
@@ -14,4 +15,5 @@ config BR2_PACKAGE_SYNERGY
 
 comment "synergy needs a toolchain w/ C++, wchar"
 	depends on BR2_PACKAGE_XORG7
+	depends on BR2_USE_MMU
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR)
