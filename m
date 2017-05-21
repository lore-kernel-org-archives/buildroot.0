From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 May 2017 23:41:24 +0200
Subject: [Buildroot] [PATCH/next 9/9] package/c-icap: add optional support
	for openssl
In-Reply-To: <20170521214124.20328-1-bernd.kuhls@t-online.de>
References: <20170521214124.20328-1-bernd.kuhls@t-online.de>
Message-ID: <20170521214124.20328-9-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Optional OpenSSL was added with version 0.5.1:
https://sourceforge.net/p/c-icap/news/2017/03/the-c-icap-051-is-released-/
https://sourceforge.net/p/c-icap/code/1253/#diff-5

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/c-icap/c-icap.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/c-icap/c-icap.mk b/package/c-icap/c-icap.mk
index 58127c151..efc511153 100644
--- a/package/c-icap/c-icap.mk
+++ b/package/c-icap/c-icap.mk
@@ -54,6 +54,13 @@ else
 C_ICAP_CONF_OPTS += --without-ldap
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+C_ICAP_CONF_OPTS += --with-openssl
+C_ICAP_DEPENDENCIES += openssl
+else
+C_ICAP_CONF_OPTS += --without-openssl
+endif
+
 ifeq ($(BR2_PACKAGE_PCRE),y)
 C_ICAP_CONF_OPTS += --with-pcre
 C_ICAP_DEPENDENCIES += pcre
-- 
2.11.0
