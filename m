From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 Jun 2016 13:18:35 +0200
Subject: [Buildroot] [git commit] pcmanfm: don't show comment about missing
	X.org
Message-ID: <20160630112034.EE69381F84@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=beddc22a7dbb91fc782759067372f711227d054c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The comments are meant for toolchain dependencies, not packages. Adjust the
logic to match what we do for other X11 applications.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pcmanfm/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/pcmanfm/Config.in b/package/pcmanfm/Config.in
index 149a595..ac68188 100644
--- a/package/pcmanfm/Config.in
+++ b/package/pcmanfm/Config.in
@@ -17,8 +17,9 @@ config BR2_PACKAGE_PCMANFM
 
 	  http://wiki.lxde.org/en/PCManFM
 
-comment "pcmanfm needs X.org and a toolchain w/ wchar, threads, C++"
+comment "pcmanfm needs a toolchain w/ wchar, threads, C++"
 	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_XORG7
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_XORG7
+		!BR2_TOOLCHAIN_HAS_THREADS
