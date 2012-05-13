From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 13 May 2012 12:38:13 +0200
Subject: [Buildroot] [PATCH v2 03/11] manual: add prerequisite.txt
In-Reply-To: <1336905501-9757-1-git-send-email-s.martin49@gmail.com>
References: <4FAEEFA8.2070005@mind.be>
 <1336905501-9757-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1336905501-9757-4-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Samuel MARTIN <s.martin49@gmail.com>


Signed-off-by: Samuel Martin <s.martin49@gmail.com>

 create mode 100644 docs/manual/prerequisite.txt

diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
new file mode 100644
index 0000000..6ed3072
--- /dev/null
+++ b/docs/manual/prerequisite.txt
@@ -0,0 +1,62 @@
+[[requirement]]
+System requirements
+-------------------
+
+Buildroot is design to run on Linux system.
+
+Buildroot needs some software to be already installed on the host
+system; hereafter the lists of the mandatory and optional packages
+(packages' name may vary between distribution).
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
+** +build-essential+ (only for Debian based system)
+** +gcc+
+** +g+++
+** +bison+
+** +flex+
+** +gettext+
+** +patch+
+
+* Source fetching tools:
+** +wget+
+
+* Development libraries:
+** +ncurses5+
+
+[[requirement-optional]]
+
+Optional packages
+~~~~~~~~~~~~~~~~~
+
+* Build tools:
+** +gawk+
+
+* Source fetching tools:
+** +cvs+
+** +git+
+** +mercurial+
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
+// ** +jdk+ and and depending on the host system +gcj-compat+ for Java
+// development (for +java+, +jamvm+ and +gnu-classpath+)
+
+* Documentation generation tools:
+** +asciidoc+
+** +texinfo+
diff --git a/docs/manual/starting-up.txt b/docs/manual/starting-up.txt
index 4f567f0..3a74ea6 100644
--- a/docs/manual/starting-up.txt
+++ b/docs/manual/starting-up.txt
@@ -1,6 +1,8 @@
 Starting up
 ===========
 
+include::prerequisite.txt[]
+
 include::getting.txt[]
 
 include::using.txt[]
-- 
1.7.10.2
