From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 12 Aug 2013 09:06:58 -0300
Subject: [Buildroot] [PATCH] imagemagick: fix magick++-config fixup error
Message-ID: <1376309218-6060-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Magic++ bindings are built only with C++ and WCHAR toolchains.
Add a WCHAR toolchain check for the magick++ config fixup.
Looking into the future the fixup shouldn't bail on a missing file so we
can avoid awkward kludges for packages that have many options and config
files.
Fixes:
http://autobuild.buildroot.net/results/33a/33ac4b17866a64379b7bab3c0549f6e075c98dde/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/imagemagick/imagemagick.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 12b9f4b..2149574 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -19,7 +19,7 @@ IMAGEMAGICK_AUTORECONF = YES
 IMAGEMAGICK_CONFIG_SCRIPTS = \
 	$(addsuffix -config,Magick MagickCore MagickWand Wand)
 
-ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+ifeq ($(BR2_INSTALL_LIBSTDCPP)$(BR2_USE_WCHAR),yy)
 IMAGEMAGICK_CONFIG_SCRIPTS += Magick++-config
 endif
 
-- 
1.8.1.5
