From: Joshua Henderson <joshua.henderson@microchip.com>
Date: Wed, 4 Apr 2018 15:30:16 -0700
Subject: [Buildroot] [PATCH] qt5base: remove use of QT5BASE_EXTRA_CFLAGS
Message-ID: <1522881016-6423-1-git-send-email-joshua.henderson@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This variable was added as part of an EGL i.MX6 workaround in commit
(7e9f459adf), but appears to currently be abandonded and unused.  Remove the use
of the variable.

Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
---
 package/qt5/qt5base/qt5base.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index a7eb0ec..750830a 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -296,8 +296,8 @@ define QT5BASE_CONFIGURE_CMDS
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
-- 
2.7.4
