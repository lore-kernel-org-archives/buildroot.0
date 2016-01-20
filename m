From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Thu, 21 Jan 2016 00:17:46 +0200
Subject: [Buildroot] [PATCH v4 4/5] Enable xpdf-headers in poppler to enable
	building of cups-filters
In-Reply-To: <1453328267-31962-1-git-send-email-olivier.schonken@gmail.com>
References: <1453328267-31962-1-git-send-email-olivier.schonken@gmail.com>
Message-ID: <1453328267-31962-5-git-send-email-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add --enable-xpdf-headers to poppler.mk. Required for succesfull
build of cups-filters.

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
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
2.5.0
