From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 17 Nov 2012 09:25:30 +0100
Subject: [Buildroot] [git commit] Mark a number of development related
	packages as deprecated
Message-ID: <20121117082644.5A8689A06D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d4e8f3cd4874c963da77480bcb76df05ffaaa739
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

automake, autoconf, libtool and make on the target are basically
useless if we don't support building a toolchain on the target. Of
course, the host variant of automake, autoconf and libtool will remain
available.

[Peter: fixup to apply after perl change]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/autoconf/Config.in |    2 ++
 package/automake/Config.in |    2 ++
 package/libtool/Config.in  |    2 ++
 package/make/Config.in     |    2 ++
 4 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/autoconf/Config.in b/package/autoconf/Config.in
index 5f2f148..60128e9 100644
--- a/package/autoconf/Config.in
+++ b/package/autoconf/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_AUTOCONF
 	bool "autoconf"
+	# We no longer support a toolchain on the target
+	depends on BR2_DEPRECATED
 	select BR2_PACKAGE_PERL
 	help
 	  Extensible program for developing configure scripts.  These
diff --git a/package/automake/Config.in b/package/automake/Config.in
index 9a9673a..e2f6cc7 100644
--- a/package/automake/Config.in
+++ b/package/automake/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_AUTOMAKE
 	bool "automake"
+	# We no longer support a toolchain on the target
+	depends on BR2_DEPRECATED
 	select BR2_PACKAGE_AUTOCONF
 	select BR2_PACKAGE_PERL
 	help
diff --git a/package/libtool/Config.in b/package/libtool/Config.in
index d3cf2d7..42df25b 100644
--- a/package/libtool/Config.in
+++ b/package/libtool/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_LIBTOOL
 	bool "libtool"
+	# We no longer support a toolchain on the target
+	depends on BR2_DEPRECATED
 	help
 	  Library that hides the complexity of using shared/static libraries
 	  on different platforms behind a consistent, portable interface.
diff --git a/package/make/Config.in b/package/make/Config.in
index ea2ae1b..e5cc970 100644
--- a/package/make/Config.in
+++ b/package/make/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_MAKE
 	bool "make"
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	# We no longer support a toolchain on the target
+	depends on BR2_DEPRECATED
 	help
 	  A tool which controls the generation of executables and other
 	  non-source files of a program from the program's source files.
