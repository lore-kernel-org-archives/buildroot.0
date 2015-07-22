From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 22 Jul 2015 11:08:26 -0300
Subject: [Buildroot] [PATCH] heimdal: disable parallel build
Message-ID: <1437574106-12404-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It still seems to have issues, so disable it pending more patches and
testing. Fixes:
http://autobuild.buildroot.net/results/a07/a07198b3f7f8029d80863a998814877ec9994c60/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/heimdal/heimdal.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/heimdal/heimdal.mk b/package/heimdal/heimdal.mk
index 8296448..626e68e 100644
--- a/package/heimdal/heimdal.mk
+++ b/package/heimdal/heimdal.mk
@@ -24,6 +24,7 @@ HOST_HEIMDAL_CONF_OPTS = \
 	--without-x \
 	--disable-heimdal-documentation
 HOST_HEIMDAL_CONF_ENV = MAKEINFO=true
+HEIMDAL_MAKE = $(MAKE1)
 HEIMDAL_LICENSE = BSD-3c
 HEIMDAL_LICENSE_FILES = LICENSE
 # 0002-kadm5-fix-race-in-Makefile-with-kadm5_err.h.patch
-- 
2.3.6
