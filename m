From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Nov 2013 09:15:17 +0100
Subject: [Buildroot] [git commit branch/next] legal info: update
	documentation with split target/host output
Message-ID: <20131117081823.BA7AB9B9F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a98442f2b514d296c8639d9fa66e6a64b54dd6b4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/legal-notice.txt |   21 ++++++++++++---------
 1 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/docs/manual/legal-notice.txt b/docs/manual/legal-notice.txt
index 51292f6..574c1d8 100644
--- a/docs/manual/legal-notice.txt
+++ b/docs/manual/legal-notice.txt
@@ -39,16 +39,19 @@ There you will find:
 * +buildroot.config+: this is the Buildroot configuration file that is usually
   produced with +make menuconfig+, and which is necessary to reproduce the
   build.
-* The source code for all packages; this is saved in the +sources/+
-  subdirectory (except for proprietary packages, whose source code is not
-  saved);
-  patches applied to some packages by Buildroot are distributed with the
-  Buildroot sources and are not duplicated in the +sources/+ subdirectory.
-* A manifest file listing the configured packages, their version, license and
-  related information.
+* The source code for all packages; this is saved in the +sources/+ and
+  +host-sources/+ subdirectories for target and host packages respectively.
+  The source code for packages that set +<PKG>_REDISTRIBUTE = NO+ will not be
+  saved.
+  Patches applied to some packages by Buildroot are distributed with the
+  Buildroot sources and are not duplicated in the +sources/+ and +host-sources/+
+  subdirectories.
+* A manifest file (one for host and one for target packages) listing the
+  configured packages, their version, license and related information.
   Some of this information might not be defined in Buildroot; such items are
   marked as "unknown".
-* A +licenses/+ subdirectory, which contains the license text of packages.
+* The license texts of all packages, in the +licenses/+ and +host-licenses/+
+  subdirectories for target and host packages respectively.
   If the license file(s) are not defined in Buildroot, the file is not produced
   and a warning in the +README+ indicates this.
 
@@ -72,7 +75,7 @@ License abbreviations
 ---------------------
 
 Here is a list of the licenses that are most widely used by packages in
-Buildroot, with the name used in the manifest file:
+Buildroot, with the name used in the manifest files:
 
 * `GPLv2`:
   http://www.gnu.org/licenses/old-licenses/gpl-2.0.html[
