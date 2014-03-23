From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Mar 2014 21:22:06 +0100
Subject: [Buildroot] [git commit] mtools: fix build when libiconv is enabled
Message-ID: <20140323202228.2349E9BE90@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6aee76bcad2022d7c9bd530bef9126ff57035d10
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/298/298858b6cc89438dcd044c74dff4231186a065e1/
http://autobuild.buildroot.net/results/7e7/7e7e7027226bb0251e32a90df2f00d9e84aedaaf/
http://autobuild.buildroot.net/results/c18/c18e7da16121417e597a153ce7dc2a3b64ece3b0/
http://autobuild.buildroot.net/results/b29/b29e80441ed87be651d720ae2dccf24d0f7fe8b6/

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mtools/mtools.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/mtools/mtools.mk b/package/mtools/mtools.mk
index 4880245..8649325 100644
--- a/package/mtools/mtools.mk
+++ b/package/mtools/mtools.mk
@@ -12,5 +12,11 @@ MTOOLS_LICENSE_FILES = COPYING
 MTOOLS_CONF_ENV = ac_cv_func_setpgrp_void=yes
 MTOOLS_CONF_OPT = --without-x
 
+# link with iconv if enabled
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+MTOOLS_DEPENDENCIES += libiconv
+MTOOLS_CONF_ENV += LIBS=-liconv
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
