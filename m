From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 24 Mar 2015 21:57:16 +0100
Subject: [Buildroot] [PATCH 1/1] package/powertop: needs gettextize
Message-ID: <1427230636-31933-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/8e7/8e7d1f039b57400b1a6f9c14755b35528a457031/
http://autobuild.buildroot.net/results/4e5/4e5a8f49c80c363b5fb35332e34206c9a4fe4120/
http://autobuild.buildroot.net/results/658/658e11f5b0bf3347a50a387b6271eb43c45025fb/
and many others

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/powertop/powertop.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/powertop/powertop.mk b/package/powertop/powertop.mk
index b253a56..4446bc9 100644
--- a/package/powertop/powertop.mk
+++ b/package/powertop/powertop.mk
@@ -13,6 +13,7 @@ POWERTOP_LICENSE_FILES = COPYING
 POWERTOP_AUTORECONF = YES
 
 ifeq ($(BR2_NEEDS_GETTEXT),y)
+POWERTOP_GETTEXTIZE = YES
 POWERTOP_DEPENDENCIES += gettext
 POWERTOP_CONF_ENV += LIBS='-lintl'
 endif
-- 
1.7.10.4
