From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Apr 2018 11:26:09 +0200
Subject: [Buildroot] [git commit] qt5base: remove use of QT5BASE_EXTRA_CFLAGS
Message-ID: <20180409092611.53F8483CD4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d84edca974074467435891c0c81359db131ea239
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This variable was added as part of an EGL i.MX6 workaround in commit
(7e9f459adf), but appears to currently be abandonded and unused.  Remove the use
of the variable.

Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5base/qt5base.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index e6307fb3fe..1eabd7a15b 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -293,8 +293,8 @@ define QT5BASE_CONFIGURE_CMDS
 		-nomake tests \
 		-device buildroot \
 		-device-option CROSS_COMPILE="$(TARGET_CROSS)" \
-		-device-option BR_COMPILER_CFLAGS="$(TARGET_CFLAGS) $(QT5BASE_EXTRA_CFLAGS)" \
-		-device-option BR_COMPILER_CXXFLAGS="$(TARGET_CXXFLAGS) $(QT5BASE_EXTRA_CFLAGS)" \
+		-device-option BR_COMPILER_CFLAGS="$(TARGET_CFLAGS)" \
+		-device-option BR_COMPILER_CXXFLAGS="$(TARGET_CXXFLAGS)" \
 		$(QT5BASE_CONFIGURE_OPTS) \
 	)
 endef
