From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 28 Sep 2019 14:08:35 +0200
Subject: [Buildroot] [PATCH 3/3] package/brltty: add pcre optional dependency
In-Reply-To: <20190928120835.29302-1-fontaine.fabrice@gmail.com>
References: <20190928120835.29302-1-fontaine.fabrice@gmail.com>
Message-ID: <20190928120835.29302-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

pcre/pcre2 has been added in version 6.0 with:
- https://github.com/brltty/brltty/commit/579cae458ad9e47a689c7063e600d7bc492cb176
- https://github.com/brltty/brltty/commit/e7f36c00dbfb2030ad67b9b7e159c6d847f1d7d9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/brltty/brltty.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/brltty/brltty.mk b/package/brltty/brltty.mk
index aee18d0b9a..b9d608b9f5 100644
--- a/package/brltty/brltty.mk
+++ b/package/brltty/brltty.mk
@@ -78,6 +78,16 @@ else
 BRLTTY_CONF_OPTS += --without-curses
 endif
 
+ifeq ($(BR2_PACKAGE_PCRE2_32),y)
+BRLTTY_DEPENDENCIES += pcre2
+BRLTTY_CONF_OPTS += --with-rgx-package
+else ifeq ($(BR2_PACKAGE_PCRE_32),y)
+BRLTTY_DEPENDENCIES += pcre
+BRLTTY_CONF_OPTS += --with-rgx-package
+else
+BRLTTY_CONF_OPTS += --without-rgx-package
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 BRLTTY_DEPENDENCIES += systemd
 BRLTTY_CONF_OPTS += --with-service-package
-- 
2.23.0
