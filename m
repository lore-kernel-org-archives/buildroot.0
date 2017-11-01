From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Nov 2017 14:03:19 +0100
Subject: [Buildroot] [git commit] cups: add dependency on threads
Message-ID: <20171101125647.5150C81046@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f04f2023fcf28aea133cef25466631f9e9f9ce7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/0f1cb8d72d0a78eb8b5c46548bc7c7bade93c674

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cups/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/cups/Config.in b/package/cups/Config.in
index 3f5460c..e23f069 100644
--- a/package/cups/Config.in
+++ b/package/cups/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_CUPS
 	bool "cups"
 	# needs libstdcpp for ppdc
 	depends on BR2_INSTALL_LIBSTDCPP
+	# needs threads for ippserver
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# needs fork()
 	depends on BR2_USE_MMU
 	help
@@ -9,5 +11,5 @@ config BR2_PACKAGE_CUPS
 
 	  http://www.cups.org
 
-comment "cups needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "cups needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
