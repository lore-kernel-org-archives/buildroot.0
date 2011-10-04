From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Oct 2011 00:15:47 +0200
Subject: [Buildroot] [git commit] imagemagick: add optional fftw support
Message-ID: <20111004222039.D2C5A8E10D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d1c54ade86e8cae6f0aa1bf1709941c70cea1af7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/imagemagick/imagemagick.mk |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 0bb76f3..b2a65e1 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -80,6 +80,15 @@ else
 IMAGEMAGICK_CONF_OPT += --without-tiff
 endif
 
+ifeq ($(BR2_PACKAGE_FFTW),y)
+# configure script misdetects these leading to build errors
+IMAGEMAGICK_CONF_ENV += ac_cv_func_creal=yes ac_cv_func_cimag=yes
+IMAGEMAGICK_CONF_OPT += --with-fftw
+IMAGEMAGICK_DEPENDENCIES += fftw
+else
+IMAGEMAGICK_CONF_OPT += --without-fftw
+endif
+
 define IMAGEMAGICK_REMOVE_CONFIG_SCRIPTS
 	$(RM) -f $(addprefix $(TARGET_DIR)/usr/bin/,	\
 		   $(addsuffix -config,			\
