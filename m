From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 May 2017 23:41:17 +0200
Subject: [Buildroot] [PATCH/next 2/9] package/c-icap: fix bzip2 configure
	option
In-Reply-To: <20170521214124.20328-1-bernd.kuhls@t-online.de>
References: <20170521214124.20328-1-bernd.kuhls@t-online.de>
Message-ID: <20170521214124.20328-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The configure option controlling bzip2 support got its current name in
2012 with its initial commit:

https://sourceforge.net/p/c-icap/code/890/#diff-2

This patch fixes the configure warning:

configure: WARNING: unrecognized options: [...] --without-bzip2

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/c-icap/c-icap.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/c-icap/c-icap.mk b/package/c-icap/c-icap.mk
index 466d08b50..7925f5bc3 100644
--- a/package/c-icap/c-icap.mk
+++ b/package/c-icap/c-icap.mk
@@ -36,10 +36,10 @@ C_ICAP_CONF_OPTS += --without-bdb
 endif
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
-C_ICAP_CONF_OPTS += --with-bzip2
+C_ICAP_CONF_OPTS += --with-bzlib
 C_ICAP_DEPENDENCIES += bzip2
 else
-C_ICAP_CONF_OPTS += --without-bzip2
+C_ICAP_CONF_OPTS += --without-bzlib
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-- 
2.11.0
