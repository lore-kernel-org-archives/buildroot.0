From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Aug 2013 10:25:27 +0200
Subject: [Buildroot] [git commit] manual: minor typos and formating fixes
Message-ID: <20130810082619.DB03F9B2B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5664c4af5c79394d36b5d46e4c553f035342c174
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-generic.txt |   16 +++++++++++-----
 docs/manual/contribute.txt              |    8 ++++----
 docs/manual/make-tips.txt               |    8 +++++---
 3 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index fdca612..4e50f8f 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -99,24 +99,30 @@ of the shell script(s) needing fixing. All these names are relative to
 In addition, the scripts listed in +LIBFOO_CONFIG_SCRIPTS+ are removed
 from +$(TARGET_DIR)/usr/bin+, since they are not needed on the target.
 
-Example 1:
-
+.Config script: 'divine' package
+================================
 Package divine installs shell script '$(STAGING_DIR)/usr/bin/divine-config'.
 
-So it's fixup would be:
+So its fixup would be:
 
+--------------------------------
 DIVINE_CONFIG_SCRIPTS = divine-config
+--------------------------------
+================================
 
-Example 2:
-
+.Config script: 'imagemagick' package:
+================================
 Package imagemagick installs the following scripts:
 '$(STAGING_DIR)/usr/bin/{Magick,Magick++,MagickCore,MagickWand,Wand}-config'
 
 So it's fixup would be:
 
+--------------------------------
 IMAGEMAGICK_CONFIG_SCRIPTS = \
    Magick-config Magick++-config \
    MagickCore-config MagickWand-config Wand-config
+--------------------------------
+================================
 
 On line 14, we specify the list of dependencies this package relies
 on. These dependencies are listed in terms of lower-case package names,
diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index f4e1a0e..3736d61 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -27,8 +27,8 @@ _rebase_ your development branch on top of the upstream tree before
 generating the patch set. To do so, run:
 
 ---------------------
- $ git fetch --all --tags
- $ git rebase origin/master
+$ git fetch --all --tags
+$ git rebase origin/master
 ---------------------
 
 Here, you are ready to generate then submit your patch set.
@@ -36,7 +36,7 @@ Here, you are ready to generate then submit your patch set.
 To generate it, run:
 
 ---------------------
- $ git format-patch -M -n -s -o outgoing origin/master
+$ git format-patch -M -n -s -o outgoing origin/master
 ---------------------
 
 This will generate patch files in the +outgoing+ subdirectory,
@@ -48,7 +48,7 @@ before submitting them using your favorite text editor.
 Lastly, send/submit your patch set to the Buildroot mailing list:
 
 ---------------------
- $ git send-email --to buildroot at busybox.net outgoing/*
+$ git send-email --to buildroot at busybox.net outgoing/*
 ---------------------
 
 Note that +git+ should be configured to use your mail account.
diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
index e87bbf7..c3fd155 100644
--- a/docs/manual/make-tips.txt
+++ b/docs/manual/make-tips.txt
@@ -29,8 +29,7 @@ The result of the search shows the help message of the matching items.
  $ make help
 --------------------
 
-.Not all targets are always available,
-
+Not all targets are always available,
 some settings in the +.config+ file may hide some targets:
 
 * +linux-menuconfig+ and +linux-savedefconfig+ only work when
@@ -71,12 +70,15 @@ The manual outputs will be generated in 'output/docs/manual'.
   xref:requirement-optional[]).
 - There is a known issue that you can't build it under Debian Squeeze.
 
+.Reseting Buildroot for a new target:
+
 To delete all build products as well as the configuration:
 
 --------------------
  $ make distclean
 --------------------
 
-Note that if +ccache+ is enabled, running +make clean+ or +distclean+ does
+.Notes
+If +ccache+ is enabled, running +make clean+ or +distclean+ does
 not empty the compiler cache used by Buildroot. To delete it, refer
 to xref:ccache[].
