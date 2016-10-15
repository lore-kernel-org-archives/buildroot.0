From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 11:33:49 +0200
Subject: [Buildroot] [git commit] poppler: add explicit cairo support
Message-ID: <20161015094202.C8AEF7FC3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab2c6b4b06be4cb8ebb7c3e8fe71372175562562
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
