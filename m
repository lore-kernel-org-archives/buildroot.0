From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 30 Mar 2014 20:36:44 +0200
Subject: [Buildroot] [PATCH 3/8] libdrm: Explain dependency on xorg in
	Kconfig
In-Reply-To: <1396204609-5042-1-git-send-email-bernd.kuhls@t-online.de>
References: <1396204609-5042-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1396204609-5042-3-git-send-email-bernd.kuhls@t-online.de>
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
index 7192e94..0a8c681 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -20,6 +20,9 @@ config BR2_PACKAGE_LIBDRM_INTEL
 	help
 	  installs intel graphics driver
 
+comment "libdrm intel driver depends on X.org"
+	depends on !BR2_PACKAGE_XORG7
+
 config BR2_PACKAGE_LIBDRM_RADEON
 	bool "radeon"
 	depends on BR2_i386 || BR2_x86_64
-- 
1.7.10.4
