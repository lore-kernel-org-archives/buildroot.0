From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 21 May 2012 00:07:42 +0200
Subject: [Buildroot] [git commit branch/next] connman: tweak compiler
	version dependencies
Message-ID: <20120520220943.94AEE96D47@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=96b109ad2a4ea0a4575526f0d0353d916b5122dd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

uClibc 0.9.33+ has resolver support, so we don't need to depend on a
snapshot uClibc version any more. We're also using 0.9.33 for ctng, so
we can just disallow the old internal uClibc versions instead.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/connman/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index 2801b87..118ad91 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_CONNMAN
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_IPTABLES
-	depends on BR2_UCLIBC_VERSION_SNAPSHOT || BR2_TOOLCHAIN_EXTERNAL_GLIBC || BR2_TOOLCHAIN_CTNG_eglibc || BR2_TOOLCHAIN_CTNG_eglibc
+	depends on !(BR2_UCLIBC_VERSION_0_9_31 || BR2_UCLIBC_VERSION_0_9_32)
 	help
 	  The Connection Manager (ConnMan) project provides a daemon for
 	  managing internet connections within embedded devices running
@@ -44,4 +44,4 @@ config BR2_PACKAGE_CONNMAN_CLIENT
 endif # BR2_PACKAGE_CONNMAN
 
 comment "connman needs a toolchain with resolver support"
-	depends on !(BR2_UCLIBC_VERSION_SNAPSHOT || BR2_TOOLCHAIN_EXTERNAL_GLIBC || BR2_TOOLCHAIN_CTNG_eglibc || BR2_TOOLCHAIN_CTNG_eglibc)
+	depends on BR2_UCLIBC_VERSION_0_9_31 || BR2_UCLIBC_VERSION_0_9_32
