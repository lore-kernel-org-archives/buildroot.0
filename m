From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 23 May 2013 22:29:19 +0200
Subject: [Buildroot] [git commit] mongrel2: works on ARM with uClibc
Message-ID: <20130523205040.DC7789A4E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0f4d9ce54bd3012e4f543058ed80182dce5a1522
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Source code has workaround for missing {get,make,swap}context on ARM,
so mongrel2 doesn't need glibc/uclibc snapshot when built for ARM.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mongrel2/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/mongrel2/Config.in b/package/mongrel2/Config.in
index 034dbf9..cd93236 100644
--- a/package/mongrel2/Config.in
+++ b/package/mongrel2/Config.in
@@ -7,11 +7,12 @@ config BR2_PACKAGE_MONGREL2
 	depends on BR2_LARGEFILE # zeromq -> util-linux
 	depends on BR2_USE_WCHAR # zeromq -> util-linux
 	# {get,make,swap}context functions present in
-	# {e,}glibc and in uClibc's master branch.
+	# {e,}glibc and in uClibc's master branch. Source has arm workaround
 	depends on BR2_UCLIBC_VERSION_SNAPSHOT || \
 		BR2_TOOLCHAIN_EXTERNAL_GLIBC || \
 		BR2_TOOLCHAIN_CTNG_eglibc || \
-		BR2_TOOLCHAIN_CTNG_glibc
+		BR2_TOOLCHAIN_CTNG_glibc || \
+		BR2_arm
 	help
 	  Mongrel2 is an application, language, and network architecture
 	  agnostic web server that focuses on web applications using
