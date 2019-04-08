From: Vadim Kochan <vadim4j@gmail.com>
Date: Mon,  8 Apr 2019 03:28:21 +0300
Subject: [Buildroot] [PATCH 1/1] package/gettext-gnu: Fix typo
 BR2_PACKAGE_GETTEXT_GNU_PROVIDES_LIBINTL
Message-ID: <20190408002821.12763-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After commit:

	ea1e7ee606 package/gettext: turn into virtual package

package/gettext was renamed to package/gettext-gnu and introduced typo
BR2_PACKAGE_GETTEXT_GNU_PROVIDES_LIBINTL which should be
BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL (w/o "_GNU" part).

Reported-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 package/gettext-gnu/gettext-gnu.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gettext-gnu/gettext-gnu.mk b/package/gettext-gnu/gettext-gnu.mk
index 61adf72738..c63ad8cb36 100644
--- a/package/gettext-gnu/gettext-gnu.mk
+++ b/package/gettext-gnu/gettext-gnu.mk
@@ -42,7 +42,7 @@ HOST_GETTEXT_GNU_CONF_OPTS = \
 
 # Force the build of libintl, even if the C library provides a stub
 # gettext implementation
-ifeq ($(BR2_PACKAGE_GETTEXT_GNU_PROVIDES_LIBINTL),y)
+ifeq ($(BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL),y)
 GETTEXT_GNU_CONF_OPTS += --with-included-gettext
 else
 GETTEXT_GNU_CONF_OPTS += --without-included-gettext
-- 
2.14.1
