From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  1 May 2018 21:01:32 +0200
Subject: [Buildroot] [PATCH 1/1] msmtp: add optional support for libgsasl
Message-ID: <20180501190132.983-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/msmtp/msmtp.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
index a1bd9e1437..b7a830649d 100644
--- a/package/msmtp/msmtp.mk
+++ b/package/msmtp/msmtp.mk
@@ -10,11 +10,17 @@ MSMTP_SOURCE = msmtp-$(MSMTP_VERSION).tar.xz
 MSMTP_DEPENDENCIES = host-pkgconf
 MSMTP_CONF_OPTS = \
 	--without-libidn \
-	--disable-gai-idn \
-	--without-libgsasl
+	--disable-gai-idn
 MSMTP_LICENSE = GPL-3.0+
 MSMTP_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_LIBGSASL),y)
+MSMTP_CONF_OPTS += --with-libgsasl
+MSMTP_DEPENDENCIES += libgsasl
+else
+MSMTP_CONF_OPTS += --without-libgsasl
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSECRET),y)
 MSMTP_CONF_OPTS += --with-libsecret
 MSMTP_DEPENDENCIES += libsecret
-- 
2.14.1
