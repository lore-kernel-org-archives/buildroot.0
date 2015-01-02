From: Samuel Martin <s.martin49@gmail.com>
Date: Fri,  2 Jan 2015 22:19:27 +0100
Subject: [Buildroot] [PATCH 2/3] package/openocd: disable aice programmer on
	non-MMU architecture
In-Reply-To: <1420233568-10133-1-git-send-email-s.martin49@gmail.com>
References: <1420233568-10133-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1420233568-10133-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

aice sources use fork function, which is only available on architecture
with MMU.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/openocd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openocd/Config.in b/package/openocd/Config.in
index 1f9889c..7c140c7 100644
--- a/package/openocd/Config.in
+++ b/package/openocd/Config.in
@@ -76,6 +76,7 @@ config BR2_PACKAGE_OPENOCD_OPENDOUS
 config BR2_PACKAGE_OPENOCD_AICE
 	bool "Andes JTAG Programmer"
 	select BR2_PACKAGE_LIBUSB
+	depends on BR2_USE_MMU # use fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	help
 	  Enable building support for the Andes JTAG
-- 
2.2.1
