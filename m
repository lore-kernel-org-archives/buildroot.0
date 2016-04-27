From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 27 Apr 2016 22:15:03 +0200
Subject: [Buildroot] [PATCH v4 3/3] toolchain/helper: update
	check_unusable_toolchain comment
In-Reply-To: <1461788103-12163-1-git-send-email-romain.naour@gmail.com>
References: <1461788103-12163-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1461788103-12163-3-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
v4: new patch
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
-- 
2.5.5
