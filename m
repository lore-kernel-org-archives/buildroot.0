From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Aug 2014 21:09:52 +0200
Subject: [Buildroot] [git commit] manual/getting started: rework 'System
	requirements' section
Message-ID: <20140817191116.072E59D427@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9c353541ffcbdc4c34a1c2c2c8741f70200e2e9c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch reworks the requirements section of the manual as follows:
- some general rewording
- move configuration editor dependencies above the download tools, as this
  is the first thing people come in contact with.
- move sentence regarding -dev packages to configuration editor dependencies
  and restrict to 'libraries'.
- clarify the download tools part.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/prerequisite.txt |   40 ++++++++++++++++++++++------------------
 1 files changed, 22 insertions(+), 18 deletions(-)

diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
index 30970d2..6ee01b4 100644
--- a/docs/manual/prerequisite.txt
+++ b/docs/manual/prerequisite.txt
@@ -6,13 +6,11 @@
 
 Buildroot is designed to run on Linux systems.
 
-Buildroot needs some software to be already installed on the host
-system; here are the lists of the mandatory and optional packages
-(package names may vary between distributions).
-
-Take care to _install both runtime and development data_, especially
-for the libraries that may be packaged in 2 distinct packages.
-
+While Buildroot itself will build most host packages it needs for the
+compilation, certain standard Linux utilities are expected to be
+already installed on the host system. Below you will find an overview of
+the mandatory and optional packages (note that package names may vary
+between distributions).
 
 [[requirement-mandatory]]
 
@@ -45,14 +43,25 @@ for the libraries that may be packaged in 2 distinct packages.
 
 === Optional packages
 
-* Source fetching tools:
+* Configuration interface dependencies:
 +
-In the official tree, most of the package sources are retrieved
-using +wget+; a few are only available through their +git+, +mercurial+,
-+svn+ or +cvs+ repository.
+For these libraries, you need to install both runtime and development
+data, which in many distributions are packaged separately. The
+development packages typically have a _-dev_ or _-devel_ suffix.
 +
-All other source fetching methods are implemented and may be used in a
-development context (further details: refer to xref:download-infra[]).
+** +ncurses5+ to use the 'menuconfig' interface
+** +qt4+ to use the 'xconfig' interface
+** +glib2+, +gtk2+ and +glade2+ to use the 'gconfig' interface
+
+* Source fetching tools:
++
+In the official tree, most of the package sources are retrieved using
++wget+ from _ftp_, _http_ or _https_ locations. A few packages are only
+available through a version control system. Moreover, Buildroot is
+capable of downloading sources via other tools, like +rsync+ or +scp+
+(refer to xref:download-infra[] for more details). If you enable
+packages using any of these methods, you will need to install the
+corresponding tool on the host system:
 +
 ** +bazaar+
 ** +cvs+
@@ -62,11 +71,6 @@ development context (further details: refer to xref:download-infra[]).
 ** +scp+
 ** +subversion+
 
-* Configuration interface dependencies (requires development libraries):
-** +ncurses5+ to use the 'menuconfig' interface
-** +qt4+ to use the 'xconfig' interface
-** +glib2+, +gtk2+ and +glade2+ to use the 'gconfig' interface
-
 * Java-related packages, if the Java Classpath needs to be built for
   the target system:
 ** The +javac+ compiler
