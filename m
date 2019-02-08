From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Feb 2019 15:05:44 +0100
Subject: [Buildroot] [git commit] package/mosquitto: fix comments
Message-ID: <20190208140417.DC7D08849D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ea989ad2b2c2361c47e269dd89cb559edf561db4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The toplevel mosquitto comment should go after the sub options to ensure
they get indented, and the broker comment should be hidden if mosquitto
isn't enabled.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mosquitto/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index 9052b3059b..11b6d7891b 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -12,9 +12,6 @@ config BR2_PACKAGE_MOSQUITTO
 
 	  http://mosquitto.org/
 
-comment "mosquitto needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
-
 config BR2_PACKAGE_MOSQUITTO_BROKER
 	bool "install the mosquitto broker"
 	default y
@@ -24,4 +21,7 @@ config BR2_PACKAGE_MOSQUITTO_BROKER
 	  Build and install the mosquitto broker onto target.
 
 comment "mosquitto broker needs a system with MMU"
-	depends on !BR2_USE_MMU
+	depends on BR2_PACKAGE_MOSQUTTO && !BR2_USE_MMU
+
+comment "mosquitto needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
