From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 21 Dec 2016 19:50:46 +0100
Subject: [Buildroot] [PATCH 11/11] runc: pass -extldflags '-static' in good
	variable
Message-ID: <1482346246-87491-1-git-send-email-fabrice.fontaine@orange.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The modification made in http://patchwork.ozlabs.org/patch/652102
contained a small copy/paste error, FLANNEL_GLDFLAGS was used instead of
RUNC_GLDFLAGS.

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
---
 package/runc/runc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index ef151ed..661872c 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -22,7 +22,7 @@ RUNC_GLDFLAGS = \
 	-X main.gitCommit=$(RUNC_VERSION)
 
 ifeq ($(BR2_STATIC_LIBS),y)
-FLANNEL_GLDFLAGS += -extldflags '-static'
+RUNC_GLDFLAGS += -extldflags '-static'
 endif
 
 RUNC_GOTAGS = cgo static_build
-- 
2.5.0
