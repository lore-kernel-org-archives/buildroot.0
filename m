From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Jan 2018 23:19:51 +0100
Subject: [Buildroot] [git commit] qt5: enable jscore/qt5declarative support
 for aarch64
Message-ID: <20180115221958.E67A183C64@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ec8f5db9bbd172b2cdb571727eef9819b836c4a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes [1] (as suggested by JD Conley <jd.conley@gmail.com>).

[1] https://bugs.busybox.net/show_bug.cgi?id=10541

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 8eb00ca..a9ee44c 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	bool
 	default y
 	# Javascript engine is only available on certain architectures
-	depends on BR2_arm || BR2_i386 || BR2_x86_64 || BR2_mipsel
+	depends on BR2_arm || BR2_aarch64 || BR2_i386 || BR2_x86_64 || BR2_mipsel
 	# ARM needs BLX, so v5t+
 	depends on !BR2_ARM_CPU_ARMV4
 
