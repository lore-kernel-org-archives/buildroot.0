From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Feb 2020 16:49:28 +0100
Subject: [Buildroot] [git commit] docs/manual: describe the new
 <pkg>_IGNORE_CVES variable
Message-ID: <20200215153933.6809E8E12C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ea796fc54278c6b6480be6b7d6e78130a323d4a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-generic.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index baa052e31c..59cdb7ffd7 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -488,6 +488,20 @@ not and can not work as people would expect it should:
   locations, `/lib/firmware`, `/usr/lib/firmware`, `/lib/modules`,
   `/usr/lib/modules`, and `/usr/share`, which are automatically excluded.
 
+* +LIBFOO_IGNORE_CVES+ is a space-separated list of CVEs that tells
+  Buildroot CVE tracking tools which CVEs should be ignored for this
+  package. This is typically used when the CVE is fixed by a patch in
+  the package, or when the CVE for some reason does not affect the
+  Buildroot package. A Makefile comment must always precede the
+  addition of a CVE to this variable. Example:
+
+----------------------
+# 0001-fix-cve-2020-12345.patch
+LIBFOO_IGNORE_CVES += CVE-2020-12345
+# only when built with libbaz, which Buildroot doesn't support
+LIBFOO_IGNORE_CVES += CVE-2020-54321
+----------------------
+
 The recommended way to define these variables is to use the following
 syntax:
 
