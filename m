From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 28 Jan 2018 20:34:54 -0200
Subject: [Buildroot] [PATCH 1/4] toolchain: add 4.15.x choice for headers
Message-ID: <1517178897-5359-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 toolchain/toolchain-common.in                                        | 5 +++++
 .../toolchain-external/toolchain-external-custom/Config.in.options   | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 0000713..8941e0f 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -258,10 +258,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "4.15" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
 	default "4.14" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
 	default "4.13" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13
 	default "4.12" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index e35ef87..70c7d8e 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -108,6 +108,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_15
+	bool "4.15.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14
 	bool "4.14.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
-- 
2.7.4
