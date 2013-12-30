From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Mon, 30 Dec 2013 18:57:52 +0100
Subject: [Buildroot] [PATCH 1/3] gnupg: depend on libiconv if appropriate
Message-ID: <BLU0-SMTP112B1A733C43DA19ABF8DF9D9CE0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/gnupg/gnupg.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gnupg/gnupg.mk b/package/gnupg/gnupg.mk
index 39a37d0..c334ac6 100644
--- a/package/gnupg/gnupg.mk
+++ b/package/gnupg/gnupg.mk
@@ -9,7 +9,7 @@ GNUPG_SOURCE = gnupg-$(GNUPG_VERSION).tar.bz2
 GNUPG_SITE = ftp://ftp.gnupg.org/gcrypt/gnupg
 GNUPG_LICENSE = GPLv3+
 GNUPG_LICENSE_FILES = COPYING
-GNUPG_DEPENDENCIES = zlib ncurses
+GNUPG_DEPENDENCIES = zlib ncurses $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 GNUPG_CONF_ENV = ac_cv_sys_symbol_underscore=no
 GNUPG_CONF_OPT = --disable-rpath --enable-minimal --disable-regex
 
-- 
1.7.9.5
