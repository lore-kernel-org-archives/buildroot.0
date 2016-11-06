From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Nov 2016 14:41:11 +0100
Subject: [Buildroot] [git commit] libnss: add upstream patch to fix
	uninitialized variable warning
Message-ID: <20161106134406.886CA80E58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c670327d3f2a21b219509e2102c980d1856d20c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/47e611036be12844ebca093ddd8fe95c326c6056/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libnss/0003-it-uninitialized-fix.patch | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/package/libnss/0003-it-uninitialized-fix.patch b/package/libnss/0003-it-uninitialized-fix.patch
new file mode 100644
index 0000000..7736c6a
--- /dev/null
+++ b/package/libnss/0003-it-uninitialized-fix.patch
@@ -0,0 +1,24 @@
+# HG changeset patch
+# User catdesk <catdesk@tuta.io>
+# Date 1477710600 -7200
+#      Sat Oct 29 05:10:00 2016 +0200
+# Node ID b9ef971b94ab110302d49255339077bc1b4aed7f
+# Parent  eb8c96563cd70aa69d48b01516085f7d2fb46178
+Bug 1313846 - Declare 'it = NULL' earlier. r=franziskus
+
+[Thomas: patch taken from upstream mercurial repository, revision
+12791.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+diff -r eb8c96563cd7 -r b9ef971b94ab lib/jar/jarfile.c
+--- a/nss/lib/jar/jarfile.c	Mon Oct 31 17:31:20 2016 +0100
++++ b/nss/lib/jar/jarfile.c	Sat Oct 29 05:10:00 2016 +0200
+@@ -657,7 +657,7 @@
+ jar_listzip(JAR *jar, JAR_FILE fp)
+ {
+     ZZLink *ent;
+-    JAR_Item *it;
++    JAR_Item *it = NULL;
+     JAR_Physical *phy = NULL;
+     struct ZipLocal *Local = PORT_ZNew(struct ZipLocal);
+     struct ZipCentral *Central = PORT_ZNew(struct ZipCentral);
