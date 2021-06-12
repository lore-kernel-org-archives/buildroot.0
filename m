From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 12 Jun 2021 11:40:14 +0200
Subject: [Buildroot] [PATCH 5/6]
 toolchain/toolchain-external/toolchain-external-custom: add gcc 11 version
 selection
In-Reply-To: <20210612094015.6792-1-romain.naour@gmail.com>
References: <20210612094015.6792-1-romain.naour@gmail.com>
Message-ID: <20210612094015.6792-5-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch allows to use an external toolchain based on gcc 11.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../toolchain-external-custom/Config.in.options               | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index ba9aeb29ad..4a3345e4a5 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -31,6 +31,10 @@ choice
 	  Set to the gcc version that is used by your external
 	  toolchain.
 
+config BR2_TOOLCHAIN_EXTERNAL_GCC_11
+	bool "11.x"
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+
 config BR2_TOOLCHAIN_EXTERNAL_GCC_10
 	bool "10.x"
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
-- 
2.31.1
