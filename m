From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue,  3 Oct 2017 10:04:48 +0200
Subject: [Buildroot] [PATCH] wireguard: needs 3.10+ kernel
Message-ID: <20171003080448.3809-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The dependency is actually only for the kernel module (and thus on the
runtime kernel version rather than kernel headers), but as we don't know the
runtime version in kconfig this will have to do.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireguard/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/wireguard/Config.in b/package/wireguard/Config.in
index 0321755db3..acce6663ba 100644
--- a/package/wireguard/Config.in
+++ b/package/wireguard/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_WIREGUARD
 	bool "wireguard"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
 	select BR2_PACKAGE_LIBMNL
 	help
 	  WireGuard is an extremely simple yet fast and modern VPN
@@ -16,3 +17,6 @@ config BR2_PACKAGE_WIREGUARD
 	  VPN solution in the industry.
 
 	  https://www.wireguard.com
+
+comment "wireguard needs a toolchain w/ headers > 3.10"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
-- 
2.11.0
