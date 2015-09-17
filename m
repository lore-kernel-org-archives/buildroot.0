From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Thu, 17 Sep 2015 14:23:35 +0200
Subject: [Buildroot] [PATCH v3 4/5] Enable xpdf-headers in poppler to enable
	building of cups-filters
In-Reply-To: <1442492616-12626-1-git-send-email-olivier.schonken@gmail.com>
References: <1442492616-12626-1-git-send-email-olivier.schonken@gmail.com>
Message-ID: <1442492616-12626-5-git-send-email-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add --enable-xpdf-headers to poppler.mk. Required for succesfull
build of cups-filters.

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
 package/poppler/poppler.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 6142cba..1113e4b 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -11,7 +11,8 @@ POPPLER_DEPENDENCIES = fontconfig host-pkgconf
 POPPLER_LICENSE = GPLv2+
 POPPLER_LICENSE_FILES = COPYING
 POPPLER_INSTALL_STAGING = YES
-POPPLER_CONF_OPTS = --with-font-configuration=fontconfig
+POPPLER_CONF_OPTS = --with-font-configuration=fontconfig \
+	--enable-xpdf-headers
 
 ifeq ($(BR2_PACKAGE_LCMS2),y)
 POPPLER_CONF_OPTS += --enable-cms=lcms2
-- 
1.9.1
