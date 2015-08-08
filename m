From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:37 -0000
Subject: [Buildroot] [git commit branch/next] docs/manual: document
	<PKG>_STRIP_COMPONENTS
Message-ID: <20150808105627.C871380414@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=62803be844b19e32c952cfff995354cf263d0f5d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Arnout Vandecappelle <arnout@mind.be>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-generic.txt |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index bc07667..4c12b42 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -303,6 +303,15 @@ information is (assuming the package name is +libfoo+) :
      the package source code. Buildroot copies the contents of the
      source directory into the package's build directory.
 
+* +LIBFOO_STRIP_COMPONENTS+ is the number of leading components
+  (directories) that tar must strip from file names on extraction.
+  The tarball for most packages has one leading component named
+  "<pkg-name>-<pkg-version>", thus Buildroot passes
+  --strip-components=1 to tar to remove it.
+  For non-standard packages that don't have this component, or
+  that have more than one leading component to strip, set this
+  variable with the value to be passed to tar. Default: 1.
+
 * +LIBFOO_DEPENDENCIES+ lists the dependencies (in terms of package
   name) that are required for the current target package to
   compile. These dependencies are guaranteed to be compiled and
