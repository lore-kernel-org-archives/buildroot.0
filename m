From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Apr 2020 15:49:15 +0200
Subject: [Buildroot] [git commit] package/psplash: add host-gdk-pixbuf
 mandatory dependency
Message-ID: <20200411133515.E3C0F8E51D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4dcb7582a0af072ef7d592e1408c980d2a19cb0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gdk-pixbuf-csource is needed since
http://git.yoctoproject.org/cgit/cgit.cgi/psplash/commit/?id=f7a354dd7991bda57ab8b26d6491687d777f88da

Fixes:
 - http://autobuild.buildroot.org/results/cb46d93b90ca3b297d0e18fd84796660e20c3a52

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
