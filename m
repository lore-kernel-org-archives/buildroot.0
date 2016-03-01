From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue,  1 Mar 2016 12:01:04 +0100
Subject: [Buildroot] [PATCH v4] docs/manual: add section about patch
	licensing
In-Reply-To: <1456830064-15398-1-git-send-email-luca@lucaceresoli.net>
References: <1456830064-15398-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1456830064-15398-2-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use the same text that is used in COPYING.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Steve Calfee <stevecalfee@gmail.com>

---

Changes v3 -> v4:
- entirely replace with the same text approved for COPYING (Yann),
  but keeping the hyperlink to patch-policy.

Changes v2 -> v3:
- various wording improvements (Yann, Arnout).

Changes v1 -> v2:
- "they modify" -> "they apply to" (Thomas).
---
 docs/manual/legal-notice.txt | 17 +++++++++++++++--
 docs/manual/patch-policy.txt |  2 +-
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/docs/manual/legal-notice.txt b/docs/manual/legal-notice.txt
index 0a91c37..0572dae 100644
--- a/docs/manual/legal-notice.txt
+++ b/docs/manual/legal-notice.txt
@@ -134,11 +134,13 @@ Buildroot, with the name used in the manifest files:
   http://apache.org/licenses/LICENSE-2.0.html[
   Apache License, version 2.0];
 
+[[legal-info-buildroot]]
 === Complying with the Buildroot license
 
 Buildroot itself is an open source software, released under the
-http://www.gnu.org/licenses/old-licenses/gpl-2.0.html[GNU General Public
-License, version 2] or (at your option) any later version.
+http://www.gnu.org/licenses/old-licenses/gpl-2.0.html[GNU General
+Public License, version 2] or (at your option) any later version, with
+the exception of the package patches detailed below.
 However, being a build system, it is not normally part of the end product:
 if you develop the root filesystem, kernel, bootloader or toolchain for a
 device, the code of Buildroot is only present on the development machine, not
@@ -159,3 +161,14 @@ material that must be redistributed.
 
 Keep in mind that this is only the Buildroot developers' opinion, and you
 should consult your legal department or lawyer in case of any doubt.
+
+==== Patches to packages
+
+Buildroot also bundles patch files, which are applied to the sources
+of the various packages. Those patches are not covered by the license
+of Buildroot. Instead, they are covered by the license of the software
+to which the patches are applied. When said software is available
+under multiple licenses, the Buildroot patches are only provided under
+the publicly accessible licenses.
+
+See xref:patch-policy[] for the technical details.
diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
index d50c971..5a1fe4f 100644
--- a/docs/manual/patch-policy.txt
+++ b/docs/manual/patch-policy.txt
@@ -91,7 +91,7 @@ If something goes wrong in the steps _3_ or _4_, then the build fails.
 === Format and licensing of the package patches
 
 Patches are released under the same license as the software they apply
-to.
+to (see xref:legal-info-buildroot[]).
 
 A message explaining what the patch does, and why it is needed, should
 be added in the header commentary of the patch.
-- 
1.9.1
