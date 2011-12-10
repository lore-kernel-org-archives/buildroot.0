From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sat, 10 Dec 2011 11:46:29 +0100
Subject: [Buildroot] [PATCH 1/1] Don't use host gcc use target
	tools.(signed-off this time)
Message-ID: <1323513989-8594-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 package/libcgi/libcgi.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libcgi/libcgi.mk b/package/libcgi/libcgi.mk
index 5867ff9..e70be80 100644
--- a/package/libcgi/libcgi.mk
+++ b/package/libcgi/libcgi.mk
@@ -7,5 +7,7 @@ LIBCGI_VERSION:=1.0
 LIBCGI_SOURCE:=libcgi-$(LIBCGI_VERSION).tar.gz
 LIBCGI_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libcgi
 LIBCGI_INSTALL_STAGING=YES
+#Don't use host compiler
+LIBCGI_MAKE_ENV = CC="$(TARGET_CC)"  AR="$(TARGET_AR)"
 
 $(eval $(call AUTOTARGETS))
-- 
1.7.8
