From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 22:43:54 +0200
Subject: [Buildroot] [git commit] package/gnuchess: needs c++
Message-ID: <20150426204403.6BDBB818C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4d7fb0571e292b1ce80d08bcf5c274bbd89742b4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Quoted from ChangeLog:

2013-11-23  Antonio Ceballos  <aceballos@gmail.com>
[...]
    * doc/gnuchess.texi: frontend no longer compiled in C; now in C++.

Fixes
http://autobuild.buildroot.net/results/04e/04e7c14c20f0e056e63a712be3821a3f5c94cff1/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnuchess/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

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
