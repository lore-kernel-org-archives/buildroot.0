From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 27 Feb 2015 23:25:48 +0100
Subject: [Buildroot] [PATCH v2 3/7] directfb: multi application core
	configure default changed
In-Reply-To: <1425075952-24699-1-git-send-email-ps.report@gmx.net>
References: <1425075952-24699-1-git-send-email-ps.report@gmx.net>
Message-ID: <1425075952-24699-3-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/directfb/directfb.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index ed997dc..1aeab9f 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -33,8 +33,10 @@ DIRECTFB_CONFIG_SCRIPTS = directfb-config
 DIRECTFB_DEPENDENCIES = freetype zlib
 
 ifeq ($(BR2_PACKAGE_DIRECTFB_MULTI),y)
-DIRECTFB_CONF_OPTS += --enable-multi --enable-fusion
+DIRECTFB_CONF_OPTS += --enable-multi --enable-multi-kernel
 DIRECTFB_DEPENDENCIES += linux-fusion
+else
+DIRECTFB_CONF_OPTS += --disable-multi --disable-multi-kernel
 endif
 
 ifeq ($(BR2_PACKAGE_DIRECTFB_DEBUG),y)
-- 
2.1.4
