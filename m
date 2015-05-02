From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat,  2 May 2015 10:38:38 +0200
Subject: [Buildroot] [PATCH] network-manager: remove redundant dependencies
In-Reply-To: <20150502082317.22A878073F@busybox.osuosl.org>
References: <20150502082317.22A878073F@busybox.osuosl.org>
Message-ID: <1430555918-15398-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now network-manager depends on glibc, there is no need anymore for the
wchar and threads dependencies (implied by glibc). So remove them.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/network-manager/Config.in | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 41cd2d4..f6d8564 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -1,7 +1,5 @@
 config BR2_PACKAGE_NETWORK_MANAGER
 	bool "networkmanager"
-	depends on BR2_USE_WCHAR # libglib2 and gnutls
-	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
@@ -51,8 +49,8 @@ config BR2_PACKAGE_NETWORK_MANAGER_PPPD
 	  This option enables support for PPPD daemon
 endif
 
-comment "NetworkManager needs udev /dev management and a (e)glibc toolchain w/ wchar, threads, headers >= 3.7"
+comment "NetworkManager needs udev /dev management and a (e)glibc toolchain w/ headers >= 3.7"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7 || \
+	depends on !BR2_PACKAGE_HAS_UDEV || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7 || \
 		!BR2_TOOLCHAIN_USES_GLIBC
-- 
2.1.4
