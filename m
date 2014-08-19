From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 19 Aug 2014 21:41:48 +0200
Subject: [Buildroot] [PATCH 3 of 3 for 2014.08] manual/user guide: move tip
 on configuration searches
In-Reply-To: <patchbomb.1408477305@localhost>
References: <patchbomb.1408477305@localhost>
Message-ID: <742905f7caebc7d58fc2.1408477308@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch moves the tip on searching in the configuration editors into the
section 'Buildroot configuration', which is more logical.

The wording of that section is slightly adapted to fit this new part.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/manual/configure.txt |  21 ++++++++++++++++++---
 docs/manual/make-tips.txt |  10 ----------
 2 files changed, 18 insertions(+), 13 deletions(-)

diff -r 80688762f124 -r 742905f7caeb docs/manual/configure.txt
--- a/docs/manual/configure.txt	Thu Aug 14 21:45:29 2014 +0200
+++ b/docs/manual/configure.txt	Fri Aug 15 20:50:32 2014 +0200
@@ -5,9 +5,24 @@
 == Buildroot configuration
 
 All the configuration options in +make *config+ have a help text
-providing details about the option. However, a number of topics
-require additional details that cannot easily be covered in the help
-text and are there covered in the following sections.
+providing details about the option.
+
+The +make *config+ commands also offer a search tool. Read the help
+message in the different frontend menus to know how to use it:
+
+* in _menuconfig_, the search tool is called by pressing +/+;
+* in _xconfig_, the search tool is called by pressing +Ctrl+ + +f+.
+
+The result of the search shows the help message of the matching items.
+In _menuconfig_, numbers in the left column provide a shortcut to the
+corresponding entry. Just type this number to directly jump to the
+entry, or to the containing menu in case the entry is not selectable due
+to a missing dependency.
+
+Although the menu structure and the help text of the entries should be
+sufficiently self-explanatory, a number of topics require additional
+explanation that cannot easily be covered in the help text and are
+therefore covered in the following sections.
 
 === Cross-compilation toolchain
 
diff -r 80688762f124 -r 742905f7caeb docs/manual/make-tips.txt
--- a/docs/manual/make-tips.txt	Thu Aug 14 21:45:29 2014 +0200
+++ b/docs/manual/make-tips.txt	Fri Aug 15 20:50:32 2014 +0200
@@ -6,16 +6,6 @@
 
 This is a collection of tips that help you make the most of Buildroot.
 
-.Configuration searches:
-
-The +make *config+ commands offer a search tool. Read the help message in
-the different frontend menus to know how to use it:
-
-* in _menuconfig_, the search tool is called by pressing +/+;
-* in _xconfig_, the search tool is called by pressing +Ctrl+ + +f+.
-
-The result of the search shows the help message of the matching items.
-
 .Display all commands executed by make:
 
 --------------------
