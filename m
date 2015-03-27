From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 27 Mar 2015 17:01:36 +0100
Subject: [Buildroot] [PATCH 1/2] package/powertop: needs ncursesw
Message-ID: <1427472097-30708-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/913/913cea22f8a8f5902d8da5f64c3fce056d66790f/
http://autobuild.buildroot.net/results/6e1/6e11fa2a7405a69c59ced046b92ff08660c4aab7/
http://autobuild.buildroot.net/results/1d3/1d3323b2afaefa7989854dbccf92015731199e66/
http://autobuild.buildroot.net/results/1e3/1e31d412d8b3a38a375ad0be8f696bee993ec297/
http://autobuild.buildroot.net/results/2ff/2ff511eb8d00b94aca68427446e2d0f6e4317a5a/
and maybe others

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/powertop/Config.in |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/powertop/Config.in b/package/powertop/Config.in
index f157f46..cee78e5 100644
--- a/package/powertop/Config.in
+++ b/package/powertop/Config.in
@@ -4,7 +4,9 @@ config BR2_PACKAGE_POWERTOP
 	depends on !BR2_bfin
 	# libnl dependency
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_WCHAR # ncurses
 	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_NCURSES_WCHAR
 	select BR2_PACKAGE_PCIUTILS
 	select BR2_PACKAGE_LIBNL
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
@@ -13,6 +15,6 @@ config BR2_PACKAGE_POWERTOP
 
 	  https://01.org/powertop/
 
-comment "powertop needs a toolchain w/ threads"
+comment "powertop needs a toolchain w/ threads, wchar"
 	depends on !BR2_bfin
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
-- 
1.7.10.4
