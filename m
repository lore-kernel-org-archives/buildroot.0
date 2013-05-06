From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 May 2013 08:48:43 -0300
Subject: [Buildroot] [PATCH] python: remove smtpd.py
Message-ID: <1367840923-19121-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's mostly sample code, normally not used, and has a bad shebang line.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/python/python.mk | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index 4876dd8..265b7d0 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -108,10 +108,6 @@ else
 PYTHON_CONF_OPT += --disable-zlib
 endif
 
-ifeq ($(BR2_PACKAGE_PYTHON_HASHLIB),y)
-PYTHON_DEPENDENCIES += openssl
-endif
-
 PYTHON_CONF_ENV += \
 	PYTHON_FOR_BUILD=$(HOST_PYTHON_DIR)/python \
 	PGEN_FOR_BUILD=$(HOST_PYTHON_DIR)/Parser/pgen \
@@ -142,6 +138,13 @@ endef
 
 PYTHON_POST_INSTALL_STAGING_HOOKS += PYTHON_FIXUP_LIBDIR
 
+# Bad shebang, normally not used
+define PYTHON_REMOVE_SMTPD
+	rm -f $(TARGET_DIR)/usr/bin/smtpd.py
+endef
+
+PYTHON_POST_INSTALL_TARGET_HOOKS += PYTHON_REMOVE_SMTPD
+
 #
 # Development files removal
 #
-- 
1.8.1.5
