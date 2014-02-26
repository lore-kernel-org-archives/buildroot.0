From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Feb 2014 09:47:21 +0100
Subject: [Buildroot] [git commit] imagemagick: use --without-bzlib when
	bzip2 is not selected
Message-ID: <20140226085041.EFF869BAE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6e048ce0c7780352f3dfb4f22e75b167202688a3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index c1e17c7..4f2a65f 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -115,7 +115,7 @@ ifeq ($(BR2_PACKAGE_BZIP2),y)
 IMAGEMAGICK_CONF_OPT += --with-bzlib
 IMAGEMAGICK_DEPENDENCIES += bzip2
 else
-IMAGEMAGICK_CONF_OPT += --without-bzip2
+IMAGEMAGICK_CONF_OPT += --without-bzlib
 endif
 
 $(eval $(autotools-package))
