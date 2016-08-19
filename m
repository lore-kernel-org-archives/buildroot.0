From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 23:16:23 +0200
Subject: [Buildroot] [git commit] docs: libtool patches are not handled by
	legal-info infrastructure.
Message-ID: <20160819213400.4F19F82293@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c6b9a2bb0d74bf588a275dd14c0f373f302a5d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Thomas: slightly reword with Yann's suggestion.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/legal-notice.txt     | 5 +++++
 support/legal-info/README.header | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/docs/manual/legal-notice.txt b/docs/manual/legal-notice.txt
index a4911f7..7c19bc3 100644
--- a/docs/manual/legal-notice.txt
+++ b/docs/manual/legal-notice.txt
@@ -44,6 +44,11 @@ There you will find:
   Patches that were applied are also saved, along with a file named +series+
   that lists the patches in the order they were applied. Patches are under the
   same license as the files that they modify.
+  Note: Buildroot applies additional patches to Libtool scripts of
+  autotools-based packages. These patches can be found under
+  +support/libtool+ in the Buildroot source and, due to technical
+  limitations, are not saved with the package sources. You may need to
+  collect them manually.
 * A manifest file (one for host and one for target packages) listing the
   configured packages, their version, license and related information.
   Some of this information might not be defined in Buildroot; such items are
diff --git a/support/legal-info/README.header b/support/legal-info/README.header
index 1f3524f..d3bdf71 100644
--- a/support/legal-info/README.header
+++ b/support/legal-info/README.header
@@ -20,6 +20,11 @@ This material is composed of the following items.
    with a file named 'series' that lists the patches in the order they were
    applied. Patches are under the same license as the files that they modify
    in the original package.
+   Note: Buildroot applies additional patches to Libtool scripts of
+   autotools-based packages. These patches can be found under
+   support/libtool in the Buildroot source and, due to technical
+   limitations, are not saved with the package sources. You may need
+   to collect them manually.
  * A manifest file listing the configured packages and related information.
  * The license text of the packages; they have been saved in the licenses/
    subdirectory.
