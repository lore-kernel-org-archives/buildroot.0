From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Dec 2018 22:53:37 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] popt: add libiconv to
 popt.pc.in
Message-ID: <20181203215204.5850181E8C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a43ee60a9aa8750b8502e1abcbe8168b758e0bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Add ${LTLIBICONV} to popt.pc.in so applications such as shairport-sync
will know that they must link with -liconv when building statically

Fixes:
 - http://autobuild.buildroot.org/results/c5b0d1d2867e49c022a2ad971dd9f358ff0f3865

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 1209eb2dca71fe43e3742f81b43591f6b24ed51a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/popt/0004-add-libiconv-to-popt.pc.patch | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/package/popt/0004-add-libiconv-to-popt.pc.patch b/package/popt/0004-add-libiconv-to-popt.pc.patch
new file mode 100644
index 0000000000..087a30bb7a
--- /dev/null
+++ b/package/popt/0004-add-libiconv-to-popt.pc.patch
@@ -0,0 +1,19 @@
+Add LTLIBICONV to popt.pc.in
+
+Add ${LTLIBICONV} to popt.pc.in so applications such as shairport-sync
+will know that they must link with -liconv when building statically
+
+Fixes:
+ - http://autobuild.buildroot.org/results/c5b0d1d2867e49c022a2ad971dd9f358ff0f3865
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+diff -Naurp popt-1.16-vanilla/popt.pc.in popt-1.16/popt.pc.in
+--- popt-1.16-vanilla/popt.pc.in	2018-11-22 20:26:55.735211662 +0100
++++ popt-1.16/popt.pc.in	2018-11-22 20:34:11.371303724 +0100
+@@ -7,4 +7,5 @@ Name: popt
+ Version: @VERSION@
+ Description: popt library.
+ Libs: @POPT_PKGCONFIG_LIBS@
++Libs.private: @LTLIBICONV@
+ Cflags: -I${includedir}
