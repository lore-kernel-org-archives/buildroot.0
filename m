From: Nathan Lynch <ntl@pobox.com>
Date: Sun, 17 Jun 2012 16:54:01 -0500
Subject: [Buildroot] [PATCH 3/3] docs: describe "file" and "local" methods
 in LIBFOO_SITE_METHOD
In-Reply-To: <1339970041-17398-1-git-send-email-ntl@pobox.com>
References: <1339970041-17398-1-git-send-email-ntl@pobox.com>
Message-ID: <1339970041-17398-4-git-send-email-ntl@pobox.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Based on description by Thomas Petazzoni at:
http://free-electrons.com/blog/buildroot-2011-11/

Signed-off-by: Nathan Lynch <ntl@pobox.com>
---
 docs/manual/adding-packages-gentargets.txt |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/docs/manual/adding-packages-gentargets.txt b/docs/manual/adding-packages-gentargets.txt
index b296ac4..84cf06b 100644
--- a/docs/manual/adding-packages-gentargets.txt
+++ b/docs/manual/adding-packages-gentargets.txt
@@ -209,6 +209,14 @@ The list of variables that can be set in a +.mk+ file to give metadata
   ** +bzr+ for retrieving source code from a Bazaar repository. Used
      by default when +LIBFOO_SITE+ begins with +bzr://+. The
      downloaded source code is cached as with the +svn+ method.
+  ** +file+ for a local tarball.  One should use this when
+     +LIBFOO_SITE+ specifies a package tarball as a local filename.
+     Useful for software that isn't available publicly or in version
+     control.
+  ** +local+ for a local source code directory.  One should use this
+     when +LIBFOO_SITE+ specifies a local directory path containing
+     the package source code.  Buildroot copies the contents of the
+     source directory into the package's build directory.
 
 * +LIBFOO_DEPENDENCIES+ lists the dependencies (in terms of package
   name) that are required for the current target package to
-- 
1.7.10.2
