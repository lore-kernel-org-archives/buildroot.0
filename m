From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  7 Apr 2013 20:19:38 -0300
Subject: [Buildroot] [PATCH] mesa3d: requires host-bison and host-flex
Message-ID: <1365376778-4673-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes a local build failure when testing other things.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/mesa3d/mesa3d.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/x11r7/mesa3d/mesa3d.mk b/package/x11r7/mesa3d/mesa3d.mk
index 7b7f5b4..397dbb2 100644
--- a/package/x11r7/mesa3d/mesa3d.mk
+++ b/package/x11r7/mesa3d/mesa3d.mk
@@ -30,6 +30,8 @@ MESA3D_DEPENDENCIES = \
 	expat \
 	host-xutil_makedepend \
 	host-libxml2 \
-	host-python
+	host-python \
+	host-bison \
+	host-flex
 
 $(eval $(autotools-package))
-- 
1.8.1.5
