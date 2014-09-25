From: Yuvaraj Patil <yuvaraj.patil@wipro.com>
Date: Thu, 25 Sep 2014 19:33:57 +0530
Subject: [Buildroot] [PATCH] gd: link with pthread to avoid build failure
Message-ID: <1411653837-2593-1-git-send-email-yuvaraj.patil@wipro.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Link this package with pthread option.

Fixes:
http://autobuild.buildroot.net/results/0e2/0e2b28e8561c6f7623185c35eb24bea573b79d11//

Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>
---
 package/gd/gd.mk |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/gd/gd.mk b/package/gd/gd.mk
index 0c03ad4..31d7954 100644
--- a/package/gd/gd.mk
+++ b/package/gd/gd.mk
@@ -47,6 +47,12 @@ ifeq ($(BR2_PACKAGE_ZLIB),y)
 GD_DEPENDENCIES += zlib
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+GD_CONF_ENV += LIBS='-pthread'
+else
+GD_CONF_OPT += --disable-thread-safety
+endif
+
 GD_TOOLS_$(BR2_PACKAGE_GD_ANNOTATE)	+= annotate
 GD_TOOLS_$(BR2_PACKAGE_GD_BDFTOGD)	+= bdftogd
 GD_TOOLS_$(BR2_PACKAGE_GD_GD2COPYPAL)	+= gd2copypal
-- 
1.7.9.5
