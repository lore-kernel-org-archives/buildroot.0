From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 22 Mar 2014 10:25:35 +0100
Subject: [Buildroot] [PATCH 1/1] mtools: fix build when libiconv is enabled
Message-ID: <BLU0-SMTP4782D7359774A02B96D8BD3D9780@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/298/298858b6cc89438dcd044c74dff4231186a065e1/
http://autobuild.buildroot.net/results/7e7/7e7e7027226bb0251e32a90df2f00d9e84aedaaf/
http://autobuild.buildroot.net/results/c18/c18e7da16121417e597a153ce7dc2a3b64ece3b0/
http://autobuild.buildroot.net/results/b29/b29e80441ed87be651d720ae2dccf24d0f7fe8b6/

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/mtools/mtools.mk |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/mtools/mtools.mk b/package/mtools/mtools.mk
index 4880245..e140054 100644
--- a/package/mtools/mtools.mk
+++ b/package/mtools/mtools.mk
@@ -12,5 +12,11 @@ MTOOLS_LICENSE_FILES = COPYING
 MTOOLS_CONF_ENV = ac_cv_func_setpgrp_void=yes
 MTOOLS_CONF_OPT = --without-x
 
+# link with iconv if enabled
+ifeq ($(BR2_PACKAGE_MTOOLS),y)
+MTOOLS_DEPENDENCIES += libiconv
+MTOOLS_CONF_ENV += LIBS=-liconv
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.7.10.4
