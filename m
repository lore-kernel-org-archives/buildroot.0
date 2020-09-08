From: Brandon Maier <brandon.maier@rockwellcollins.com>
Date: Tue,  8 Sep 2020 17:01:20 -0500
Subject: [Buildroot] [PATCH 1/1] docs/manual: Add section about contributing
 to release branches
Message-ID: <20200908220119.90236-1-brandon.maier@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
---
 docs/manual/contribute.txt | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index 11d8811b44..2b3d7e7302 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -371,6 +371,21 @@ in the following cases:
 * whenever you feel it will help presenting your work, your choices,
   the review process, etc.
 
+==== Patches for release branches
+
+When fixing bugs on a release branch, bugs should be fixed on the master
+branch first. Then the release branch maintainer can backport the fixes
+to applicable release branches. But some bugs may apply only to a
+specific release, for example because it is using an older version of a
+package. In that case, add the branch name to the patch's subject
+prefix. This can be done with the +git format-patch+ flag
++--subject-prefix+.
+
+---------------------
+$ git format-patch --subject-prefix "PATCH 2020.02.x" \
+    -M -s -o outgoing origin/2020.02.x
+---------------------
+
 ==== Patch revision changelog
 
 When improvements are requested, the new revision of each commit
-- 
2.28.0
