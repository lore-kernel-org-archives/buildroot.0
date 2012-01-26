From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 27 Jan 2012 00:41:31 +0100
Subject: [Buildroot] [PATCH 5/6] network-manager: replace dependency on dbus
	by select
In-Reply-To: <1327621292-13580-1-git-send-email-arnout@mind.be>
References: <CAFbHwiTmVeZYM_OBKzzNLkdvbr30RG06wi8FxFzbhVhP9KcTbw@mail.gmail.com>
 <1327621292-13580-1-git-send-email-arnout@mind.be>
Message-ID: <1327621292-13580-5-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/network-manager/Config.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 6e51f53..9708a11 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_NETWORK_MANAGER
 	bool "NetworkManager"
 	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
-	depends on BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_DBUS
 	depends on BR2_INET_IPV6
 	depends on BR2_LARGEFILE # acl
 	depends on BR2_USE_WCHAR # libglib2
@@ -25,6 +25,6 @@ config BR2_PACKAGE_NETWORK_MANAGER
 
 	  http://projects.gnome.org/NetworkManager/
 
-comment "NetworkManager requires DBus and a toolchain with IPV6, LARGEFILE and WCHAR support"
-	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE || !BR2_USE_WCHAR || !BR2_PACKAGE_DBUS
+comment "NetworkManager requires a toolchain with IPV6, LARGEFILE and WCHAR support"
+	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE || !BR2_USE_WCHAR
 
-- 
1.7.8.3
