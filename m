From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 May 2017 23:41:19 +0200
Subject: [Buildroot] [PATCH/next 4/9] package/c-icap: add optional support
	for pcre
In-Reply-To: <20170521214124.20328-1-bernd.kuhls@t-online.de>
References: <20170521214124.20328-1-bernd.kuhls@t-online.de>
Message-ID: <20170521214124.20328-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support for pcre was added in 2014:
https://sourceforge.net/p/c-icap/code/1135/#diff-4

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/c-icap/c-icap.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/c-icap/c-icap.mk b/package/c-icap/c-icap.mk
index 388979f3a..674192bf1 100644
--- a/package/c-icap/c-icap.mk
+++ b/package/c-icap/c-icap.mk
@@ -48,6 +48,13 @@ else
 C_ICAP_CONF_OPTS += --without-ldap
 endif
 
+ifeq ($(BR2_PACKAGE_PCRE),y)
+C_ICAP_CONF_OPTS += --with-pcre
+C_ICAP_DEPENDENCIES += pcre
+else
+C_ICAP_CONF_OPTS += --without-pcre
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 C_ICAP_CONF_OPTS += --with-zlib
 C_ICAP_DEPENDENCIES += zlib
-- 
2.11.0
