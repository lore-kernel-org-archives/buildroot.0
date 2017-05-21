From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 May 2017 23:41:16 +0200
Subject: [Buildroot] [PATCH/next 1/9] package/c-icap: fix berkeleydb
	configure option
Message-ID: <20170521214124.20328-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The configure option controlling berkeleydb support got its current
name in 2009: https://sourceforge.net/p/c-icap/code/322/

This patch fixes a configure warning:

configure: WARNING: unrecognized options: [...] --without-berkeleydb, [...]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/c-icap/c-icap.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/c-icap/c-icap.mk b/package/c-icap/c-icap.mk
index 17f3459ab..466d08b50 100644
--- a/package/c-icap/c-icap.mk
+++ b/package/c-icap/c-icap.mk
@@ -29,10 +29,10 @@ C_ICAP_CONF_ENV = ac_cv_10031b_ipc_sem=yes ac_cv_fcntl=yes
 C_ICAP_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
-C_ICAP_CONF_OPTS += --with-berkeleydb
+C_ICAP_CONF_OPTS += --with-bdb
 C_ICAP_DEPENDENCIES += berkeleydb
 else
-C_ICAP_CONF_OPTS += --without-berkeleydb
+C_ICAP_CONF_OPTS += --without-bdb
 endif
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
-- 
2.11.0
