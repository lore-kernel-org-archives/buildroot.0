From: Romain Naour <romain.naour@gmail.com>
Date: Tue,  9 Jun 2020 00:13:46 +0200
Subject: [Buildroot] [PATCH 4/5] toolchain-external: add gcc 10 entry
In-Reply-To: <20200608221347.2639059-1-romain.naour@gmail.com>
References: <20200608221347.2639059-1-romain.naour@gmail.com>
Message-ID: <20200608221347.2639059-4-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch allows to use an external toolchain based on gcc 10.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../toolchain-external-custom/Config.in.options               | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index a4430f7169..ee45e73292 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -31,6 +31,10 @@ choice
 	  Set to the gcc version that is used by your external
 	  toolchain.
 
+config BR2_TOOLCHAIN_EXTERNAL_GCC_10
+	bool "10.x"
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+
 config BR2_TOOLCHAIN_EXTERNAL_GCC_9
 	bool "9.x"
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
-- 
2.25.4
