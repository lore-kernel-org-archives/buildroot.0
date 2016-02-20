From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2016 17:40:05 +0100
Subject: [Buildroot] [PATCH 2/8] package/links: add --with/--without-lzma
In-Reply-To: <1455986411-14273-1-git-send-email-bernd.kuhls@t-online.de>
References: <1455986411-14273-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1455986411-14273-3-git-send-email-bernd.kuhls@t-online.de>
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
index 8d7ecba..3515e5f 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -48,7 +48,10 @@ LINKS_DEPENDENCIES += openssl
 endif
 
 ifeq ($(BR2_PACKAGE_XZ),y)
+LINKS_CONF_OPTS += --with-lzma
 LINKS_DEPENDENCIES += xz
+else
+LINKS_CONF_OPTS += --without-lzma
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-- 
2.7.0
