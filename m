From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 Sep 2014 12:02:11 +0200
Subject: [Buildroot] [PATCH 1/2] package/pcre: add host variant
Message-ID: <1411898532-15625-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed by leafnode2.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/pcre/pcre.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index 2077896..297b13a 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -23,3 +23,4 @@ PCRE_CONF_OPT += $(if $(BR2_PACKAGE_PCRE_UTF),--enable-utf,--disable-utf)
 PCRE_CONF_OPT += $(if $(BR2_PACKAGE_PCRE_UCP),--enable-unicode-properties,--disable-unicode-properties)
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.7.10.4
