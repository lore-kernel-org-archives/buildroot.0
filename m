From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 13 Jun 2018 18:28:24 +0200
Subject: [Buildroot] [PATCH v3 4/6] package/asterisk: add optional
 dependency to speexdsp
In-Reply-To: <20180613162826.3490-1-bernd.kuhls@t-online.de>
References: <20180613162826.3490-1-bernd.kuhls@t-online.de>
Message-ID: <20180613162826.3490-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/9f6/9f61192382ea4b57b0f0548626968752363bb13f/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v3: no changes
v2: no changes

 package/asterisk/asterisk.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index f2f210b524..430b122655 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -229,7 +229,7 @@ else
 ASTERISK_CONF_OPTS += --without-ssl
 endif
 
-ifeq ($(BR2_PACKAGE_SPEEX),y)
+ifeq ($(BR2_PACKAGE_SPEEX)$(BR2_PACKAGE_SPEEXDSP),yy)
 ASTERISK_DEPENDENCIES += speex
 ASTERISK_CONF_OPTS += --with-speex --with-speexdsp
 else
-- 
2.17.1
