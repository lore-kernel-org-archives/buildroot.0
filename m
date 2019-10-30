From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Oct 2019 13:30:46 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/libtorrent: add
 Libs.Private to libtorrent.pc.in
Message-ID: <20191030122556.88FD88E03B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6a4dbe855ff50f18d568e7de62d920d921e3395f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

This will fix a static build failure with rtorrent

Fixes:
 - http://autobuild.buildroot.org/results/075598e1699c2ac20a4dfbcb5695bbb7343f9a86

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 77ffd39c31aa06ce77dbe71420db626b5c2da2fd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-libtorrent.pc.in-add-Libs.Private.patch   | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/libtorrent/0001-libtorrent.pc.in-add-Libs.Private.patch b/package/libtorrent/0001-libtorrent.pc.in-add-Libs.Private.patch
new file mode 100644
index 0000000000..7d363d2939
--- /dev/null
+++ b/package/libtorrent/0001-libtorrent.pc.in-add-Libs.Private.patch
@@ -0,0 +1,30 @@
+From a86219e725441eb87321fa3e24531dafa54ee674 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 20 Oct 2019 20:23:19 +0200
+Subject: [PATCH] libtorrent.pc.in: add Libs.Private
+
+Add Libs.Private: -lz so applications that want to link statically with
+libtorrent (such as rtorrent) will know that they must link with -lz
+
+Fixes:
+ - http://autobuild.buildroot.org/results/075598e1699c2ac20a4dfbcb5695bbb7343f9a86
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/rakshasa/libtorrent/pull/202]
+---
+ libtorrent.pc.in | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libtorrent.pc.in b/libtorrent.pc.in
+index cf6612bc..6108f7e9 100644
+--- a/libtorrent.pc.in
++++ b/libtorrent.pc.in
+@@ -7,4 +7,5 @@ Name: libtorrent
+ Description: A BitTorrent library
+ Version: @VERSION@
+ Libs: -L${libdir} -ltorrent
++Libs.Private: -lz
+ Cflags: -I${includedir}
+-- 
+2.23.0
+
