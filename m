From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  2 Jun 2014 23:06:13 +0200
Subject: [Buildroot] [PATCH 11/11] docs/manual: add the virtual packages list
In-Reply-To: <cover.1401743146.git.yann.morin.1998@free.fr>
References: <cover.1401743146.git.yann.morin.1998@free.fr>
Message-ID: <28e1d0b8a88b0208938dcd1e0f4ed072a6e32f8b.1401743146.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

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

---
Note: a pre-rendered version of the manual with these modifications is
available at:
    http://ymorin.is-a-geek.org/download/tmp/buildroot/virtual-pacakges/manual/manual.html
---
 docs/manual/adding-packages-directory.txt | 10 ++++++++++
 docs/manual/adding-packages-virtual.txt   |  6 ++++++
 docs/manual/appendix.txt                  |  8 ++++++++
 3 files changed, 24 insertions(+)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index f735244..fe61d30 100644
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
 
-- 
1.8.3.2
