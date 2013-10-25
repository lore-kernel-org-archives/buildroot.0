From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri, 25 Oct 2013 12:28:17 +0200
Subject: [Buildroot] [PATCH v2 1/2] pcre: add UTF support option
Message-ID: <1382696898-1901-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Add BR2_PACKAGE_PCRE_UTF option, that activates
--enable-unicode-properties for UTF-8/16/32.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/pcre/Config.in |    5 +++++
 package/pcre/pcre.mk   |    1 +
 2 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/pcre/Config.in b/package/pcre/Config.in
index dc92274..3ca27c0 100644
--- a/package/pcre/Config.in
+++ b/package/pcre/Config.in
@@ -19,4 +19,9 @@ config BR2_PACKAGE_PCRE_32
 	help
 	  This option builds the 32-bits pcre library, i.e 'libpcre32'
 
+config BR2_PACKAGE_PCRE_UTF
+	bool "UTF support"
+	help
+	  This option enables UTF support
+
 endif
diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index bf86a3d..0d1d66b 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -19,5 +19,6 @@ endif
 PCRE_CONF_OPT += --enable-pcre8
 PCRE_CONF_OPT += $(if $(BR2_PACKAGE_PCRE_16),--enable-pcre16,--disable-pcre16)
 PCRE_CONF_OPT += $(if $(BR2_PACKAGE_PCRE_32),--enable-pcre32,--disable-pcre32)
+PCRE_CONF_OPT += $(if $(BR2_PACKAGE_PCRE_UTF),--enable-unicode-properties,--disable-unicode-properties)
 
 $(eval $(autotools-package))
-- 
1.7.7
