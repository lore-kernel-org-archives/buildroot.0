From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Oct 2015 16:39:08 +0200
Subject: [Buildroot] [git commit] libssh: needs shared library support
Message-ID: <20151002144250.B944C81DF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2b44749e9625d17eed450841c9c0cc85ac646129
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libssh builds libssh.so unconditionally.

Fixes:
http://autobuild.buildroot.net/results/7c7/7c7da08c71b5378b68631e3844088307080f6f9e/
http://autobuild.buildroot.net/results/a19/a19c619f4561f5426236b958f09cab4c095a63cc/
http://autobuild.buildroot.net/results/d6d/d6dd4a9b787d654b4173c03174a2fd72bdc017b3/

and more.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libssh/Config.in |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/libssh/Config.in b/package/libssh/Config.in
index e8ef602..30aabd6 100644
--- a/package/libssh/Config.in
+++ b/package/libssh/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBSSH
 	bool "libssh"
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS
 	# Either OpenSSL or libgcrypt are mandatory
 	select BR2_PACKAGE_LIBGCRYPT if !BR2_PACKAGE_OPENSSL
 	help
@@ -10,3 +11,7 @@ config BR2_PACKAGE_LIBSSH
 	  secure and transparent tunnel for your remote applications.
 
 	  http://www.libssh.org/
+
+comment "libssh needs a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS
