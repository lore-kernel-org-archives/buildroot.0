From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Apr 2014 19:37:08 +0200
Subject: [Buildroot] [git commit] toolchain: add a hidden config option to
	enable the toolchain package
Message-ID: <20140416174100.164E59C80D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5f70a007c8e5a6c1ae6a01739a53c87c0fafbe44
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The usual way to enable a package using the package infrastructure is to
use a config option so instead to add the toolchain package to the
TARGETS variable in the Makefile add a config option like all the other
toolchain packages.

[Thomas: remove comment that no longer made sense in the main
Makefile, and add a comment above the new hidden Config.in option to
explain what it is useful for.]

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile            |    9 +--------
 toolchain/Config.in |    6 ++++++
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index 137921c..0f8ca72 100644
--- a/Makefile
+++ b/Makefile
@@ -294,14 +294,7 @@ unexport TERMINFO
 
 GNU_HOST_NAME:=$(shell support/gnuconfig/config.guess)
 
-################################################################################
-#
-# The list of stuff to build for the target toolchain
-# along with the packages to build for the target.
-#
-################################################################################
-
-TARGETS:= toolchain
+TARGETS :=
 
 # silent mode requested?
 QUIET:=$(if $(findstring s,$(MAKEFLAGS)),-q)
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 44f3ac6..a1065ac 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -1,5 +1,11 @@
 menu "Toolchain"
 
+# Invisible option that makes sure the toolchain package always gets
+# built
+config BR2_TOOLCHAIN
+	bool
+	default y
+
 # Should be selected for glibc or eglibc
 config BR2_TOOLCHAIN_USES_GLIBC
 	bool
