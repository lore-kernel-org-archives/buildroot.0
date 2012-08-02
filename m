From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:52 -0000
Subject: [Buildroot] [git commit branch/next] connman: needs IPv6 support in
	toolchain
Message-ID: <20120802195235.9EA0296EA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=34ea3b3c6461423ba8ad43089a15498f8cc1eb32
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes http://autobuild.buildroot.net/results/c405f9b3a59463fb7367daeb63e282c5d60f0685

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/connman/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index ebe0cee..c9bc94f 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_CONNMAN
 	select BR2_PACKAGE_GNUTLS
 	depends on !(BR2_UCLIBC_VERSION_0_9_31 || BR2_UCLIBC_VERSION_0_9_32)
 	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_INET_IPV6
 	help
 	  The Connection Manager (ConnMan) project provides a daemon for
 	  managing internet connections within embedded devices running
@@ -45,5 +46,5 @@ config BR2_PACKAGE_CONNMAN_CLIENT
 
 endif # BR2_PACKAGE_CONNMAN
 
-comment "connman needs a toolchain with WCHAR and resolver support"
-	depends on BR2_UCLIBC_VERSION_0_9_31 || BR2_UCLIBC_VERSION_0_9_32 || !BR2_USE_WCHAR
+comment "connman needs a toolchain with IPv6, WCHAR and resolver support"
+	depends on BR2_UCLIBC_VERSION_0_9_31 || BR2_UCLIBC_VERSION_0_9_32 || !BR2_USE_WCHAR || !BR2_INET_IPV6
