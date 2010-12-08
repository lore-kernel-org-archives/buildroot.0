From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Wed,  8 Dec 2010 10:54:06 +0100
Subject: [Buildroot] [PATCH 14/17] pango: ensure startup script is well
	installed
In-Reply-To: <1291802049-18764-1-git-send-email-llandwerlin@gmail.com>
References: <1291802049-18764-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1291802049-18764-15-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

In case /etc/init.d does not exist.

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/pango/pango.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 373eb8b..a350f92 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -55,6 +55,7 @@ else
 endif
 
 define PANGO_INSTALL_INITSCRIPT
+	$(INSTALL) -m 755 -d $(TARGET_DIR)/etc/init.d
 	$(INSTALL) -m 755 package/pango/S25pango $(TARGET_DIR)/etc/init.d/
 endef
 
-- 
1.7.2.3
