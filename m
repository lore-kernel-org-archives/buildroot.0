From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 10 Mar 2014 16:34:06 -0300
Subject: [Buildroot] [PATCH 2/2] socat: add optional openssl and readline
	support
In-Reply-To: <1394480046-3187-1-git-send-email-gustavo@zacarias.com.ar>
References: <1394480046-3187-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1394480046-3187-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/socat/socat.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index 6ae67a9..7172ea0 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -21,6 +21,18 @@ SOCAT_CONF_ENV = sc_cv_termios_ispeed=no \
 
 SOCAT_DEPENDENCIES = host-autoconf
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+	SOCAT_DEPENDENCIES += openssl
+else
+	SOCAT_CONF_OPT += --disable-openssl
+endif
+
+ifeq ($(BR2_PACKAGE_READLINE),y)
+	SOCAT_DEPENDENCIES += readline
+else
+	SOCAT_CONF_OPT += --disable-readline
+endif
+
 define SOCAT_RUN_AUTOCONF
 	(cd $(@D); $(HOST_DIR)/usr/bin/autoconf)
 endef
-- 
1.8.3.2
