From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Jul 2013 19:07:15 +0200
Subject: [Buildroot] [git commit] qt5jsbackend: needs ARM v5+
Message-ID: <20130731170723.0EF429AF57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2eac7aea23f2377c63a11d0c432ebdcaaccc40f1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Just like nodejs and other v8-based javascript engines for ARM interwork
it needs the BLX instruction which is only available on V5+ cores.
Fixes:
http://autobuild.buildroot.net/results/853/853cd29bf427902b2cb82a101964a4e45714cb86/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5jsbackend/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/qt5/qt5jsbackend/Config.in b/package/qt5/qt5jsbackend/Config.in
index 2f5ac1f..d9301d0 100644
--- a/package/qt5/qt5jsbackend/Config.in
+++ b/package/qt5/qt5jsbackend/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_QT5JSBACKEND_AVAILABLE
 	bool
 	# v8 is only available on certain architectures
 	depends on BR2_arm || BR2_i386 || BR2_x86_64 || BR2_mipsel
+	# ARM needs BLX, so v5t+
+	depends on !(BR2_arm7tdmi || BR2_arm720t || BR2_arm920t || BR2_arm922t || BR2_fa526)
 	default y
 
 config BR2_PACKAGE_QT5JSBACKEND
