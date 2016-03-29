From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 Mar 2016 11:39:09 -0300
Subject: [Buildroot] [PATCH v3 10/11] weston: handle systemd dependency
In-Reply-To: <1459262350-10974-1-git-send-email-gustavo@zacarias.com.ar>
References: <1459262350-10974-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1459262350-10974-11-git-send-email-gustavo@zacarias.com.ar>
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
index de734e0..9313fcc 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -109,4 +109,11 @@ else
 WESTON_CONF_OPTS += --disable-lcms
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+WESTON_CONF_OPTS += --enable-systemd-login --enable-systemd-notify
+WESTON_DEPENDENCIES += systemd
+else
+WESTON_CONF_OPTS += --disable-systemd-login --disable-systemd-notify
+endif
+
 $(eval $(autotools-package))
-- 
2.7.3
