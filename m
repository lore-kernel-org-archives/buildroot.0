From: Adam Duskett <aduskett@gmail.com>
Date: Wed,  8 Nov 2017 08:18:39 -0500
Subject: [Buildroot] [PATCH 1/1] ntp: implicitly enable openssl-random
Message-ID: <20171108131839.27491-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If OpenSSL is selected, --enable-openssl-random should be implicitly
set as well.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/ntp/ntp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 6605c3b85b..26d186e976 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -24,7 +24,7 @@ NTP_CONF_OPTS = \
 NTP_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-NTP_CONF_OPTS += --with-crypto
+NTP_CONF_OPTS += --with-crypto --enable-openssl-random
 NTP_DEPENDENCIES += openssl
 else
 NTP_CONF_OPTS += --without-crypto --disable-openssl-random
-- 
2.13.6
