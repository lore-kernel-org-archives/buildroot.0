From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Feb 2010 22:16:54 +0100
Subject: [Buildroot] [PATCH 07/10] pango: re-enable thai module
In-Reply-To: <cover.1267046193.git.thomas.petazzoni@free-electrons.com>
References: <cover.1267046193.git.thomas.petazzoni@free-electrons.com>
Message-ID: <431b0cb783c2a5053b93b6e06902eee18d4d7de0.1267046193.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This module got disabled when pango was upgraded to 1.19.3. But now,
the module builds fine. And even more: disabling it breaks the build
when modules are compiled statically into pango.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pango/pango-no-libthai.patch |   10 ----------
 1 files changed, 0 insertions(+), 10 deletions(-)
 delete mode 100644 package/pango/pango-no-libthai.patch

diff --git a/package/pango/pango-no-libthai.patch b/package/pango/pango-no-libthai.patch
deleted file mode 100644
index 78a3baf..0000000
--- a/package/pango/pango-no-libthai.patch
+++ /dev/null
@@ -1,10 +0,0 @@
---- a/modules/Makefile.am	2007-07-05 17:30:28.000000000 -0400
-+++ b/modules/Makefile.am	2008-02-09 19:37:13.000000000 -0500
-@@ -8,7 +8,6 @@ SUBDIRS = 		\
- 	indic           \
- 	khmer		\
- 	syriac		\
--	thai		\
- 	tibetan
- 
- EXTRA_DIST =		\
-- 
1.6.3.3
