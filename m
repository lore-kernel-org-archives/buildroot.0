From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Jun 2017 15:18:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/gettext: needs autoreconf after
	'update wint_t.m4 from gnulib' commit
Message-ID: <20170603131818.12872-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/ae7/ae743aaf5933c2e4a0bf3ca75aa93c16540422f8/

Reported-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gettext/gettext.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index b6663a6f2..498dfab8c 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -10,7 +10,8 @@ GETTEXT_SOURCE = gettext-$(GETTEXT_VERSION).tar.xz
 GETTEXT_INSTALL_STAGING = YES
 GETTEXT_LICENSE = LGPL-2.1+ (libintl), GPL-3.0+ (the rest)
 GETTEXT_LICENSE_FILES = COPYING gettext-runtime/intl/COPYING.LIB
-
+# 0002-Update-after-gnulib-changed.patch
+GETTEXT_AUTORECONF = YES
 GETTEXT_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
 # Avoid using the bundled subset of libxml2
-- 
2.11.0
