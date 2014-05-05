From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon,  5 May 2014 11:42:14 +0200
Subject: [Buildroot] [PATCH] freetype: freetype-patch: depends on
	host-automake
Message-ID: <1399282934-14517-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The "make freetype-patch" fails because does not found autogen.sh,
because autogen.sh available only for the configure stage.
To fix this add host-automake as a prerequisite to freetype-patch too.

This also fix the support to top-level parallel make.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/freetype/freetype.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index c7c9a06..33a6317 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -83,3 +83,6 @@ HOST_FREETYPE_POST_INSTALL_HOOKS += HOST_FREETYPE_FIX_FREETYPE_INCLUDE
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
+
+# freetype-patch uses autogen.sh so add it as a prerequisite
+$(FREETYPE_TARGET_PATCH): host-automake
-- 
1.9.1
