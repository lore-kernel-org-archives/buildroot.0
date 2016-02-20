From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2016 17:40:04 +0100
Subject: [Buildroot] [PATCH 1/8] package/links: add --with/--without-zlib
In-Reply-To: <1455986411-14273-1-git-send-email-bernd.kuhls@t-online.de>
References: <1455986411-14273-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1455986411-14273-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/links/links.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/links/links.mk b/package/links/links.mk
index 4d2cb2e..8d7ecba 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -52,7 +52,10 @@ LINKS_DEPENDENCIES += xz
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
+LINKS_CONF_OPTS += --with-zlib
 LINKS_DEPENDENCIES += zlib
+else
+LINKS_CONF_OPTS += --without-zlib
 endif
 
 $(eval $(autotools-package))
-- 
2.7.0
