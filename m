From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 28 Apr 2014 06:58:48 +0200
Subject: [Buildroot] [PATCH 1/1] libdrm/intel: Explain dependency on xorg in
	Kconfig only for BR2_i386/BR2_x86_64
Message-ID: <1398661128-3105-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Suggested by Yann: http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/82731

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libdrm/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index e6a7a42..3597831 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -22,6 +22,7 @@ config BR2_PACKAGE_LIBDRM_INTEL
 	  installs intel graphics driver
 
 comment "libdrm intel driver depends on X.org"
+	depends on BR2_i386 || BR2_x86_64
 	depends on !BR2_PACKAGE_XORG7
 
 config BR2_PACKAGE_LIBDRM_RADEON
-- 
1.7.10.4
