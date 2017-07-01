From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 19:43:46 +0200
Subject: [Buildroot] [git commit] manual: update old references to
	support/scripts
Message-ID: <20170701174125.B47AA81911@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=56f21c283c6f1546a6d7498a53112b7bd33803af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There were still some references to the old location of the scripts in
the manual. Replace them by utils/.

While we're at it, remove the redundant ./ at the beginning of some of
the example commands.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-python.txt | 8 ++++----
 docs/manual/common-usage.txt           | 2 +-
 docs/manual/developers.txt             | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/docs/manual/adding-packages-python.txt b/docs/manual/adding-packages-python.txt
index a67a4be..5eb6ba5 100644
--- a/docs/manual/adding-packages-python.txt
+++ b/docs/manual/adding-packages-python.txt
@@ -167,7 +167,7 @@ possible to customize what is done in any particular step:
 
 If the Python package for which you would like to create a Buildroot
 package is available on PyPI, you may want to use the +scanpypi+ tool
-located in +support/scripts+ to automate the process.
+located in +utils/+ to automate the process.
 
 You can find the list of existing PyPI packages
 https://pypi.python.org[here].
@@ -178,7 +178,7 @@ your host.
 When at the root of your buildroot directory just do :
 
 -----------------------
-./support/scripts/scanpypi foo bar -o package
+utils/scanpypi foo bar -o package
 -----------------------
 
 This will generate packages +python-foo+ and +python-bar+ in the package
@@ -198,7 +198,7 @@ If your Buildroot package is not in the official Buildroot tree but in
 a br2-external tree, use the -o flag as follows:
 
 -----------------------
-./support/scripts/scanpypi foo bar -o other_package_dir
+utils/scanpypi foo bar -o other_package_dir
 -----------------------
 
 This will generate packages +python-foo+ and +python-bar+ in the
@@ -207,7 +207,7 @@ This will generate packages +python-foo+ and +python-bar+ in the
 Option +-h+ will list the available options:
 
 -----------------------
-./support/scripts/scanpypi -h
+utils/scanpypi -h
 -----------------------
 
 [[python-package-cffi-backend]]
diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index 8dd99a6..a22da20 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -326,7 +326,7 @@ Buildroot release, use the +size-stats-compare+ script. It takes two
 Refer to the help text of this script for more details:
 
 ----------------
-support/scripts/size-stats-compare -h
+utils/size-stats-compare -h
 ----------------
 
 include::eclipse-integration.txt[]
diff --git a/docs/manual/developers.txt b/docs/manual/developers.txt
index 3c31aa9..4e2cd71 100644
--- a/docs/manual/developers.txt
+++ b/docs/manual/developers.txt
@@ -26,7 +26,7 @@ to include in his patch the appropriate modification to the
 The +DEVELOPERS+ file format is documented in detail inside the file
 itself.
 
-The +get-developer+ tool, located in +support/scripts+ allows to use
+The +get-developer+ tool, located in +utils/+ allows to use
 the +DEVELOPERS+ file for various tasks:
 
 - When passing one or several patches as command line argument,
