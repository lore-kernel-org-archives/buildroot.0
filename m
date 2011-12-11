From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 11 Dec 2011 23:15:49 +0100
Subject: [Buildroot] [git commit] libcgi: build for target, not host
Message-ID: <20111211222422.D3AFD8F8CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e1d1c379e9f9aad3956f19a2c3d67eb7701cb48f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: Ensure correct CFLAGS are used, whitespace cleanup]
Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libcgi/libcgi.mk |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/libcgi/libcgi.mk b/package/libcgi/libcgi.mk
index 5867ff9..5a52fa6 100644
--- a/package/libcgi/libcgi.mk
+++ b/package/libcgi/libcgi.mk
@@ -3,9 +3,11 @@
 # libcgi
 #
 #############################################################
-LIBCGI_VERSION:=1.0
-LIBCGI_SOURCE:=libcgi-$(LIBCGI_VERSION).tar.gz
-LIBCGI_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libcgi
-LIBCGI_INSTALL_STAGING=YES
+
+LIBCGI_VERSION = 1.0
+LIBCGI_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libcgi
+LIBCGI_INSTALL_STAGING = YES
+# use cross CC/AR rather than host
+LIBCGI_MAKE_ENV = CC="$(TARGET_CC) $(TARGET_CFLAGS)" AR="$(TARGET_AR)"
 
 $(eval $(call AUTOTARGETS))
