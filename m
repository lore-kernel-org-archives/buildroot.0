From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  6 Oct 2013 17:07:34 +0200
Subject: [Buildroot] [PATCH 1/2] support: trivial fixes (typos and minor
	rewording) in gen-manual-lists.py
Message-ID: <1381072055-26797-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
Changes v1 -> v2:
- split patch content
- detail a bit more the commit message
---
 support/scripts/gen-manual-lists.py | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/support/scripts/gen-manual-lists.py b/support/scripts/gen-manual-lists.py
index 3568843..5c81e1d 100755
--- a/support/scripts/gen-manual-lists.py
+++ b/support/scripts/gen-manual-lists.py
@@ -107,7 +107,7 @@ def get_symbol_parents(item, root=None, enable_choice=False):
         parent = parent.get_parent()
     if isinstance(root, kconfiglib.Menu) or \
             (enable_choice and isinstance(root, kconfiglib.Choice)):
-        parents.append("") # Dummy empty parrent to get a leading arrow ->
+        parents.append("") # Dummy empty parent to get a leading arrow ->
     parents.reverse()
     return parents
 
@@ -126,15 +126,14 @@ def format_asciidoc_table(root, get_label_func, filter_func=lambda x: True,
     :param sub_menu:       Output the column with the sub-menu path
 
     """
-    def _format_entry(label, parents, sub_menu):
+    def _format_entry(item, parents, sub_menu):
         """ Format an asciidoc table entry.
 
         """
         if sub_menu:
-            return "| {0:<40} <| {1}\n".format(label, " -> ".join(parents))
+            return "| {0:<40} <| {1}\n".format(item, " -> ".join(parents))
         else:
-            return "| {0:<40}\n".format(label)
-
+            return "| {0:<40}\n".format(item)
     lines = []
     for item in get_symbol_subset(root, filter_func):
         if not item.is_symbol() or not item.prompts:
-- 
1.8.4
