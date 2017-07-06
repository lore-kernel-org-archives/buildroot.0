From: Joel Stanley <joel@jms.id.au>
Date: Thu,  6 Jul 2017 14:26:16 +0930
Subject: [Buildroot] [PATCH 2/3] toolchain: add 4.12.x choice for headers
In-Reply-To: <20170706045617.12847-1-joel@jms.id.au>
References: <20170706045617.12847-1-joel@jms.id.au>
Message-ID: <20170706045617.12847-2-joel@jms.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 toolchain/toolchain-common.in                                        | 5 +++++
 .../toolchain-external/toolchain-external-custom/Config.in.options   | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index c570cc848eb0..932eecac9ab4 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -245,10 +245,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "4.12" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
 	default "4.11" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11
 	default "4.10" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
 	default "4.9"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index d1b76c32ac31..ae343ddad557 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -93,6 +93,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_12
+	bool "4.12.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_11
 	bool "4.11.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11
-- 
2.13.2
