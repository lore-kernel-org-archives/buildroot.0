From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 12 Oct 2016 22:13:54 -0300
Subject: [Buildroot] [PATCH 3/8] poppler: add explicit cairo support
In-Reply-To: <1476321239-13894-1-git-send-email-gustavo@zacarias.com.ar>
References: <1476321239-13894-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1476321239-13894-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/poppler/poppler.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index c6cd2eb..4632d8d 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -14,6 +14,13 @@ POPPLER_INSTALL_STAGING = YES
 POPPLER_CONF_OPTS = --with-font-configuration=fontconfig \
 	--enable-xpdf-headers
 
+ifeq ($(BR2_PACKAGE_CAIRO),y)
+POPPLER_CONF_OPTS += --enable-cairo-output
+POPPLER_DEPENDENCIES += cairo
+else
+POPLER_CONF_OPTS += --disable-cairo-output
+endif
+
 ifeq ($(BR2_PACKAGE_LCMS2),y)
 POPPLER_CONF_OPTS += --enable-cms=lcms2
 POPPLER_DEPENDENCIES += lcms2
-- 
2.7.3
