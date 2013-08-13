From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Aug 2013 10:16:11 +0200
Subject: [Buildroot] [git commit] imagemagick: fix magick++-config fixup
	error
Message-ID: <20130813082128.6C4929B2E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b339bb5641c59ad2e19aeb95c1387584c7c2aeab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Magic++ bindings are built only with C++ and WCHAR toolchains.
Add a WCHAR toolchain check for the magick++ config fixup.
Looking into the future the fixup shouldn't bail on a missing file so we
can avoid awkward kludges for packages that have many options and config
files.
Fixes:
http://autobuild.buildroot.net/results/33a/33ac4b17866a64379b7bab3c0549f6e075c98dde/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/imagemagick/imagemagick.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
 
