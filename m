From: Andreas Wetzel <andreas.wetzel@nanotronic.ch>
Date: Mon, 15 Apr 2013 10:31:25 +0200
Subject: [Buildroot] [PATCH 2/2] libwebsockets: do not build/install
	testapps to target
In-Reply-To: <1366014685-31187-1-git-send-email-andreas.wetzel@nanotronic.ch>
References: <1366014685-31187-1-git-send-email-andreas.wetzel@nanotronic.ch>
Message-ID: <1366014685-31187-2-git-send-email-andreas.wetzel@nanotronic.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Andreas Wetzel <andreas.wetzel@nanotronic.ch>
---
 package/libwebsockets/libwebsockets.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index e1f1efa..6672dbe 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -10,6 +10,7 @@ LIBWEBSOCKETS_LICENSE = LGPLv2.1
 LIBWEBSOCKETS_LICENSE_FILES = COPYING
 LIBWEBSOCKETS_DEPENDENCIES = zlib
 LIBWEBSOCKETS_AUTORECONF = YES
+LIBWEBSOCKETS_CONF_OPT = --without-testapps
 LIBWEBSOCKETS_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
-- 
1.7.10.4
