From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  1 May 2018 21:49:10 +0200
Subject: [Buildroot] [PATCH 1/1] msmtp: add optional libidn dependency
Message-ID: <20180501194910.25916-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/msmtp/msmtp.mk | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
index b7a830649d..65fd0e4319 100644
--- a/package/msmtp/msmtp.mk
+++ b/package/msmtp/msmtp.mk
@@ -8,9 +8,7 @@ MSMTP_VERSION = 1.6.6
 MSMTP_SITE = http://downloads.sourceforge.net/project/msmtp/msmtp/$(MSMTP_VERSION)
 MSMTP_SOURCE = msmtp-$(MSMTP_VERSION).tar.xz
 MSMTP_DEPENDENCIES = host-pkgconf
-MSMTP_CONF_OPTS = \
-	--without-libidn \
-	--disable-gai-idn
+MSMTP_CONF_OPTS = --disable-gai-idn
 MSMTP_LICENSE = GPL-3.0+
 MSMTP_LICENSE_FILES = COPYING
 
@@ -21,6 +19,13 @@ else
 MSMTP_CONF_OPTS += --without-libgsasl
 endif
 
+ifeq ($(BR2_PACKAGE_LIBIDN),y)
+MSMTP_CONF_OPTS += --with-libidn
+MSMTP_DEPENDENCIES += libidn
+else
+MSMTP_CONF_OPTS += --without-libidn
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSECRET),y)
 MSMTP_CONF_OPTS += --with-libsecret
 MSMTP_DEPENDENCIES += libsecret
-- 
2.14.1
