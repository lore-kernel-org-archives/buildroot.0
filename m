From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 25 Sep 2017 10:27:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/poco: needs NPTL
Message-ID: <20170925082759.2237-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/609/6090f5a0f4bf96b9dc2b3e48eb2e33c83d2ba7d2/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/poco/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/poco/Config.in b/package/poco/Config.in
index b3b247f906..8e5209e786 100644
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
-- 
2.11.0
