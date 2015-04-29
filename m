From: Baptiste Moraine <baptiste.moraine@kapelse.com>
Date: Wed, 29 Apr 2015 15:39:00 +0200
Subject: [Buildroot] [PATCH 1/1] libwebsockets: add LWS_ prefix to
	LWS_WITHOUT_TESTAPPS=ON cmake option
Message-ID: <1430314740-6112-1-git-send-email-baptiste.moraine@kapelse.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, libwebsockets.mk is passing -DWITHOUT_TESTAPPS=ON to disable
the building of libwebsockets test applications, but this is doing nothing
because the option is really named  LWS_WITHOUT_TESTAPPS.
This commit fixes that by using the correct option name.

Signed-off-by: Baptiste Moraine <baptiste.moraine@kapelse.com>
---
 package/libwebsockets/libwebsockets.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index 9e62f1c..2f83748 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -11,7 +11,7 @@ LIBWEBSOCKETS_LICENSE = LGPLv2.1 with exceptions
 LIBWEBSOCKETS_LICENSE_FILES = LICENSE
 LIBWEBSOCKETS_DEPENDENCIES = zlib
 LIBWEBSOCKETS_INSTALL_STAGING = YES
-LIBWEBSOCKETS_CONF_OPTS = -DWITHOUT_TESTAPPS=ON -DLWS_IPV6=ON
+LIBWEBSOCKETS_CONF_OPTS = -DLWS_WITHOUT_TESTAPPS=ON -DLWS_IPV6=ON
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBWEBSOCKETS_DEPENDENCIES += openssl host-openssl
-- 
1.9.1
