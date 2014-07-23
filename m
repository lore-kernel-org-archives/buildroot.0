From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jul 2014 20:38:45 +0200
Subject: [Buildroot] [PATCH] hostapd: EAP support needs shared library
	support
Message-ID: <1406140725-25153-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.org/results/dcb/dcbdc25cd5b46917c8f740d492db7512021462fa/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/hostapd/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
index eb530b3..8783e66 100644
--- a/package/hostapd/Config.in
+++ b/package/hostapd/Config.in
@@ -15,9 +15,13 @@ if BR2_PACKAGE_HOSTAPD
 
 config BR2_PACKAGE_HOSTAPD_EAP
 	bool "Enable EAP"
+	depends on !BR2_PREFER_STATIC_LIB
 	help
 	  Enable support for EAP and RADIUS.
 
+comment "hostapd EAP needs a toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB
+
 config BR2_PACKAGE_HOSTAPD_WPS
 	bool "Enable WPS"
 	help
-- 
2.0.0
