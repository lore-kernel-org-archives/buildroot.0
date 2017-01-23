From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Jan 2017 15:51:24 +0100
Subject: [Buildroot] [git commit branch/2016.11.x] runc: pass -extldflags
	'-static' in correct variable
Message-ID: <20170123145719.3A86280DE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c54287b52727597e819041b53f350fa5ab984249
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2016.11.x

commit 9101ce5800 (runc: pass -extldflags '-static' on when
BR2_STATIC_LIBS=y) contained a small copy/paste error, FLANNEL_GLDFLAGS was
used instead of RUNC_GLDFLAGS.

[Peter: refer to exact commit]
Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

(cherry picked from commit b97e3c94a9798bbd7eb08f5bd1adb0417cde1fd1)
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
