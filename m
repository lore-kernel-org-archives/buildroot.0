From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Jun 2012 14:10:20 +0200
Subject: [Buildroot] [git commit] connman: fixup libglib2 (gettext)
	dependencies
Message-ID: <20120604121133.F421096E60@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fdba8d85e034d64abec25c791d34f91ac09f92ae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Connman was missing from commit b730010c90a (package: gettext needs
WCHAR support).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/connman/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index 3373ec1..ebe0cee 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_CONNMAN
 	select BR2_PACKAGE_IPTABLES
 	select BR2_PACKAGE_GNUTLS
 	depends on !(BR2_UCLIBC_VERSION_0_9_31 || BR2_UCLIBC_VERSION_0_9_32)
+	depends on BR2_USE_WCHAR # libglib2
 	help
 	  The Connection Manager (ConnMan) project provides a daemon for
 	  managing internet connections within embedded devices running
@@ -44,5 +45,5 @@ config BR2_PACKAGE_CONNMAN_CLIENT
 
 endif # BR2_PACKAGE_CONNMAN
 
-comment "connman needs a toolchain with resolver support"
-	depends on BR2_UCLIBC_VERSION_0_9_31 || BR2_UCLIBC_VERSION_0_9_32
+comment "connman needs a toolchain with WCHAR and resolver support"
+	depends on BR2_UCLIBC_VERSION_0_9_31 || BR2_UCLIBC_VERSION_0_9_32 || !BR2_USE_WCHAR
