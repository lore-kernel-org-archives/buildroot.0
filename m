From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 16 Dec 2012 00:53:27 +0100
Subject: [Buildroot] [git commit] transmission: needs threads support in
	toolchain
Message-ID: <20121215235440.BE3F49A1A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4fe78ce36cf2d53ee7b7e9b719e0d56937c58941
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/b1010dcecc98d83f5d3d10d13b7b76b87a58d87c

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/transmission/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/transmission/Config.in b/package/transmission/Config.in
index e7e9f66..9284075 100644
--- a/package/transmission/Config.in
+++ b/package/transmission/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_TRANSMISSION
 	bool "transmission"
 	depends on BR2_INET_IPV6
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBCURL
@@ -44,5 +45,5 @@ comment "transmission-gtk requires a toolchain with locale support"
 	depends on BR2_PACKAGE_LIBGTK2 && !BR2_ENABLE_LOCALE
 endif
 
-comment "Transmission requires a toolchain with IPv6 support"
-	depends on !BR2_INET_IPV6
+comment "Transmission requires a toolchain with IPv6 and threads support"
+	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
