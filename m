From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed, 30 Oct 2013 09:00:13 +0100
Subject: [Buildroot] [PATCH v4 1/2] pcre: add UTF-8/16/32 support option
Message-ID: <1383120014-4127-1-git-send-email-yegorslists@googlemail.com>
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
Changes:
	v3: change option to "UTF-8/16/32 support"

 package/pcre/Config.in |    5 +++++
 package/pcre/pcre.mk   |    1 +
 2 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/pcre/Config.in b/package/pcre/Config.in
index dc92274..e49d693 100644
--- a/package/pcre/Config.in
+++ b/package/pcre/Config.in
@@ -19,4 +19,9 @@ config BR2_PACKAGE_PCRE_32
 	help
 	  This option builds the 32-bits pcre library, i.e 'libpcre32'
 
+config BR2_PACKAGE_PCRE_UTF
+	bool "UTF-8/16/32 support"
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
