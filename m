From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Oct 2018 20:27:45 +0200
Subject: [Buildroot] [git commit] toolchain-external: add fortran support
 option for custom external toolchains
Message-ID: <20181020182612.82D6687FE5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f0dc4fe80f415e2b431a3fbb6b2d9a24a6879c52
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If a custom external toolchain is used, we can't enable the fortran
support. Add a new option for that.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../toolchain-external-custom/Config.in.options                   | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 4639232bfb..8665d2e2a7 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -405,6 +405,14 @@ config BR2_TOOLCHAIN_EXTERNAL_CXX
 	  support. If you don't know, leave the default value,
 	  Buildroot will tell you if it's correct or not.
 
+config BR2_TOOLCHAIN_EXTERNAL_FORTRAN
+	bool "Toolchain has Fortran support?"
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	help
+	  Select this option if your external toolchain has Fortran
+	  support. If you don't know, leave the default value,
+	  Buildroot will tell you if it's correct or not.
+
 config BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS
 	string "Extra toolchain libraries to be copied to target"
 	help
