From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 Mar 2016 11:39:07 -0300
Subject: [Buildroot] [PATCH v3 08/11] weston: handle lcms dependecy
In-Reply-To: <1459262350-10974-1-git-send-email-gustavo@zacarias.com.ar>
References: <1459262350-10974-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1459262350-10974-9-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/weston/weston.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 72190a8..e3a8f29 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -101,4 +101,11 @@ else
 WESTON_CONF_OPTS += --disable-vaapi-recorder
 endif
 
+ifeq ($(BR2_PACKAGE_LCMS2),y)
+WESTON_CONF_OPTS += --enable-lcms
+WESTON_DEPENDENCIES += lcms2
+else
+WESTON_CONF_OPTS += --disable-lcms
+endif
+
 $(eval $(autotools-package))
-- 
2.7.3
