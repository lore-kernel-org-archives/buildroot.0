From: Olivier Valentin <ovalentin@awox.com>
Date: Tue, 25 Apr 2017 17:42:16 +0200
Subject: [Buildroot] libcurl: propagate buildroot debugging option
Message-ID: <6e5e28bc-b89a-931e-be6c-98c2ebb5434f@awox.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When buildroot has debugging enabled, let libcurl configure
its build accordingly.

Signed-off-by: Olivier Valentin <ovalentin@awox.com>
---
   package/libcurl/libcurl.mk | 4 ++++
   1 file changed, 4 insertions(+)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 6f4803e0c..cba771c61 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -22,6 +22,10 @@ LIBCURL_INSTALL_STAGING = YES
   LIBCURL_CONF_OPTS = --disable-manual --disable-ntlm-wb \
       --enable-hidden-symbols --with-random=/dev/urandom 
--disable-curldebug

+ifeq ($(BR2_ENABLE_DEBUG),y)
+LIBCURL_CONF_OPTS += --enable-debug
+endif
+
   ifeq ($(BR2_PACKAGE_LIBCURL_VERBOSE),y)
   LIBCURL_CONF_OPTS += --enable-verbose
   else
-- 
2.11.0
