From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Sep 2019 09:17:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/exim: bump version to 4.92.3
Message-ID: <20190929071718.23306-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...ix-buffer-overflow-in-string_vformat.patch | 44 -------------------
 package/exim/exim.hash                        |  2 +-
 package/exim/exim.mk                          |  2 +-
 3 files changed, 2 insertions(+), 46 deletions(-)
 delete mode 100644 package/exim/0006-Fix-buffer-overflow-in-string_vformat.patch

diff --git a/package/exim/0006-Fix-buffer-overflow-in-string_vformat.patch b/package/exim/0006-Fix-buffer-overflow-in-string_vformat.patch
deleted file mode 100644
index 5b022e2fc3..0000000000
--- a/package/exim/0006-Fix-buffer-overflow-in-string_vformat.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 478effbfd9c3cc5a627fc671d4bf94d13670d65f Mon Sep 17 00:00:00 2001
-From: Jeremy Harris <jgh146exb@wizmail.org>
-Date: Fri, 27 Sep 2019 12:21:49 +0100
-Subject: [PATCH] Fix buffer overflow in string_vformat.  Bug 2449
-
-Fixes CVE-2019-16928:
-https://lists.exim.org/lurker/message/20190928.003428.2b4c81a7.en.html
-
-Downloaded from upstream commit
-https://git.exim.org/exim.git/patch/478effbfd9c3cc5a627fc671d4bf94d13670d65f
-
-[adjusted patch of string.c and removed patches for test/]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/string.c             |  4 ++--
- scripts/0000-Basic/0214 | 11 +++++++++++
- stdout/0214             |  7 +++++++
- 3 files changed, 20 insertions(+), 2 deletions(-)
-
-diff --git a/src/src/string.c b/src/src/string.c
-index c6549bf..3445f8a 100644
---- a/src/string.c
-+++ b/src/string.c
-@@ -1132,7 +1132,7 @@ store_reset(g->s + (g->size = g->ptr + 1));
- Arguments:
-   g		the growable-string
-   p		current end of data
--  count		amount to grow by
-+  count		amount to grow by, offset from p
- */
- 
- static void
-@@ -1590,7 +1590,7 @@ while (*fp)
- 	}
-       else if (g->ptr >= lim - width)
- 	{
--	gstring_grow(g, g->ptr, width - (lim - g->ptr));
-+	gstring_grow(g, g->ptr, width);
- 	lim = g->size - 1;
- 	gp = CS g->s + g->ptr;
- 	}
--- 
-1.9.1
-
diff --git a/package/exim/exim.hash b/package/exim/exim.hash
index 0d11683c00..1c54e182f0 100644
--- a/package/exim/exim.hash
+++ b/package/exim/exim.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256 01d7ae481d03ff408f8e54fd9b250324ea5ddabc83b1db32917c7f27a096a654  exim-4.92.2.tar.xz
+sha256 c4453bb5ec8e16c4c3353769700466eb9aa48c1b2fcf7f3b0e08954dd727d2fd  exim-4.92.3.tar.xz
 sha256 49240db527b7e55b312a46fc59794fde5dd006422e422257f4f057bfd27b3c8f  LICENCE
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index b6a8566ce7..014565c85b 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.92.2
+EXIM_VERSION = 4.92.3
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
 EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPL-2.0+
-- 
2.20.1
