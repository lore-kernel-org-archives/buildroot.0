From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 11 Nov 2012 14:14:48 +0100
Subject: [Buildroot] [PATCH 10/23] manual: add prerequisite.txt
In-Reply-To: <1352639701-27829-1-git-send-email-s.martin49@gmail.com>
References: <1352639701-27829-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1352639701-27829-11-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>

 create mode 100644 docs/manual/prerequisite.txt

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
-- 
1.8.0
