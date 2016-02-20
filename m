From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2016 17:40:07 +0100
Subject: [Buildroot] [PATCH 4/8] package/links: add --with/--without-libevent
In-Reply-To: <1455986411-14273-1-git-send-email-bernd.kuhls@t-online.de>
References: <1455986411-14273-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1455986411-14273-5-git-send-email-bernd.kuhls@t-online.de>
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
index 3a4519f..847d311 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -40,7 +40,10 @@ LINKS_DEPENDENCIES += bzip2
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEVENT),y)
+LINKS_CONF_OPTS += --with-libevent
 LINKS_DEPENDENCIES += libevent
+else
+LINKS_CONF_OPTS += --without-libevent
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-- 
2.7.0
