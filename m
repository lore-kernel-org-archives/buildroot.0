From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 15 Nov 2012 23:58:49 +0100
Subject: [Buildroot] [git commit] manual: add prerequisite.txt
Message-ID: <20121115230539.4FA2499E3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4ea3644afdd396efadbe1e1efd2eaa098cc2bc03
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/prerequisite.txt |   84 ++++++++++++++++++++++++++++++++++++++++++
 docs/manual/starting-up.txt  |    2 +
 2 files changed, 86 insertions(+), 0 deletions(-)

diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
new file mode 100644
index 0000000..b24731f
--- /dev/null
+++ b/docs/manual/prerequisite.txt
@@ -0,0 +1,84 @@
+// -*- mode:doc -*- ;
+
+[[requirement]]
+System requirements
+-------------------
+
+Buildroot is design to run on Linux system.
+
+Buildroot needs some software to be already installed on the host
+system; hereafter the lists of the mandatory and optional packages
+(package names may vary between distributions).
+
+Take care of _installing both runtime and development data_, especially
+for the libraries that may be packaged in 2 distinct packages.
+
+
+[[requirement-mandatory]]
+
+Mandatory packages
+~~~~~~~~~~~~~~~~~~
+
+* Build tools:
+
+** +which+
+** +sed+
+** +make+ (version 3.82 or any later)
+** +binutils+
+** +build-essential+ (only for Debian based systems)
+** +gcc+ (version 2.95 or any later)
+** `g++` (version 2.95 or any later)
+** +bash+
+** +gawk+
+** +bison+
+** +flex+
+** +gettext+
+** +patch+
+** +gzip+
+** +bzip2+
+** +perl+
+** +tar+
+** +cpio+
+** +python+ (version 2.6 or 2.7)
+** +unzip+
+** +rsync+
+
+* Source fetching tools:
+** +wget+
+
+* Configuration interface dependencies (requires development libraries):
+** +ncurses5+
+
+[[requirement-optional]]
+
+Optional packages
+~~~~~~~~~~~~~~~~~
+
+* Source fetching tools:
++
+In the official tree, most of the package sources are retrieved
+using +wget+, few are only available through their +git+, +mercurial+,
+or +svn+ repository.
++
+All other source fetching methods are implemented and may be used in a
+development context.
++
+** +bazaar+
+** +cvs+
+** +git+
+** +mercurial+
+** +rsync+
+** +scp+
+** +subversion+
+
+* Configuration interface dependencies (requires development libraries):
+** +qt4+ to use the 'xconfig' interface
+** +glib2+, +gtk2+ and +glade2+ to use the 'gconfig' interface
+
+* Development libraries:
+** +zlib1+
+** +netpbm10+ (for +fbtest+)
+** +python-xcbgen+ (for +Matchbox+ on Debian based system)
+
+* Documentation generation tools:
+** +asciidoc+
diff --git a/docs/manual/starting-up.txt b/docs/manual/starting-up.txt
index 8ba16c9..2999fd4 100644
--- a/docs/manual/starting-up.txt
+++ b/docs/manual/starting-up.txt
@@ -3,6 +3,8 @@
 Starting up
 ===========
 
+include::prerequisite.txt[]
+
 include::getting.txt[]
 
 include::using.txt[]
