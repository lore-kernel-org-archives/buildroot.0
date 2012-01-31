From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 31 Jan 2012 12:24:22 +0100
Subject: [Buildroot] [git commit] connman: replace dependency on dbus by
	select
Message-ID: <20120131112714.7300290961@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=91a3f5aec6e901bff1892b3251896c6d6bd0b571
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/connman/Config.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index 237c30e..2801b87 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_CONNMAN
 	bool "connman"
-	depends on BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_IPTABLES
 	depends on BR2_UCLIBC_VERSION_SNAPSHOT || BR2_TOOLCHAIN_EXTERNAL_GLIBC || BR2_TOOLCHAIN_CTNG_eglibc || BR2_TOOLCHAIN_CTNG_eglibc
@@ -43,5 +43,5 @@ config BR2_PACKAGE_CONNMAN_CLIENT
 
 endif # BR2_PACKAGE_CONNMAN
 
-comment "connman needs DBus enabled and a toolchain with resolver support"
-	depends on !BR2_PACKAGE_DBUS || !(BR2_UCLIBC_VERSION_SNAPSHOT || BR2_TOOLCHAIN_EXTERNAL_GLIBC || BR2_TOOLCHAIN_CTNG_eglibc || BR2_TOOLCHAIN_CTNG_eglibc)
+comment "connman needs a toolchain with resolver support"
+	depends on !(BR2_UCLIBC_VERSION_SNAPSHOT || BR2_TOOLCHAIN_EXTERNAL_GLIBC || BR2_TOOLCHAIN_CTNG_eglibc || BR2_TOOLCHAIN_CTNG_eglibc)
