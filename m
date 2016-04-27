From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Apr 2016 22:19:19 +0200
Subject: [Buildroot] [git commit] toolchain/helper: update
	check_unusable_toolchain comment
Message-ID: <20160427201954.C5A2F81E9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b201090d8a9705c1660101d5ee3078a88ded9ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/helpers.mk | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 4548ede..d28a2ca 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -348,9 +348,12 @@ check_cross_compiler_exists = \
 	fi
 
 #
-# Check for toolchains known not to work with Buildroot. For now, we
-# only check for Angstrom toolchains, by looking at the vendor part of
-# the host tuple.
+# Check for toolchains known not to work with Buildroot.
+# - For the Angstrom toolchains, we check by looking at the vendor part of
+#   the host tuple.
+# - Exclude distro-class toolchains which are not relocatable.
+# - Exclude broken toolchains which return "libc.a" with -print-file-name.
+# - Exclude toolchains which doesn't support --sysroot option.
 #
 # $1: cross-gcc path
 #
