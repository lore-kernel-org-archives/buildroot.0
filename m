From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 16 Mar 2020 20:15:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/wget: add optional dependency to
 libiconv
Message-ID: <20200316191527.551576-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

wget has an optional dependency to libiconv:
http://git.savannah.gnu.org/cgit/wget.git/tree/configure.ac#n344

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/wget/wget.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index 7b9c3e75d9..ed3f1fdff9 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -21,6 +21,10 @@ else
 WGET_CONF_OPTS += --without-ssl
 endif
 
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+WGET_DEPENDENCIES += libiconv
+endif
+
 ifeq ($(BR2_PACKAGE_LIBIDN2),y)
 WGET_CONF_OPTS += --with-libidn
 WGET_DEPENDENCIES += libidn2
-- 
2.25.0
