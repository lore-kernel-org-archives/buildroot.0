From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 20 Apr 2019 16:55:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/refpolicy: set python path
Message-ID: <20190420145533.15497-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set python path to $(HOST_DIR)/usr/bin/python to avoid build failures if
python3 found on host is broken

Fixes:
 - http://autobuild.buildroot.org/results/1f878405593dd05bb00fe0b06ca1c64ffbe6c572

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/refpolicy/refpolicy.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index 78c17bad01..1c3b1bc541 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -26,6 +26,7 @@ endif
 
 # Cannot use multiple threads to build the reference policy
 REFPOLICY_MAKE = \
+	PYTHON=$(HOST_DIR)/usr/bin/python \
 	TEST_TOOLCHAIN=$(HOST_DIR) \
 	$(TARGET_MAKE_ENV) \
 	$(MAKE1)
-- 
2.20.1
