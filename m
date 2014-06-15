From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 15 Jun 2014 09:48:33 +0300
Subject: [Buildroot] [PATCH 2/2] hostapd: disable for avr32
In-Reply-To: <8a8b1c998ef9cf581c4e0b442da6f3e18e3c57bb.1402814913.git.baruch@tkos.co.il>
References: <8a8b1c998ef9cf581c4e0b442da6f3e18e3c57bb.1402814913.git.baruch@tkos.co.il>
Message-ID: <717bd918392d0e89e911a125e21bbfd2b9261d2b.1402814913.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/hostapd/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
index eb530b3..5b57544 100644
--- a/package/hostapd/Config.in
+++ b/package/hostapd/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HOSTAPD
 	bool "hostapd"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
+	depends on !BR2_avr32 # no epoll_create1
 	select BR2_PACKAGE_LIBNL
 	help
 	  User space daemon for wireless access points.
@@ -27,3 +28,4 @@ endif
 
 comment "hostapd needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_avr32
-- 
2.0.0
