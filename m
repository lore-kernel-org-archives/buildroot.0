From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue,  3 Mar 2015 10:17:12 +0100
Subject: [Buildroot] [RFC v3 07/30] exim: use TARGET_LDFLAGS
In-Reply-To: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
References: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1425374255-6827-8-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is in order to support the per-package staging directory.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/exim/exim.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 34a6893..43867d5 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -65,6 +65,7 @@ endif
 define EXIM_CONFIGURE_TOOLCHAIN
 	$(call exim-config-add,CC,$(TARGET_CC))
 	$(call exim-config-add,CFLAGS,$(TARGET_CFLAGS))
+	$(call exim-config-add,LFLAGS,$(TARGET_LDFLAGS))
 	$(call exim-config-add,AR,$(TARGET_AR) cq)
 	$(call exim-config-add,RANLIB,$(TARGET_RANLIB))
 	$(call exim-config-add,HOSTCC,$(HOSTCC))
-- 
2.3.1
