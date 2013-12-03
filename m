From: Sven Neumann <neumann@teufel.de>
Date: Tue, 03 Dec 2013 23:10:07 +0100
Subject: [Buildroot] [PATCH] alsa-utils: add dependency on host-pkgconf
Message-ID: <1386108607.6732.1.camel@bender.Speedport_W_724V_Typ_A_05011601_00_065>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The alsa-utils configure script will use pkg-config if available,
so make sure that it is available.

Signed-off-by: Sven Neumann <neumann@teufel.de>
---
 package/alsa-utils/alsa-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index b951112..e755adf 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -10,7 +10,7 @@ ALSA_UTILS_SITE = http://alsa.cybermirror.org/utils
 ALSA_UTILS_LICENSE = GPLv2
 ALSA_UTILS_LICENSE_FILES = COPYING
 ALSA_UTILS_INSTALL_STAGING = YES
-ALSA_UTILS_DEPENDENCIES = host-gettext alsa-lib \
+ALSA_UTILS_DEPENDENCIES = host-gettext host-pkgconf alsa-lib \
 	$(if $(BR2_PACKAGE_NCURSES),ncurses)
 
 ALSA_UTILS_CONF_ENV = \
-- 
1.8.4.2
