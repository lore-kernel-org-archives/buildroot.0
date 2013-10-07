From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 07 Oct 2013 15:15:13 +0200
Subject: [Buildroot] [PATCH 6 of 6 v2] legal info: update documentation with
 split target/host output
In-Reply-To: <patchbomb.1381151707@argentina>
References: <patchbomb.1381151707@argentina>
Message-ID: <80513bfceb0f901ca09a.1381151713@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v2: new patch

 docs/manual/legal-notice.txt |  15 +++++++++------
 1 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/docs/manual/legal-notice.txt b/docs/manual/legal-notice.txt
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
