From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 9 Jul 2015 08:55:16 +0200
Subject: [Buildroot] [git commit] openssl: drop !static dependency from
	OPENSSL_BIN option
Message-ID: <20150709065651.44B3F7FFA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ecd8e9b238fdac958a9174984c8e64e79c866ebe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The dependency doesn't make sense now that the option only controls if the
built binary gets installed into the target or not, so drop it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssl/Config.in |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index 0785253..e08b648 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -15,15 +15,11 @@ if BR2_PACKAGE_OPENSSL
 
 config BR2_PACKAGE_OPENSSL_BIN
 	bool "openssl binary"
-	depends on !BR2_STATIC_LIBS
 	help
 	  Install the openssl binary and the associated helper scripts to the
 	  target file system. This is a command line tool for doing various
 	  cryptographic stuff.
 
-comment "openssl binary needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
-
 config BR2_PACKAGE_OPENSSL_ENGINES
 	bool "openssl additional engines"
 	help
