From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 18 Apr 2019 17:29:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/ghostscript: disable parallel build
Message-ID: <20190418152950.30778-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Issue reported upstream

Fixes:
 - http://autobuild.buildroot.org/results/eb33b41d1b267d0207a6e3a9f5ca7f79b2f51887

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ghostscript/ghostscript.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index fefac2aee3..57e56d6eb2 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -23,6 +23,9 @@ GHOSTSCRIPT_DEPENDENCIES = \
 	libpng \
 	tiff
 
+# Parallel build broken: https://bugs.ghostscript.com/show_bug.cgi?id=700986
+GHOSTSCRIPT_MAKE = $(MAKE1)
+
 # Ghostscript includes (old) copies of several libraries, delete them.
 # Inspired by linuxfromscratch:
 # http://www.linuxfromscratch.org/blfs/view/svn/pst/gs.html
-- 
2.20.1
