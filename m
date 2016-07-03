From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 Jul 2016 09:43:31 +0200
Subject: [Buildroot] [git commit] package/libbluray: fix comment
Message-ID: <20160703074906.0D5A780030@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=653b329336facfbb83faa1f1580c5271a980b1d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The comment was missing in menuconfig with a non-threaded toolchain
supporting dynamic linking.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libbluray/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/libbluray/Config.in b/package/libbluray/Config.in
index 357a562..b958935 100644
--- a/package/libbluray/Config.in
+++ b/package/libbluray/Config.in
@@ -8,5 +8,4 @@ config BR2_PACKAGE_LIBBLURAY
 	  http://www.videolan.org/developers/libbluray.html
 
 comment "libbluray needs a toolchain w/ threads, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
