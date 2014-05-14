From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 14 May 2014 23:11:34 +0200
Subject: [Buildroot] [PATCH 2/3] docs/manual: document the new FOO_PROVIDES
	variable
In-Reply-To: <cover.1400101273.git.yann.morin.1998@free.fr>
References: <cover.1400101273.git.yann.morin.1998@free.fr>
Message-ID: <0dad6313445d161cc75a22d89173fc43998ade64.1400101273.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Samuel Martin <s.martin49@gmail.com>
---
 docs/manual/adding-packages-generic.txt |  3 +++
 docs/manual/adding-packages-virtual.txt | 15 ++++++++++++---
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index f421651..d3fa45b 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -304,6 +304,9 @@ information is (assuming the package name is +libfoo+) :
   a similar way, +HOST_LIBFOO_DEPENDENCIES+ lists the dependencies for
   the current host package.
 
+* +LIBFOO_PROVIDES+ lists all the virtual packages +libfoo+ is an
+  implementation of. See xref:virtual-package-tutorial[].
+
 * +LIBFOO_INSTALL_STAGING+ can be set to +YES+ or +NO+ (default). If
   set to +YES+, then the commands in the +LIBFOO_INSTALL_STAGING_CMDS+
   variables are executed to install the package into the staging
diff --git a/docs/manual/adding-packages-virtual.txt b/docs/manual/adding-packages-virtual.txt
index 1c1116f..0cbe753 100644
--- a/docs/manual/adding-packages-virtual.txt
+++ b/docs/manual/adding-packages-virtual.txt
@@ -39,7 +39,7 @@ In this file, we declare two options, +BR2_PACKAGE_HAS_SOMETHING_VIRTUAL+ and
 +BR2_PACKAGE_PROVIDES_SOMETHING_VIRTUAL+, whose values will be used by the
 providers.
 
-==== Virtual package's +*.mk+ file
+==== Virtual package's +.mk+ file
 
 The +.mk+ for the virtual package should just evaluate the +virtual-package+ macro:
 
@@ -59,8 +59,7 @@ The ability to have target and host packages is also available, with the
 ==== Provider's +Config.in+ file
 
 When adding a package as a provider, only the +Config.in+ file requires some
-modifications. The +*.mk+ file should follow the Buildroot infrastructure with
-no change at all.
+modifications.
 
 The +Config.in+ file of the package 'some-provider', which provides the
 functionalities of 'something-virtual', should contain:
@@ -84,6 +83,16 @@ On line 3, we select +BR2_PACKAGE_HAS_SOMETHING_VIRTUAL+, and on line 11, we
 set the value of +BR2_PACKAGE_PROVIDES_SOMETHING_VIRTUAL+ to the name of the
 provider, but only if it is selected.
 
+==== Provider's +.mk+ file
+
+The +.mk+ file should also declare an additional variable
++SOME_PROVIDER_PROVIDES+ to contain the names of all the virtual
+packages it is an implementation of:
+
+---------------------------
+01: SOME_PROVIDER_PROVIDES = something-virtual
+---------------------------
+
 Of course, do not forget to add the proper build and runtime dependencies for
 this package!
 
-- 
1.8.3.2
