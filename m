From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 17:28:38 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] gauche: fix parallel build
Message-ID: <20181126165030.554A8887BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7da0365553b4f79b285eeae90e41d34957a34e6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Add a patch to fix parallel build issue on ext/rfc

Fixes:
 - http://autobuild.buildroot.org/results/f4935e29ce6aaebdaa47d46c56120b7e97145d1b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e00369fa84ecd32edf1738255d394b16785034ee)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gauche/0004-rfc-needs-srfi.patch | 35 ++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/gauche/0004-rfc-needs-srfi.patch b/package/gauche/0004-rfc-needs-srfi.patch
new file mode 100644
index 0000000000..8b83b7872b
--- /dev/null
+++ b/package/gauche/0004-rfc-needs-srfi.patch
@@ -0,0 +1,35 @@
+From 33ba5e73ec09f1308f897128334e955debd9ea43 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 21 Nov 2018 08:58:25 +0100
+Subject: [PATCH] rfc: needs srfi
+
+ext/rfc needs srfi-19 since version 0.9.5 and
+https://github.com/shirok/Gauche/commit/bd22bc82361c5eeb5d3b58c3836236566746bb96
+
+So add a dependency on srfi for rfc target in Makefile.in
+
+Fixes:
+ - http://autobuild.buildroot.org/results/f4935e29ce6aaebdaa47d46c56120b7e97145d1b
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/shirok/Gauche/pull/397]
+---
+ ext/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ext/Makefile.in b/ext/Makefile.in
+index 57ddf457e..de8d59a4d 100644
+--- a/ext/Makefile.in
++++ b/ext/Makefile.in
+@@ -54,7 +54,7 @@ bcrypt: mt-random
+ 
+ dbm : threads
+ 
+-rfc: gauche util
++rfc: gauche srfi util
+ 
+ test : check
+ 
+-- 
+2.14.1
+
