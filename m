From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 6 May 2013 23:59:12 +0200
Subject: [Buildroot] [git commit] blackbox: needs mmu
Message-ID: <20130506221623.8FCB299C79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b9da3bab1efc5bedc49f5d31f30d32237de05872
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/644617ae64b39c57428c3e57115c3e6df5396d16/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/blackbox/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/blackbox/Config.in b/package/blackbox/Config.in
index 70f7eb4..c183133 100644
--- a/package/blackbox/Config.in
+++ b/package/blackbox/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_BLACKBOX
 	bool "blackbox"
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_XLIB_LIBX11
 	help
