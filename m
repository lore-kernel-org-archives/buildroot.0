From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jun 2017 21:43:05 +0200
Subject: [Buildroot] [git commit] support/scripts: fix shebang with bash
Message-ID: <20170608194309.4998580DB7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9cbe364f578bba25d499a45c46c56ced35153ae3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/br2-external               | 2 +-
 support/scripts/check-bin-arch             | 2 +-
 support/scripts/fix-configure-powerpc64.sh | 2 +-
 support/scripts/genimage.sh                | 2 +-
 support/scripts/hardlink-or-copy           | 2 +-
 support/scripts/test-pkg                   | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index 7e81608..00cb57d 100755
--- a/support/scripts/br2-external
+++ b/support/scripts/br2-external
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/usr/bin/env bash
 set -e
 
 # This script must be able to run with bash-3.1, so it can't use
diff --git a/support/scripts/check-bin-arch b/support/scripts/check-bin-arch
index ff974a7..b822cdd 100755
--- a/support/scripts/check-bin-arch
+++ b/support/scripts/check-bin-arch
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/usr/bin/env bash
 
 while getopts p:l:r:a: OPT ; do
 	case "${OPT}" in
diff --git a/support/scripts/fix-configure-powerpc64.sh b/support/scripts/fix-configure-powerpc64.sh
index ad71042..ff2b283 100755
--- a/support/scripts/fix-configure-powerpc64.sh
+++ b/support/scripts/fix-configure-powerpc64.sh
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/usr/bin/env bash
 
 # This is a script to find, and correct, a problem with old versions of
 # configure that affect powerpc64 and powerpc64le.
diff --git a/support/scripts/genimage.sh b/support/scripts/genimage.sh
index 6c8d9e5..625afc1 100755
--- a/support/scripts/genimage.sh
+++ b/support/scripts/genimage.sh
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/usr/bin/env bash
 
 die() {
   echo "Error: $@" >&2
diff --git a/support/scripts/hardlink-or-copy b/support/scripts/hardlink-or-copy
index b046bdf..a052318 100755
--- a/support/scripts/hardlink-or-copy
+++ b/support/scripts/hardlink-or-copy
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/usr/bin/env bash
 
 # Try to hardlink a file into a directory, fallback to copy on failure.
 #
diff --git a/support/scripts/test-pkg b/support/scripts/test-pkg
index f08c608..7633a21 100755
--- a/support/scripts/test-pkg
+++ b/support/scripts/test-pkg
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/usr/bin/env bash
 set -e
 
 TOOLCHAINS_URL='http://autobuild.buildroot.org/toolchains/configs/toolchain-configs.csv'
