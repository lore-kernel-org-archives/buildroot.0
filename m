From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Fri, 28 Jun 2013 20:52:37 +0200
Subject: [Buildroot] [PATCH 4/4] package/directfb: fixing typo in
	DIRECTFB_CONF_OPT
In-Reply-To: <1372445557-15546-1-git-send-email-c.schoenert@gmail.com>
References: <1372445557-15546-1-git-send-email-c.schoenert@gmail.com>
Message-ID: <1372445557-15546-4-git-send-email-c.schoenert@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carsten Schoenert <c.schoenert@gmail.com>

The DIRECTFB_CONF_OPT variable was missspelled for disabling the X11
support.

Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
---
 package/directfb/directfb.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 46f1eb9..c065eef 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -44,7 +44,7 @@ endif
 ifeq ($(BR2_PACKAGE_XSERVER),y)
 DIRECTFB_CONF_OPT += --enable-x11
 else
-DIRECTFB_CONF_OPT += -disable-x11
+DIRECTFB_CONF_OPT += --disable-x11
 endif
 
 ifeq ($(BR2_PACKAGE_DIRECTFB_UNIQUE),y)
-- 
1.7.10.4
