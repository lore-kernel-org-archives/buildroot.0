From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Dec 2016 21:00:35 +0100
Subject: [Buildroot] [git commit] runc: pass -extldflags '-static' in
	correct variable
Message-ID: <20161221200224.CEF8B81D77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b97e3c94a9798bbd7eb08f5bd1adb0417cde1fd1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

commit 9101ce5800 (runc: pass -extldflags '-static' on when
BR2_STATIC_LIBS=y) contained a small copy/paste error, FLANNEL_GLDFLAGS was
used instead of RUNC_GLDFLAGS.

[Peter: refer to exact commit]
Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
