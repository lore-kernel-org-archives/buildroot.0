From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 May 2013 08:55:42 -0300
Subject: [Buildroot] [PATCHv2] python: remove smtpd.py
Message-ID: <1367841342-2564-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's mostly sample code, normally not used, and has a bad shebang line.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/python/python.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/python/python.mk b/package/python/python.mk
index 4876dd8..b942854 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -142,6 +142,13 @@ endef

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
