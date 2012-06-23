From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 23 Jun 2012 10:00:50 +0200
Subject: [Buildroot] [git commit] axel: needs thread support
Message-ID: <20120623080115.DAED8800DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=da76330445f1aa044702f08afd8d57d164b6df07
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/28d84d05e1a52a9ddec5956c946d99e8cd8c8fd7/build-end.log

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/axel/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/axel/Config.in b/package/axel/Config.in
index cb9af32..98f4941 100644
--- a/package/axel/Config.in
+++ b/package/axel/Config.in
@@ -2,7 +2,11 @@ config BR2_PACKAGE_AXEL
 	bool "axel"
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  HTTP/FTP download accelerator.
 
 	  http://axel.alioth.debian.org/
+
+comment "axel needs a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
