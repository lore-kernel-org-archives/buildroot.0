From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 27 Apr 2014 12:35:13 +0200
Subject: [Buildroot] [PATCH 1/1] libdrm: Explain dependency on xorg in
	Kconfig
Message-ID: <1398594913-14255-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libdrm/Config.in |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index df95eec..e6a7a42 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -21,6 +21,9 @@ config BR2_PACKAGE_LIBDRM_INTEL
 	help
 	  installs intel graphics driver
 
+comment "libdrm intel driver depends on X.org"
+	depends on !BR2_PACKAGE_XORG7
+
 config BR2_PACKAGE_LIBDRM_RADEON
 	bool "radeon"
 	help
-- 
1.7.10.4
