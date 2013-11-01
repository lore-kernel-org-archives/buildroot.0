From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Nov 2013 16:59:12 +0100
Subject: [Buildroot] [git commit] support: trivial fixes (typos and minor
	rewording) in gen-manual-lists.py
Message-ID: <20131104211054.E43569BC97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=67feb0e7593af124088f8b4886da4e50cbfa8168
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: added Thomas DS Acked-by, given at
http://patchwork.ozlabs.org/patch/284719/, and made the additional
typo fixes suggested by Thomas DS.]

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 support/scripts/gen-manual-lists.py |   15 +++++++--------
 1 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/support/scripts/gen-manual-lists.py b/support/scripts/gen-manual-lists.py
index 3568843..4546e07 100755
--- a/support/scripts/gen-manual-lists.py
+++ b/support/scripts/gen-manual-lists.py
@@ -88,7 +88,7 @@ def get_symbol_subset(root, filter_func):
 
 
 def get_symbol_parents(item, root=None, enable_choice=False):
-    """ Return the list of the item's parents. The lasst item of the list is
+    """ Return the list of the item's parents. The last item of the list is
     the closest parent, the first the furthest.
 
     :param item:          Item from which the the parent list is generated
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
@@ -264,9 +263,9 @@ class Buildroot:
         # Implementation details:
         #
         # * The package list is generated from the *.mk file existence, the
-        #   first time this function is called. Despite the memory consumtion,
+        #   first time this function is called. Despite the memory consumption,
         #   this list is stored because the execution time of this script is
-        #   noticebly shorter than re-scannig the package sub-tree for each
+        #   noticeably shorter than rescanning the package sub-tree for each
         #   symbol.
         if not hasattr(self, "_package_list"):
             pkg_list = []
