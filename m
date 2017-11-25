From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 25 Nov 2017 10:11:42 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/nano: bump version to 2.9.0
Message-ID: <20171125091142.1774-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch applied upstream, added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...pilation-when-configured-with-enable-tiny.patch | 43 ----------------------
 package/nano/nano.hash                             |  3 +-
 package/nano/nano.mk                               |  4 +-
 3 files changed, 4 insertions(+), 46 deletions(-)
 delete mode 100644 package/nano/0001-fix-compilation-when-configured-with-enable-tiny.patch

diff --git a/package/nano/0001-fix-compilation-when-configured-with-enable-tiny.patch b/package/nano/0001-fix-compilation-when-configured-with-enable-tiny.patch
deleted file mode 100644
index db684f9832..0000000000
--- a/package/nano/0001-fix-compilation-when-configured-with-enable-tiny.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 28cfab7580c42a6d6c9c5d787ce736094fd51a0c Mon Sep 17 00:00:00 2001
-From: Benno Schulenberg <bensberg@telfort.nl>
-Date: Tue, 29 Aug 2017 19:28:44 +0200
-Subject: tweaks: fix compilation when configured with --enable-tiny
-
-When moving the cursor to the top-left corner, it is not necessary
-to compute leftedge because firstcolumn IS the relevant leftedge.
-
-Reported-by: Jordi Mallach <jordi@debian.org>
-
-Downloaded from upstream master branch:
-http://git.savannah.gnu.org/cgit/nano.git/commit/?id=28cfab7580c42a6d6c9c5d787ce736094fd51a0c
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/move.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/move.c b/src/move.c
-index d138356..ce276e4 100644
---- a/src/move.c
-+++ b/src/move.c
-@@ -121,7 +121,7 @@ void do_page_up(void)
- 	openfile->current = openfile->edittop;
- 	openfile->current_y = 0;
- 
--	leftedge = leftedge_for(openfile->firstcolumn, openfile->edittop);
-+	leftedge = openfile->firstcolumn;
- 	target_column = 0;
-     } else
- 	get_edge_and_target(&leftedge, &target_column);
-@@ -152,7 +152,7 @@ void do_page_down(void)
- 	openfile->current = openfile->edittop;
- 	openfile->current_y = 0;
- 
--	leftedge = leftedge_for(openfile->firstcolumn, openfile->edittop);
-+	leftedge = openfile->firstcolumn;
- 	target_column = 0;
-     } else
- 	get_edge_and_target(&leftedge, &target_column);
--- 
-cgit v1.0-41-gc330
-
diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index 4e0abc4489..c09f0313d3 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,2 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256 fbe31746958698d73c6726ee48ad8b0612697157961a2e9aaa83b4aa53d1165a  nano-2.8.7.tar.xz
+sha256 d2d30c39caef53aba1ec1b4baff4186d4496f35d2411b0848242a5f2e27e129e  nano-2.9.0.tar.xz
+sha256 fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index f1c172ffd5..458174a473 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NANO_VERSION_MAJOR = 2.8
-NANO_VERSION = $(NANO_VERSION_MAJOR).7
+NANO_VERSION_MAJOR = 2.9
+NANO_VERSION = $(NANO_VERSION_MAJOR).0
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPL-3.0+
-- 
2.11.0
