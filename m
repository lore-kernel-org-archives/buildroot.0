From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Apr 2016 21:36:43 +0200
Subject: [Buildroot] [git commit] mosh: requires wchar
Message-ID: <20160405194001.EE872804F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a8e7d93e0325c18229fc01569255b064e107133
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/dc6/dc60afdf2b6035cd72567cf37b837db087c79bea/
http://autobuild.buildroot.net/results/624/624a1fcae9633940714ae4e8ad9864e9611e93ec/
http://autobuild.buildroot.net/results/e95/e95c8cff40c87f167f82e37430ebd1f37c8c242e/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mosh/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/mosh/Config.in b/package/mosh/Config.in
index 26f7233..b4189ee 100644
--- a/package/mosh/Config.in
+++ b/package/mosh/Config.in
@@ -1,6 +1,6 @@
-comment "mosh needs a toolchain w/ C++, threads, dynamic library"
+comment "mosh needs a toolchain w/ C++, threads, dynamic library, wchar"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP \
-		|| BR2_STATIC_LIBS
+		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 
 config BR2_PACKAGE_MOSH
@@ -9,6 +9,7 @@ config BR2_PACKAGE_MOSH
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf
 	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf
 	depends on !BR2_STATIC_LIBS # protobuf
+	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_PROTOBUF
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_OPENSSL
