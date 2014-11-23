From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 23 Nov 2014 11:40:33 +0100
Subject: [Buildroot] [PATCH] package/librtlsdr: fix build failure
Message-ID: <1416739233-29442-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable run test for pthread detection.

Fixes:
  http://autobuild.buildroot.org/results/26c/26cb8c2e5f867d49451f61304bf0a1a6f7b825d9/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/librtlsdr/librtlsdr.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/librtlsdr/librtlsdr.mk b/package/librtlsdr/librtlsdr.mk
index 2c5cf1f..9f27aad 100644
--- a/package/librtlsdr/librtlsdr.mk
+++ b/package/librtlsdr/librtlsdr.mk
@@ -19,4 +19,8 @@ ifeq ($(BR2_PACKAGE_LIBRTLSDR_DETACH_DRIVER),y)
 LIBRTLSDR_CONF_OPTS += -DDETACH_KERNEL_DRIVER=1
 endif
 
+# Prevent from configure failure because of TRY_RUN call (of course totally not
+# applicable in the cross-compilation context).
+LIBRTLSDR_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF
+
 $(eval $(cmake-package))
-- 
2.1.3
