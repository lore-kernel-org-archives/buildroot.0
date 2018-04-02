From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  2 Apr 2018 13:58:29 +0200
Subject: [Buildroot] [PATCH 4/4] package/ntp: add support for libressl
In-Reply-To: <20180402115829.16778-1-bernd.kuhls@t-online.de>
References: <20180402115829.16778-1-bernd.kuhls@t-online.de>
Message-ID: <20180402115829.16778-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ntp builds fine with current libressl 2.7.2.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ntp/ntp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index b5e2c1e026..77bb33a42f 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -22,7 +22,7 @@ NTP_CONF_OPTS = \
 # 0002-ntp-syscalls-fallback.patch
 NTP_AUTORECONF = YES
 
-ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
 NTP_CONF_OPTS += --with-crypto --enable-openssl-random
 NTP_DEPENDENCIES += openssl
 else
-- 
2.14.2
