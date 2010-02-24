From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Feb 2010 22:59:32 +0100
Subject: [Buildroot] [git commit master] pango: re-enable thai module
Message-ID: <20100224220116.0C52677798@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9f19a96360600777093f5f95bb3dd3d3a152e4bb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
