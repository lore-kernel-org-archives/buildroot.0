From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 27 Jun 2016 16:13:51 +0100
Subject: [Buildroot] [PATCH 11/13] toolchain/toolchain-external: add knob
	for fortran support
Message-ID: <1467040433-40356-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Samuel Martin <s.martin49@gmail.com>

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 toolchain/toolchain-external/Config.in | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 7aee57f..4abd658 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -1020,6 +1020,18 @@ config BR2_TOOLCHAIN_EXTERNAL_CXX
 	  support. If you don't know, leave the default value,
 	  Buildroot will tell you if it's correct or not.
 
+config BR2_TOOLCHAIN_EXTERNAL_FORTRAN
+	bool "Toolchain has Fortran support?"
+	depends on BR2_USE_WCHAR # libquadmath
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	help
+	  Select this option if your external toolchain has fortran
+	  support. If you don't know, leave the default value,
+	  Buildroot will tell you if it's correct or not.
+
+comment "Fortran support needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
+
 config BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS
 	string "Extra toolchain libraries to be copied to target"
 	help
-- 
2.7.3
