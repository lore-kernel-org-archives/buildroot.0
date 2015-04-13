From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 13 Apr 2015 10:00:23 -0300
Subject: [Buildroot] [PATCH 1/3] toolchain: add 4.0.x choice for headers
Message-ID: <1428930025-25061-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/toolchain-common.in          | 5 +++++
 toolchain/toolchain-external/Config.in | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 478315b..d50c908 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -219,10 +219,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "4.0"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
 	default "3.19" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19
 	default "3.18" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
 	default "3.17" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 97619d4..d2b99cc 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -977,6 +977,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_0
+	bool "4.0.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_19
 	bool "3.19.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19
-- 
2.0.5
