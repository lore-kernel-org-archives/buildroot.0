From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Aug 2018 21:35:54 +0200
Subject: [Buildroot] [PATCH 1/3] toolchain: add 4.18.x choice for headers
Message-ID: <20180819193556.28865-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 toolchain/Config.in                                          | 5 +++++
 .../toolchain-external-custom/Config.in.options              | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index ad02af5215..c2192a52b1 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -357,10 +357,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "4.18" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18
 	default "4.17" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17
 	default "4.16" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16
 	default "4.15" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 6a9921c149..4639232bfb 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -123,6 +123,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_18
+	bool "4.18.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_17
 	bool "4.17.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17
-- 
2.18.0
