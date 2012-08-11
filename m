From: Jonathan Liu <net147@gmail.com>
Date: Sat, 11 Aug 2012 16:10:27 +1000
Subject: [Buildroot] [PATCH] python: fix interpreter directive for python
	scripts
Message-ID: <1344665427-27181-2-git-send-email-net147@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 package/python/python.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/python/python.mk b/package/python/python.mk
index fae4e5c..783b7b8 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -165,6 +165,13 @@ endef
 
 PYTHON_POST_INSTALL_TARGET_HOOKS += PYTHON_REMOVE_USELESS_FILES
 
+# Fix Python interpreter directive
+define PYTHON_FIX_INTERPRETER
+        sed -i '1s|#!.*python.*|#!/usr/bin/env python|' $(TARGET_DIR)/usr/bin/{easy_install,easy_install-2.7,idle,smtpd.py}
+endef
+
+PYTHON_POST_INSTALL_TARGET_HOOKS += PYTHON_FIX_INTERPRETER
+
 PYTHON_AUTORECONF = YES
 
 $(eval $(autotools-package))
-- 
1.7.11.3
