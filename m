From: Ed Blake <ed.blake@sondrel.com>
Date: Thu, 28 Mar 2019 18:48:15 +0000
Subject: [Buildroot] [PATCH 1/2] toolchain-external: introduce
 BR2_TOOLCHAIN_EXTERNAL_OPENMP
In-Reply-To: <cover.1553798445.git.ed.blake@sondrel.com>
References: <cover.1553798445.git.ed.blake@sondrel.com>
Message-ID: <dea5bfcbdcbe0787f679924fc962d71c47a11a39.1553798445.git.ed.blake@sondrel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a new option for custom external toolchains to enable OpenMP
support.

Signed-off-by: Ed Blake <ed.blake@sondrel.com>
---
 .../toolchain-external-custom/Config.in.options           | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 08a79ee4d9..74e445d625 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -421,6 +421,14 @@ config BR2_TOOLCHAIN_EXTERNAL_FORTRAN
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
-- 
2.17.1
