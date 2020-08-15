From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 15 Aug 2020 16:14:28 +0200
Subject: [Buildroot] [git commit] package/bird: fix build with gcc 10
Message-ID: <20200815140814.0CFA881540@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2c48225ccb5c2a95be9081509a7e9a3d3befd371
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/3e01f490d76be03f21a0680eb162a0c0267fc1b9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bird/0002-Added-missing-extern.patch | 34 ++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/bird/0002-Added-missing-extern.patch b/package/bird/0002-Added-missing-extern.patch
new file mode 100644
index 0000000000..00aab3e92b
--- /dev/null
+++ b/package/bird/0002-Added-missing-extern.patch
@@ -0,0 +1,34 @@
+From 4bbc10614f3431c37e6352f5a6ea5c693c31021e Mon Sep 17 00:00:00 2001
+From: Maria Matejka <mq@ucw.cz>
+Date: Tue, 4 Feb 2020 10:11:16 +0100
+Subject: [PATCH] Added missing extern
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Thanks to Robert Scheck <bird@robert-scheck.de> who reported it
+and Toke H??iland-J??rgensen <toke@toke.dk> who suggested this patch.
+
+[Retrieved from:
+https://gitlab.nic.cz/labs/bird/-/commit/4bbc10614f3431c37e6352f5a6ea5c693c31021e]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ nest/route.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/nest/route.h b/nest/route.h
+index d2a07f09..b927db5f 100644
+--- a/nest/route.h
++++ b/nest/route.h
+@@ -458,7 +458,7 @@ typedef struct rta {
+ 					   protocol-specific metric is availabe */
+ 
+ 
+-const char * rta_dest_names[RTD_MAX];
++extern const char * rta_dest_names[RTD_MAX];
+ 
+ static inline const char *rta_dest_name(uint n)
+ { return (n < RTD_MAX) ? rta_dest_names[n] : "???"; }
+-- 
+2.26.2
+
