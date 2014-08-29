From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Aug 2014 09:51:48 +0200
Subject: [Buildroot] [PATCH] lftp: add missing host-pkgconf dependency
Message-ID: <1409298708-16291-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lftp configure.ac uses PKG_CHECK_MODULES, so it must have host-pkgconf
in its dependency, otherwise the autoreconf step fails due to the lack
of pkg.m4.

Fixes:

  http://autobuild.buildroot.org/results/b16/b16d964f275d4d8703665236b969cc19f7ef20be/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lftp/lftp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
index 431fadb..20ab400 100644
--- a/package/lftp/lftp.mk
+++ b/package/lftp/lftp.mk
@@ -9,7 +9,7 @@ LFTP_SITE    = http://lftp.yar.ru/ftp
 LFTP_LICENSE = GPLv3+
 LFTP_LICENSE_FILES = COPYING
 LFTP_AUTORECONF = YES
-LFTP_DEPENDENCIES  = readline zlib
+LFTP_DEPENDENCIES  = readline zlib host-pkgconf
 
 ifneq ($(BR2_PREFER_STATIC_LIB),y)
 LFTP_CONF_OPT += --with-modules
-- 
2.0.0
