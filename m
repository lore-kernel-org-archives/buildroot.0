From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 17:11:47 +0200
Subject: [Buildroot] [git commit] docs/manual: add the virtual packages list
Message-ID: <20140608151244.7627A9CF25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=07c642b735d03b83c31824afe0aa2bd6d31699b9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the list of virtual packages as an appendix to the manual.

Also reference this list from appropriate locations elsewhere in
the manual:

  - in section 7.2.2. "Config.in file", after the existing explanations
    on dependencies on target and toolchain options, on a linux kernel,
    and on udev /dev management,

  - in section 7.2.10. "Infrastructure for virtual packages", in the
    provider Config.in and .mk explanations, to have the list of existing
    symbols to select (in Config.in) and packages to provide (in .mk).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-directory.txt |   10 ++++++++++
 docs/manual/adding-packages-virtual.txt   |    6 ++++++
 docs/manual/appendix.txt                  |    8 ++++++++
 3 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 070718e..69b012c 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -298,6 +298,16 @@ management, use this format:
 foo needs udev /dev management and a toolchain w/ featA, featB, featC
 --------------------------
 
+==== Dependencies on features provided by virtual packages
+
+Some features can be provided by more than one package, such as the
+openGL libraries.
+
+See xref:virtual-package-tutorial[] for more on the virtual packages.
+
+See xref:virtual-package-list[] for the symbols to depend on if your package
+depends on a feature provided by a virtual package.
+
 === The +.mk+ file
 
 [[adding-packages-mk]]
diff --git a/docs/manual/adding-packages-virtual.txt b/docs/manual/adding-packages-virtual.txt
index 6326bb5..a5f17a2 100644
--- a/docs/manual/adding-packages-virtual.txt
+++ b/docs/manual/adding-packages-virtual.txt
@@ -83,6 +83,9 @@ On line 3, we select +BR2_PACKAGE_HAS_SOMETHING_VIRTUAL+, and on line 11, we
 set the value of +BR2_PACKAGE_PROVIDES_SOMETHING_VIRTUAL+ to the name of the
 provider, but only if it is selected.
 
+See xref:virtual-package-list[] for the symbols to select if you implement
+a new provider for an existing virtual package.
+
 ==== Provider's +.mk+ file
 
 The +.mk+ file should also declare an additional variable
@@ -96,6 +99,9 @@ packages it is an implementation of:
 Of course, do not forget to add the proper build and runtime dependencies for
 this package!
 
+See xref:virtual-package-list[] for the names of virtual packages to provide
+if you implement a new provider for an existing virtual package.
+
 ==== Notes on depending on a virtual package
 
 When adding a package that requires a certain +FEATURE+ provided by a virtual
diff --git a/docs/manual/appendix.txt b/docs/manual/appendix.txt
index 35328c6..3f95551 100644
--- a/docs/manual/appendix.txt
+++ b/docs/manual/appendix.txt
@@ -14,6 +14,14 @@ include::makeusers-syntax.txt[]
 
 include::package-list.txt[]
 
+[[virtual-package-list]]
+== List of virtual packages
+
+These are the virtual packages known to +Buildroot+, with the
+corresponding symbols and providers.
+
+include::virtual-package-list.txt[]
+
 [[host-package-list]]
 == List of host utilities available in Buildroot
 
