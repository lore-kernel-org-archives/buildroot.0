From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Apr 2017 15:33:54 +0200
Subject: [Buildroot] [git commit] policycoreutils: fix check-package warnings
Message-ID: <20170409134130.4B420826CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fb38b44289a56fa06c1420b3d3ee4d3b1f0a30d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 - 'depends on' before 'select'
 - rewrap Config.in help text

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/policycoreutils/Config.in | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/package/policycoreutils/Config.in b/package/policycoreutils/Config.in
index 4b8a9dc..6b58d6e 100644
--- a/package/policycoreutils/Config.in
+++ b/package/policycoreutils/Config.in
@@ -6,24 +6,24 @@ comment "policycoreutils needs a glibc toolchain w/ threads, dynamic library"
 
 config BR2_PACKAGE_POLICYCOREUTILS
 	bool "policycoreutils"
-	select BR2_PACKAGE_LIBSEMANAGE
-	select BR2_PACKAGE_LIBCAP_NG
 	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS # libsemanage
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libsemanage
 	depends on !BR2_STATIC_LIBS #libsemanage
 	depends on !BR2_arc # libsemanage
 	depends on BR2_TOOLCHAIN_USES_GLIBC # libsemanage
+	select BR2_PACKAGE_LIBSEMANAGE
+	select BR2_PACKAGE_LIBCAP_NG
 	help
-	  Policycoreutils is a collection of policy utilities (originally
-	  the "core" set of utilities needed to use SELinux, although it
-	  has grown a bit over time), which have different dependencies.
-	  sestatus, secon, run_init, and newrole only use libselinux.
-	  load_policy and setfiles only use libselinux and libsepol.
-	  semodule and semanage use libsemanage (and thus bring in
-	  dependencies on libsepol and libselinux as well). setsebool
-	  uses libselinux to make non-persistent boolean changes (via
-	  the kernel interface) and uses libsemanage to make persistent
-	  boolean changes.
+	  Policycoreutils is a collection of policy utilities
+	  (originally the "core" set of utilities needed to use
+	  SELinux, although it has grown a bit over time), which have
+	  different dependencies.  sestatus, secon, run_init, and
+	  newrole only use libselinux.  load_policy and setfiles only
+	  use libselinux and libsepol.  semodule and semanage use
+	  libsemanage (and thus bring in dependencies on libsepol and
+	  libselinux as well). setsebool uses libselinux to make
+	  non-persistent boolean changes (via the kernel interface)
+	  and uses libsemanage to make persistent boolean changes.
 
 	  The base package will install the following utilities:
 	      load_policy
@@ -67,10 +67,10 @@ comment "audit2allow needs a glibc toolchain w/ wchar, threads, dynamic library"
 
 config BR2_PACKAGE_POLICYCOREUTILS_RESTORECOND
 	bool "restorecond"
-	select BR2_PACKAGE_LIBGLIB2
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
+	select BR2_PACKAGE_LIBGLIB2
 	help
 	  Enable restorecond to be built
 
