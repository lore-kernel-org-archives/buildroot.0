From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Oct 2014 22:26:59 +0200
Subject: [Buildroot] [PATCH v2 12/30] qt5: use the BR2_ARM_CPU_ARM* options
In-Reply-To: <1413923237-2861-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1413923237-2861-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1413923237-2861-13-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 83f02f1..0a8284f 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	# Javascript engine is only available on certain architectures
 	depends on BR2_arm || BR2_i386 || BR2_x86_64 || BR2_mipsel
 	# ARM needs BLX, so v5t+
-	depends on !(BR2_arm920t || BR2_arm922t || BR2_fa526)
+	depends on !BR2_ARM_CPU_ARMV4
 	default y
 
 comment "Qt5 needs a toolchain w/ wchar, IPv6, NPTL, C++"
-- 
2.0.0
