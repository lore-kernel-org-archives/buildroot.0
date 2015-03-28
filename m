From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 28 Mar 2015 12:48:00 +0100
Subject: [Buildroot] [PATCH 3/4] package/wget: add host variant
In-Reply-To: <1427543281-11901-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427543281-11901-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1427543281-11901-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Let it depend on gnutls only to avoid certificate problems

For reference read
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=652480#20

This patch will fix download problems with powertop, like
http://autobuild.buildroot.net/results/962/962f6ab48f3414cf465dcd7c40ea19494b6be8b9//

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/wget/wget.mk |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index 742d81e..f842b65 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -38,4 +38,8 @@ ifneq ($(BR2_PACKAGE_OPENSSL),y)
 endif
 endif
 
+HOST_WGET_DEPENDENCIES += host-gnutls host-pkgconf
+HOST_WGET_CONF_OPTS += --with-ssl=gnutls --with-libgnutls-prefix=$(HOST_DIR)
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.7.10.4
