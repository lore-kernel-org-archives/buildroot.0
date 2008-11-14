From: Arnar Mar Sig <antab@valka.is>
Date: Fri, 14 Nov 2008 18:16:21 +0100
Subject: [Buildroot] [PATCH] Create "Shells" package category
Message-ID: <B675007D-8CE2-48C7-9F49-241B967F30C7@valka.is>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

First of the package menu cleanup.

Create a new package sub menu named "Shells" and move bash into it.
It also removes the  if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS condition  
around the package sub menus, is it not it better to set this in the  
package's Config.in?

If there are no objection then I'll just go ahead and commit it

(svn diff does not show files moved around:/)

Greets
	Arnar Mar Sig

Index: shells/editors.mk
===================================================================
--- shells/editors.mk	(revision 0)
+++ shells/editors.mk	(revision 0)
@@ -0,0 +1 @@
+include package/shells/*/*.mk
Index: shells/Config.in
===================================================================
--- shells/Config.in	(revision 0)
+++ shells/Config.in	(revision 0)
@@ -0,0 +1,3 @@
+menu "Shells"
+source "package/shells/bash/Config.in"
+endmenu

Property changes on: shells/bash
___________________________________________________________________
Added: svn:mergeinfo


Property changes on: shells/bash
___________________________________________________________________
Added: svn:mergeinfo

Index: bash/bash32-010 (deleted)
===================================================================
Index: bash/bash32-011 (deleted)
===================================================================
Index: bash/bash32-030 (deleted)
===================================================================
Index: bash/bash32-012 (deleted)
===================================================================
Index: bash/bash32-013 (deleted)
===================================================================
Index: bash/bash32-031 (deleted)
===================================================================
Index: bash/bash32-014 (deleted)
===================================================================
Index: bash/bash32-032 (deleted)
===================================================================
Index: bash/bash32-015 (deleted)
===================================================================
Index: bash/bash32-033 (deleted)
===================================================================
Index: bash/bash32-016 (deleted)
===================================================================
Index: bash/bash32-017 (deleted)
===================================================================
Index: bash/bash32-018 (deleted)
===================================================================
Index: bash/bash32-019 (deleted)
===================================================================
Index: bash/bash32-remove-bzero-dependancy.patch (deleted)
===================================================================
Index: bash/bash32-001 (deleted)
===================================================================
Index: bash/bash32-020 (deleted)
===================================================================
Index: bash/bash32-002 (deleted)
===================================================================
Index: bash/bash32-021 (deleted)
===================================================================
Index: bash/bash32-003 (deleted)
===================================================================
Index: bash/bash32-022 (deleted)
===================================================================
Index: bash/bash.mk (deleted)
===================================================================
Index: bash/bash32-004 (deleted)
===================================================================
Index: bash/bash32-023 (deleted)
===================================================================
Index: bash/bash32-005 (deleted)
===================================================================
Index: bash/bash32-024 (deleted)
===================================================================
Index: bash/bash32-006 (deleted)
===================================================================
Index: bash/bash32-025 (deleted)
===================================================================
Index: bash/bash32-007 (deleted)
===================================================================
Index: bash/bash32-026 (deleted)
===================================================================
Index: bash/bash32-008 (deleted)
===================================================================
Index: bash/bash32-027 (deleted)
===================================================================
Index: bash/bash32-009 (deleted)
===================================================================
Index: bash/bash32-028 (deleted)
===================================================================
Index: bash/bash32-029 (deleted)
===================================================================
Index: bash/Config.in (deleted)
===================================================================
Index: Config.in
===================================================================
--- Config.in	(revision 24042)
+++ Config.in	(working copy)
@@ -5,7 +5,6 @@
comment "The minimum needed to build a uClibc development system"

if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
-source "package/bash/Config.in"
source "package/bzip2/Config.in"
source "package/coreutils/Config.in"
source "package/diffutils/Config.in"
@@ -112,15 +111,9 @@
endif

source "package/database/Config.in"
-
-if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
-# busybox has an editor
-
-# text editors
source "package/editors/Config.in"
+source "package/shells/Config.in"

-endif
-
menu "Networking"

comment "Networking applications"
