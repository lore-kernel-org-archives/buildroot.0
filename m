From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Jun 2017 12:02:50 +0200
Subject: [Buildroot] [git commit] upmpdcli: needs gcc >= 4.9
Message-ID: <20170622100249.63ED87FF1B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6309a6cc7ccd29e36acff4825a70ffd17297e97a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 5d043799cd changed the dependency for libupnpp on GCC to 4.9, but
did not propagate the dependency to upmpdcli.

Fixes:
http://autobuild.buildroot.net/results/df2/df23cd5e77f61caf3f30cf43c91bc161a88def3a/

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/upmpdcli/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/upmpdcli/Config.in b/package/upmpdcli/Config.in
index 4872034..cf85a79 100644
--- a/package/upmpdcli/Config.in
+++ b/package/upmpdcli/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_UPMPDCLI
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libupnpp, libmicrohttpd
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11, libupnpp
 	select BR2_PACKAGE_JSONCPP
 	select BR2_PACKAGE_LIBMICROHTTPD
 	select BR2_PACKAGE_LIBMPDCLIENT
@@ -15,6 +15,6 @@ config BR2_PACKAGE_UPMPDCLI
 
 	  http://www.lesbonscomptes.com/upmpdcli/
 
-comment "upmpdcli needs a toolchain w/ C++, threads, gcc >= 4.7"
+comment "upmpdcli needs a toolchain w/ C++, threads, gcc >= 4.9"
 	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
