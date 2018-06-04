From: Fabio Estevam <festevam@gmail.com>
Date: Mon,  4 Jun 2018 09:48:25 -0300
Subject: [Buildroot] [PATCH 1/4] toolchain: add 4.17.x choice for headers
Message-ID: <1528116508-12103-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 toolchain/Config.in                                                  | 5 +++++
 .../toolchain-external/toolchain-external-custom/Config.in.options   | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 3936fc4..3a53a32 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -336,10 +336,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "4.17" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17
 	default "4.16" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16
 	default "4.15" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
 	default "4.14" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 2ef1126..6a9921c 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -123,6 +123,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_17
+	bool "4.17.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_16
 	bool "4.16.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16
-- 
2.7.4
