From: Ismael Luceno <ismael@iodev.co.uk>
Date: Tue,  5 Dec 2017 02:42:36 -0300
Subject: [Buildroot] [PATCH 2/3] axel: Fix OpenSSL dependency
In-Reply-To: <20171205054237.2150-1-ismael@iodev.co.uk>
References: <20171205054237.2150-1-ismael@iodev.co.uk>
Message-ID: <20171205054237.2150-2-ismael@iodev.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I got it wrong the first time, openssl is a virtual package.

Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
---
 package/axel/axel.mk | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index dcc8afd0b4a0..136c2e26eb08 100644
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -17,10 +17,7 @@ AXEL_CONF_OPTS = \
 	ac_cv_prog_cc_c99=-std=c99 \
 	CFLAGS="$(TARGET_CFLAGS)"
 
-ifeq ($(BR2_PACKAGE_LIBRESSL),y)
-AXEL_CONF_OPTS += --with-ssl
-AXEL_DEPENDENCIES += libressl
-else ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
 AXEL_CONF_OPTS += --with-ssl
 AXEL_DEPENDENCIES += openssl
 else
-- 
2.15.0
