From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  7 Jul 2018 18:08:55 +0200
Subject: [Buildroot] [PATCH 1/1] wampcc: needs atomic
Message-ID: <20180707160855.1179-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.net/results/2f994762d4e01a904c50cf2728a4103e6e79da2a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wampcc/wampcc.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/wampcc/wampcc.mk b/package/wampcc/wampcc.mk
index d8e093f679..dcd65f49d5 100644
--- a/package/wampcc/wampcc.mk
+++ b/package/wampcc/wampcc.mk
@@ -11,4 +11,9 @@ WAMPCC_INSTALL_STAGING = YES
 WAMPCC_LICENSE = MIT
 WAMPCC_LICENSE_FILES = LICENSE
 
+# Uses __atomic_fetch_add_8
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+WAMPCC_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
+endif
+
 $(eval $(cmake-package))
-- 
2.14.1
