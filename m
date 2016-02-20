From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2016 18:09:01 +0100
Subject: [Buildroot] [PATCH 2/2] package/links: add optional support for gpm
In-Reply-To: <1455988141-6929-1-git-send-email-bernd.kuhls@t-online.de>
References: <1455988141-6929-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1455988141-6929-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/links/links.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/links/links.mk b/package/links/links.mk
index b62889f..28253fc 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -50,6 +50,13 @@ else
 LINKS_CONF_OPTS += --without-bzip2
 endif
 
+ifeq ($(BR2_PACKAGE_GPM),y)
+LINKS_CONF_OPTS += --with-gpm
+LINKS_DEPENDENCIES += gpm
+else
+LINKS_CONF_OPTS += --without-gpm
+endif
+
 ifeq ($(BR2_PACKAGE_LIBEVENT),y)
 LINKS_CONF_OPTS += --with-libevent
 LINKS_DEPENDENCIES += libevent
-- 
2.7.0
