From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 15 Nov 2014 17:29:22 +0100
Subject: [Buildroot] [PATCH 7/9] manual: Remove dollar before command example
In-Reply-To: <1416068964-22529-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1416068964-22529-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1416068964-22529-7-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to harmonize the manual, in some places there was a dollar
before and other place did not have that dollar.

Made the choice to remove the dollar in order to facilitate copy/paste
from the manual.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 docs/manual/common-usage.txt        | 12 ++++++------
 docs/manual/make-tips.txt           | 12 ++++++------
 docs/manual/quickstart.txt          | 10 +++++-----
 docs/manual/rebuilding-packages.txt |  2 +-
 4 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index 89cd9fe..6ce97f1 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -14,7 +14,7 @@ all sources that you previously selected in the configurator
 ('menuconfig', 'nconfig', 'xconfig' or 'gconfig'), then issue:
 
 --------------------
- $ make source
+make source
 --------------------
 
 You can now disconnect or copy the content of your +dl+
@@ -30,13 +30,13 @@ the Linux kernel. To use it, add +O=<directory>+ to the make command
 line:
 
 --------------------
- $ make O=/tmp/build
+make O=/tmp/build
 --------------------
 
 Or:
 
 --------------------
- $ cd /tmp/build; make O=$PWD -C path/to/buildroot
+cd /tmp/build; make O=$PWD -C path/to/buildroot
 --------------------
 
 All the output files will be located under +/tmp/build+. If the +O+
@@ -57,7 +57,7 @@ directory - so after the first run, you no longer need to pass +O=<...>+
 and +-C <...>+, simply run (in the output directory):
 
 --------------------
- $ make <target>
+make <target>
 --------------------
 
 [[env-vars]]
@@ -103,14 +103,14 @@ An example that uses config files located in the toplevel directory and
 in your $HOME:
 
 --------------------
- $ make UCLIBC_CONFIG_FILE=uClibc.config BUSYBOX_CONFIG_FILE=$HOME/bb.config
+make UCLIBC_CONFIG_FILE=uClibc.config BUSYBOX_CONFIG_FILE=$HOME/bb.config
 --------------------
 
 If you want to use a compiler other than the default +gcc+
 or +g+++ for building helper-binaries on your host, then do
 
 --------------------
- $ make HOSTCXX=g++-4.3-HEAD HOSTCC=gcc-4.3-HEAD
+make HOSTCXX=g++-4.3-HEAD HOSTCC=gcc-4.3-HEAD
 --------------------
 
 === Dealing efficiently with filesystem images
diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
index 027eddf..f078eea 100644
--- a/docs/manual/make-tips.txt
+++ b/docs/manual/make-tips.txt
@@ -9,13 +9,13 @@ This is a collection of tips that help you make the most of Buildroot.
 .Display all commands executed by make:
 
 --------------------
- $ make V=1 <target>
+make V=1 <target>
 --------------------
 
 .Display all available targets:
 
 --------------------
- $ make help
+make help
 --------------------
 
 Not all targets are always available,
@@ -38,7 +38,7 @@ To delete all build products (including build directories, host, staging
 and target trees, the images and the toolchain):
 
 --------------------
- $ make clean
+make clean
 --------------------
 
 .Generating the manual:
@@ -47,8 +47,8 @@ The present manual sources are located in the 'docs/manual' directory.
 To generate the manual:
 
 ---------------------------------
- $ make manual-clean
- $ make manual
+make manual-clean
+make manual
 ---------------------------------
 
 The manual outputs will be generated in 'output/docs/manual'.
@@ -62,7 +62,7 @@ The manual outputs will be generated in 'output/docs/manual'.
 To delete all build products as well as the configuration:
 
 --------------------
- $ make distclean
+make distclean
 --------------------
 
 .Notes
diff --git a/docs/manual/quickstart.txt b/docs/manual/quickstart.txt
index 975fffc..24b18de 100644
--- a/docs/manual/quickstart.txt
+++ b/docs/manual/quickstart.txt
@@ -16,25 +16,25 @@ http://www.busybox.net/[BusyBox].
 From the buildroot directory, run
 
 --------------------
- $ make menuconfig
+make menuconfig
 --------------------
 
 for the original curses-based configurator, or
 
 --------------------
- $ make nconfig
+make nconfig
 --------------------
 
 for the new curses-based configurator, or
 
 --------------------
- $ make xconfig
+make xconfig
 --------------------
 
 for the Qt-based configurator, or
 
 --------------------
- $ make gconfig
+make gconfig
 --------------------
 
 for the GTK-based configurator.
@@ -57,7 +57,7 @@ read by the top-level Makefile.
 To start the build process, simply run:
 
 --------------------
- $ make
+make
 --------------------
 
 You *should never* use +make -jN+ with Buildroot: top-level parallel
diff --git a/docs/manual/rebuilding-packages.txt b/docs/manual/rebuilding-packages.txt
index 6faa67a..00423e4 100644
--- a/docs/manual/rebuilding-packages.txt
+++ b/docs/manual/rebuilding-packages.txt
@@ -77,7 +77,7 @@ necessary, and you will save more and more time.
 For reference, a full rebuild is achieved by running:
 
 ---------------
-$ make clean all
+make clean all
 ---------------
 
 [[rebuild-pkg]]
-- 
2.1.3
