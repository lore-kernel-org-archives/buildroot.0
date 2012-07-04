From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 4 Jul 2012 14:52:41 +0200
Subject: [Buildroot] [git commit] beecrypt: needs threads support
Message-ID: <20120704125534.D2FD38FA66@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f7ea7b227fc9c04fa85fd4a552ef9e5640abaf26
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/e28e5dfe73d838b8bc4e9c586bc865d57d717f76/build-end.log

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/beecrypt/Config.in |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/beecrypt/Config.in b/package/beecrypt/Config.in
index 2673877..19c7f2f 100644
--- a/package/beecrypt/Config.in
+++ b/package/beecrypt/Config.in
@@ -1,10 +1,14 @@
 config BR2_PACKAGE_BEECRYPT
 	bool "beecrypt"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_ICU if BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR
 	help
 	  Beecrypt is a general-purpose cryptography library.
 
 	  http://beecrypt.sf.net
 
+comment "beecrypt needs a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 comment "beecrypt C++ support requires a toolchain with WCHAR enabled"
-	depends on BR2_INSTALL_LIBSTDCPP && !BR2_USE_WCHAR
+	depends on BR2_INSTALL_LIBSTDCPP && !BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS
