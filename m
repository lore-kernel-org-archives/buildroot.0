From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu,  4 Jun 2015 06:10:09 +0200
Subject: [Buildroot] [PATCH] package/scons: reduce output when being silent
Message-ID: <1433391009-24655-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use the "-s" option to reduce scons output when it is a silent build.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/scons/scons.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index e418530..39fb258 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -18,4 +18,4 @@ HOST_SCONS_INSTALL_OPTS = \
 $(eval $(host-python-package))
 
 # variables used by other packages
-SCONS = $(HOST_DIR)/usr/bin/python2 $(HOST_DIR)/usr/bin/scons
+SCONS = $(HOST_DIR)/usr/bin/python2 $(HOST_DIR)/usr/bin/scons $(if $(QUIET),-s)
-- 
2.4.2
