From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 26 Apr 2015 22:31:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/gnuchess: needs c++
Message-ID: <1430080308-2444-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Quoted from ChangeLog:

2013-11-23  Antonio Ceballos  <aceballos@gmail.com>
[...]
    * doc/gnuchess.texi: frontend no longer compiled in C; now in C++.

Fixes
http://autobuild.buildroot.net/results/04e/04e7c14c20f0e056e63a712be3821a3f5c94cff1/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gnuchess/Config.in |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/gnuchess/Config.in b/package/gnuchess/Config.in
index 13ae801..aa446f4 100644
--- a/package/gnuchess/Config.in
+++ b/package/gnuchess/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_GNUCHESS
 	bool "gnuchess"
+	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_FLEX
 	help
@@ -7,5 +8,5 @@ config BR2_PACKAGE_GNUCHESS
 
 	  http://ftp.gnu.org/pub/gnu/chess
 
-comment "gnuchess needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "gnuchess needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.7.10.4
