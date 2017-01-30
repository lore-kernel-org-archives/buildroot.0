From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 30 Jan 2017 15:44:43 -0300
Subject: [Buildroot] [PATCH] heimdal: disable parallel make
Message-ID: <20170130184443.1023-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It still seems to suffer from issues. Fixes:
http://autobuild.buildroot.net/results/e21/e2176cb5adacdad14371d4828f13a1c23f0e18d5/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/heimdal/heimdal.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/heimdal/heimdal.mk b/package/heimdal/heimdal.mk
index a20ec8f..5376a6c 100644
--- a/package/heimdal/heimdal.mk
+++ b/package/heimdal/heimdal.mk
@@ -8,6 +8,7 @@ HEIMDAL_VERSION = 7.1.0
 HEIMDAL_SITE = http://www.h5l.org/dist/src
 HOST_HEIMDAL_DEPENDENCIES = host-e2fsprogs host-ncurses host-pkgconf
 HEIMDAL_INSTALL_STAGING = YES
+HEIMDAL_MAKE = $(MAKE1)
 # static because of -fPIC issues with e2fsprogs on x86_64 host
 HOST_HEIMDAL_CONF_OPTS = \
 	--disable-shared \
-- 
2.10.2
