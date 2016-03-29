From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 Mar 2016 11:39:03 -0300
Subject: [Buildroot] [PATCH v3 04/11] weston: handle optional libva support
In-Reply-To: <1459262350-10974-1-git-send-email-gustavo@zacarias.com.ar>
References: <1459262350-10974-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1459262350-10974-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's used for the recorder.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/weston/weston.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index d600bc3..08c6337 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -75,4 +75,11 @@ else
 WESTON_CONF_OPTS += --disable-rpi-compositor
 endif # BR2_PACKAGE_WESTON_RPI
 
+ifeq ($(BR2_PACKAGE_LIBVA),y)
+WESTON_CONF_OPTS += --enable-vaapi-recorder
+WESTON_DEPENDENIES += libva
+else
+WESTON_CONF_OPTS += --disable-vaapi-recorder
+endif
+
 $(eval $(autotools-package))
-- 
2.7.3
