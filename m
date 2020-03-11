From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 11 Mar 2020 23:08:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/psplash: add host-gdk-pixbuf
 mandatory dependency
Message-ID: <20200311220808.1079295-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gdk-pixbuf-csource is needed since
http://git.yoctoproject.org/cgit/cgit.cgi/psplash/commit/?id=f7a354dd7991bda57ab8b26d6491687d777f88da

Fixes:
 - http://autobuild.buildroot.org/results/cb46d93b90ca3b297d0e18fd84796660e20c3a52

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/psplash/psplash.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/psplash/psplash.mk b/package/psplash/psplash.mk
index 39fcc2235f..a0f01869b4 100644
--- a/package/psplash/psplash.mk
+++ b/package/psplash/psplash.mk
@@ -9,7 +9,7 @@ PSPLASH_SITE = git://git.yoctoproject.org/psplash
 PSPLASH_LICENSE = GPL-2.0+
 PSPLASH_LICENSE_FILES = COPYING
 PSPLASH_AUTORECONF = YES
-PSPLASH_DEPENDENCIES = host-pkgconf
+PSPLASH_DEPENDENCIES = host-gdk-pixbuf host-pkgconf
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 PSPLASH_DEPENDENCIES += systemd
-- 
2.25.1
