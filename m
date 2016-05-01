From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sun,  1 May 2016 09:29:35 +0200
Subject: [Buildroot] [PATCH] toolchain-external: add GCC 6.x option
Message-ID: <1462087775-20256-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 519d83bfa0442439026db4e71e605a5c1347e566 adds support for GCC 6. Add an
GCC 6.x option for external toolchains, too.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 toolchain/toolchain-external/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 0236b2c..d4e72a8 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -768,6 +768,10 @@ choice
 	  Set to the gcc version that is used by your external
 	  toolchain.
 
+config BR2_TOOLCHAIN_EXTERNAL_GCC_6
+	bool "6.x"
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
+
 config BR2_TOOLCHAIN_EXTERNAL_GCC_5
 	bool "5.x"
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
-- 
2.8.2
