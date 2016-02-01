From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  1 Feb 2016 15:52:23 +0100
Subject: [Buildroot] [PATCH 4/5] docs/manual: add section about patch
	licensing
In-Reply-To: <1454338344-24973-1-git-send-email-luca@lucaceresoli.net>
References: <1454338344-24973-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1454338344-24973-5-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 docs/manual/legal-notice.txt | 16 ++++++++++++++--
 docs/manual/patch-policy.txt |  2 +-
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/docs/manual/legal-notice.txt b/docs/manual/legal-notice.txt
index 5895224..e82f8a7 100644
--- a/docs/manual/legal-notice.txt
+++ b/docs/manual/legal-notice.txt
@@ -131,11 +131,13 @@ Buildroot, with the name used in the manifest files:
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
@@ -156,3 +158,13 @@ material that must be redistributed.
 
 Keep in mind that this is only the Buildroot developers' opinion, and you
 should consult your legal department or lawyer in case of any doubt.
+
+==== Patches to packages
+
+Buildroot is bundled with a set of patches that it applies to packages
+to fix cross-compilation or other issues. See xref:patch-policy[] for
+the technical details.
+
+These patches are effectively a derived work of the upstream package,
+and they are released under the same license as the software that they
+modify. They are not distributed under the Buildroot license.
diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
index cfda5c5..135b23f 100644
--- a/docs/manual/patch-policy.txt
+++ b/docs/manual/patch-policy.txt
@@ -91,7 +91,7 @@ If something goes wrong in the steps _3_ or _4_, then the build fails.
 === Format and licensing of the package patches
 
 Patches are released under the same license as the software that they
-modify.
+modify (see xref:legal-info-buildroot[]).
 
 A message explaining what the patch does, and why it is needed, should
 be added in the header commentary of the patch.
-- 
1.9.1
