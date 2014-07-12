From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 12 Jul 2014 14:27:02 -0300
Subject: [Buildroot] [PATCH 1/3] gettext: add gettextize definition
Message-ID: <1405186024-8170-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To be used in pkg-autotools for AUTORECONF.
Also delete the "Press Return..." prompt to avoid user confusion.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gettext/gettext.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index 9d5d9f3..4385f10 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -69,8 +69,12 @@ endif
 # Disable interactive confirmation in host gettextize for package fixups
 define HOST_GETTEXT_GETTEXTIZE_CONFIRMATION
 	$(SED) '/read dummy/d' $(HOST_DIR)/usr/bin/gettextize
+	$(SED) '/Press Return/d' $(HOST_DIR)/usr/bin/gettextize
 endef
 HOST_GETTEXT_POST_INSTALL_HOOKS += HOST_GETTEXT_GETTEXTIZE_CONFIRMATION
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
+
+# variables used by other packages
+GETTEXTIZE = $(HOST_CONFIGURE_OPTS) $(HOST_DIR)/usr/bin/gettextize -f
-- 
1.8.5.5
