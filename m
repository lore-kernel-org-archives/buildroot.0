From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 28 May 2019 00:30:54 +0200
Subject: [Buildroot] [git commit] package/libhtp: add -lz to htp.pc
Message-ID: <20190527222459.ACC6A8E4A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=94153b3330da9da93460b708cb70fee62f3e6723
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will fix static build of suricata.

Fixes:
 - No autobuilder failures yet

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0002-htp.pc.in-add-lz-to-Libs.private.patch    | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/libhtp/0002-htp.pc.in-add-lz-to-Libs.private.patch b/package/libhtp/0002-htp.pc.in-add-lz-to-Libs.private.patch
new file mode 100644
index 0000000000..f79a9ebb3a
--- /dev/null
+++ b/package/libhtp/0002-htp.pc.in-add-lz-to-Libs.private.patch
@@ -0,0 +1,29 @@
+From 39e534ab696157b244ec226d649c789dcf423e42 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 24 Apr 2019 20:48:57 +0200
+Subject: [PATCH] htp.pc.in: add -lz to Libs.private
+
+zlib is a mandatory dependency so add it to Libs.private otherwise
+static linking of packages linking with htp (e.g. suricata) will fail.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not sent yet]
+---
+ htp.pc.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/htp.pc.in b/htp.pc.in
+index 2fec995..9b1a6cc 100644
+--- a/htp.pc.in
++++ b/htp.pc.in
+@@ -7,6 +7,6 @@ Name: @PACKAGE_NAME@
+ Description: A security-aware HTTP parser, designed for use in IDS/IPS and WAF products.
+ Version: @PACKAGE_VERSION@
+ Libs: -L${libdir} -lhtp
+-Libs.private: @LIBICONV@
++Libs.private: -lz @LIBICONV@
+ Cflags: -I${includedir} -I${libdir}/htp/include
+ 
+-- 
+2.20.1
+
