From: Samuel Martin <s.martin49@gmail.com>
Date: Mon,  1 May 2017 12:24:37 +0200
Subject: [Buildroot] [PATCH v3 2/3] toolchain: add 4.11.x choice for headers
In-Reply-To: <20170501102438.9403-1-s.martin49@gmail.com>
References: <20170501102438.9403-1-s.martin49@gmail.com>
Message-ID: <20170501102438.9403-2-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v2 -> v3
- new patch
---
 toolchain/toolchain-common.in                                        | 5 +++++
 .../toolchain-external/toolchain-external-custom/Config.in.options   | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 379006d02..37079fad3 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -247,10 +247,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "4.11" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11
 	default "4.10" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
 	default "4.9"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	default "4.8"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 668ea3d9d..ba5b97702 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -89,6 +89,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_11
+	bool "4.11.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_10
 	bool "4.10.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
-- 
2.12.2
