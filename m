From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 11 Apr 2013 11:22:56 -0300
Subject: [Buildroot] [PATCH] alsa-utils: needs host-gettext
Message-ID: <1365690176-21313-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/31ca7306ca345bf057a844eab5b5d711e6c82842/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/alsa-utils/alsa-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/multimedia/alsa-utils/alsa-utils.mk b/package/multimedia/alsa-utils/alsa-utils.mk
index 6228574..84082d1 100644
--- a/package/multimedia/alsa-utils/alsa-utils.mk
+++ b/package/multimedia/alsa-utils/alsa-utils.mk
@@ -10,7 +10,7 @@ ALSA_UTILS_SITE = http://alsa.cybermirror.org/utils
 ALSA_UTILS_LICENSE = GPLv2
 ALSA_UTILS_LICENSE_FILES = COPYING
 ALSA_UTILS_INSTALL_STAGING = YES
-ALSA_UTILS_DEPENDENCIES = alsa-lib \
+ALSA_UTILS_DEPENDENCIES = host-gettext alsa-lib \
 	$(if $(BR2_PACKAGE_NCURSES),ncurses)
 
 ALSA_UTILS_CONF_ENV = \
-- 
1.8.1.5
