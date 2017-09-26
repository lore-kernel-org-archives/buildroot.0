From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 27 Sep 2017 00:21:14 +0200
Subject: [Buildroot] [git commit] package/poco: needs NPTL
Message-ID: <20170926222615.5F8D18045D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ef5e6f2a55459983ea118a549c47359b0d38df2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/609/6090f5a0f4bf96b9dc2b3e48eb2e33c83d2ba7d2/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/poco/Config.in | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/poco/Config.in b/package/poco/Config.in
index b3b247f..9199b54 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -2,7 +2,8 @@ config BR2_PACKAGE_POCO
 	bool "poco"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	# pthread_condattr_setclock
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_STATIC_LIBS # dlopen()
 	depends on !(BR2_arc || BR2_bfin || BR2_microblaze || BR2_mipsel \
 		|| BR2_or1k || BR2_xtensa)
@@ -61,8 +62,8 @@ config BR2_PACKAGE_POCO_DATA_MYSQL
 
 endif # BR2_PACKAGE_POCO
 
-comment "poco needs a toolchain w/ wchar, threads, C++, dynamic library"
+comment "poco needs a toolchain w/ wchar, NPTL, C++, dynamic library"
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
 	depends on !(BR2_arc || BR2_bfin || BR2_microblaze || BR2_mipsel \
 		|| BR2_or1k || BR2_xtensa)
