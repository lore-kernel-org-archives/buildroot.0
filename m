From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Aug 2014 15:39:32 +0200
Subject: [Buildroot] [git commit] manual/user guide: move tip on
	configuration searches
Message-ID: <20140821134002.D8CFC9D4E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=47c1c50134482133b65bf56a4a6b77890a62543e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch moves the tip on searching in the configuration editors into the
section 'Buildroot configuration', which is more logical.

The wording of that section is slightly adapted to fit this new part.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/configure.txt |   21 ++++++++++++++++++---
 docs/manual/make-tips.txt |   10 ----------
 2 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
index 30c34c8..7fc109b 100644
--- a/docs/manual/configure.txt
+++ b/docs/manual/configure.txt
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
 
diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
index 6d7aa77..027eddf 100644
--- a/docs/manual/make-tips.txt
+++ b/docs/manual/make-tips.txt
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
