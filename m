From: Ryan Coe <bluemrp9@gmail.com>
Date: Sun, 19 Apr 2015 10:53:23 -0700
Subject: [Buildroot] [PATCH 1/1] heimdal: needs host-flex and explicitly set
	-lpthread
Message-ID: <1429466003-4595-1-git-send-email-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
 package/heimdal/heimdal.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/heimdal/heimdal.mk b/package/heimdal/heimdal.mk
index 972f15c..c4a1703 100644
--- a/package/heimdal/heimdal.mk
+++ b/package/heimdal/heimdal.mk
@@ -6,11 +6,11 @@
 
 HEIMDAL_VERSION = 1.5.3
 HEIMDAL_SITE = http://www.h5l.org/dist/src
-HEIMDAL_DEPENDENCIES = host-e2fsprogs host-pkgconf
+HEIMDAL_DEPENDENCIES = host-e2fsprogs host-pkgconf host-flex
 HEIMDAL_INSTALL_STAGING = YES
 # static because of -fPIC issues with e2fsprogs on x86_64 host
 HOST_HEIMDAL_CONF_OPTS = --with-x=no --disable-shared --enable-static
-HOST_HEIMDAL_CONF_ENV = MAKEINFO=true
+HOST_HEIMDAL_CONF_ENV = MAKEINFO=true LIBS="-lpthread"
 HEIMDAL_MAKE = $(MAKE1)
 # For heimdal-0004-compile_et.patch
 HEIMDAL_AUTORECONF = YES
-- 
2.3.5
