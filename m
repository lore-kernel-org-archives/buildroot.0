From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:46:47 -0500
Subject: [Buildroot] [PATCH 04/67] connman: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-5-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/connman/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index e0505b3..0853941 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_CONNMAN
 	depends on !BR2_UCLIBC_VERSION_0_9_32
 	depends on BR2_USE_WCHAR # libglib2 and gnutls
 	depends on BR2_INET_IPV6
-	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus
 	help
 	  The Connection Manager (ConnMan) project provides a daemon for
@@ -49,6 +49,6 @@ config BR2_PACKAGE_CONNMAN_CLIENT
 
 endif # BR2_PACKAGE_CONNMAN
 
-comment "connman needs a toolchain with IPv6, WCHAR, thread and resolver support"
+comment "connman needs a toolchain with IPv6, WCHAR, threading and resolver support"
 	depends on BR2_UCLIBC_VERSION_0_9_32 || \
 		!BR2_USE_WCHAR || !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.1.2
