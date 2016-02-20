From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2016 17:40:08 +0100
Subject: [Buildroot] [PATCH 5/8] package/links: add --with/--without-bzip2
In-Reply-To: <1455986411-14273-1-git-send-email-bernd.kuhls@t-online.de>
References: <1455986411-14273-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1455986411-14273-6-git-send-email-bernd.kuhls@t-online.de>
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
index 847d311..26af392 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -36,7 +36,10 @@ endif
 endif
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
+LINKS_CONF_OPTS += --with-bzip2
 LINKS_DEPENDENCIES += bzip2
+else
+LINKS_CONF_OPTS += --without-bzip2
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEVENT),y)
-- 
2.7.0
