From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Mar 2019 19:49:39 +0100
Subject: [Buildroot] [git commit] toolchain-external: introduce
 BR2_TOOLCHAIN_EXTERNAL_OPENMP
Message-ID: <20190328185003.77C5781D34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=25ae113445853b1ed1cfc94785f066139f959667
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a new option for custom external toolchains to enable OpenMP
support.

Signed-off-by: Ed Blake <ed.blake@sondrel.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../toolchain-external-custom/Config.in.options                   | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 4f355bb454..607490260f 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -425,6 +425,14 @@ config BR2_TOOLCHAIN_EXTERNAL_FORTRAN
 	  support. If you don't know, leave the default value,
 	  Buildroot will tell you if it's correct or not.
 
+config BR2_TOOLCHAIN_EXTERNAL_OPENMP
+	bool "Toolchain has OpenMP support?"
+	select BR2_TOOLCHAIN_HAS_OPENMP
+	help
+	  Select this option if your external toolchain has OpenMP
+	  support. If you don't know, leave the default value,
+	  Buildroot will tell you if it's correct or not.
+
 config BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS
 	string "Extra toolchain libraries to be copied to target"
 	help
