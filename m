From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Apr 2015 09:48:45 +0200
Subject: [Buildroot] [git commit] mosquitto: remove ipv6 depends
Message-ID: <20150423074852.4B9E5800CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f593c61dce04b1cac5e56d00afb86c3eb8f89110
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The package was added after the last iteration of the non-ipv6
toolchain removal, so adjust it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mosquitto/Config.in |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index 8f579f8..50937d0 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_MOSQUITTO
 	bool "mosquitto"
 	depends on BR2_USE_MMU # fork()
-	depends on BR2_INET_IPV6
 	depends on !BR2_STATIC_LIBS # builds .so
 	help
 	  Mosquitto is an open source message broker that implements
@@ -14,6 +13,6 @@ config BR2_PACKAGE_MOSQUITTO
 
 	  http://mosquitto.org/
 
-comment "mosquitto needs a toolchain w/ IPv6, dynamic library"
+comment "mosquitto needs a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_INET_IPV6 || BR2_STATIC_LIBS
+	depends on BR2_STATIC_LIBS
