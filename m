From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:53:43 -0000
Subject: [Buildroot] [git commit branch/next] docs: describe "file" and
	"local" methods in LIBFOO_SITE_METHOD
Message-ID: <20120802195247.AD5B296EA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fe8d4626f0225285eed4190958a5dc75cbefd972
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Based on description by Thomas Petazzoni at:
http://free-electrons.com/blog/buildroot-2011-11/

Signed-off-by: Nathan Lynch <ntl@pobox.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/adding-packages-gentargets.txt |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/docs/manual/adding-packages-gentargets.txt b/docs/manual/adding-packages-gentargets.txt
index b296ac4..84cf06b 100644
--- a/docs/manual/adding-packages-gentargets.txt
+++ b/docs/manual/adding-packages-gentargets.txt
@@ -209,6 +209,14 @@ information is (assuming the package name is +libfoo+) :
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
