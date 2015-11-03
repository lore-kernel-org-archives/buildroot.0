From: Rodrigo Rebello <rprebello@gmail.com>
Date: Tue,  3 Nov 2015 17:45:05 -0200
Subject: [Buildroot] [PATCH 1/1] irssi: add missing dependency on
	host-pkgconf
Message-ID: <1446579905-31668-1-git-send-email-rprebello@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The irssi configure script uses pkg-config to detect the availability of
libglib2 and openssl.

Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
---
 package/irssi/irssi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/irssi/irssi.mk b/package/irssi/irssi.mk
index d38d917..6857a11 100644
--- a/package/irssi/irssi.mk
+++ b/package/irssi/irssi.mk
@@ -11,7 +11,7 @@ IRSSI_SOURCE = irssi-$(IRSSI_VERSION).tar.bz2
 IRSSI_SITE = http://pkgs.fedoraproject.org/repo/pkgs/irssi/$(IRSSI_SOURCE)/ecf64be47978d89a742b435a81cb47db
 IRSSI_LICENSE = GPLv2+
 IRSSI_LICENSE_FILES = COPYING
-IRSSI_DEPENDENCIES = libglib2 ncurses
+IRSSI_DEPENDENCIES = host-pkgconf libglib2 ncurses
 IRSSI_AUTORECONF = YES
 
 IRSSI_CONF_OPTS = \
-- 
2.1.4
