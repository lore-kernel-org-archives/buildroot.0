From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 12 Aug 2014 22:20:10 +0200
Subject: [Buildroot] [PATCH 5 of 8 RFCv2 for 2014.08] manual/getting
 started: rework 'System requirements' section
In-Reply-To: <patchbomb.1407874805@localhost>
References: <patchbomb.1407874805@localhost>
Message-ID: <dd6d42a03816c2c9bcd0.1407874810@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch reworks the requirements section of the manual as follows:
- some general rewording
- move configuration editor dependencies above the download tools, as this
  is the first thing people come in contact with.
- move sentence regarding -dev packages to configuration editor dependencies
  and restrict to 'libraries'.
- clarify the download tools part.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/manual/prerequisite.txt |  40 +++++++++++++++++++----------------
 1 files changed, 22 insertions(+), 18 deletions(-)

diff -r 2f17e63e3fec -r dd6d42a03816 docs/manual/prerequisite.txt
--- a/docs/manual/prerequisite.txt	Thu Aug 07 18:10:10 2014 +0200
+++ b/docs/manual/prerequisite.txt	Tue Aug 12 20:09:13 2014 +0200
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
 
@@ -45,14 +43,25 @@
 
 === Optional packages
 
+* Configuration interface dependencies:
++
+For these libraries, you need to install both runtime and development
+data, which in many distributions are packaged separately. The
+development packages typically have a _-dev_ or _-devel_ suffix.
++
+** +ncurses5+ to use the 'menuconfig' interface
+** +qt4+ to use the 'xconfig' interface
+** +glib2+, +gtk2+ and +glade2+ to use the 'gconfig' interface
+
 * Source fetching tools:
 +
-In the official tree, most of the package sources are retrieved
-using +wget+; a few are only available through their +git+, +mercurial+,
-+svn+ or +cvs+ repository.
-+
-All other source fetching methods are implemented and may be used in a
-development context (further details: refer to xref:download-infra[]).
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
@@ -62,11 +71,6 @@
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
