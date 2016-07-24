From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 24 Jul 2016 20:56:09 -0300
Subject: [Buildroot] [PATCH 3/4] toolchain: add 4.7.x choice for headers
In-Reply-To: <1469404570-19495-1-git-send-email-festevam@gmail.com>
References: <1469404570-19495-1-git-send-email-festevam@gmail.com>
Message-ID: <1469404570-19495-3-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Estevam <fabio.estevam@nxp.com>

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 toolchain/toolchain-common.in          | 5 +++++
 toolchain/toolchain-external/Config.in | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 65df31b..2108edb 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -248,10 +248,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "4.7"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
 	default "4.6"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
 	default "4.5"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
 	default "4.4"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 16b877a..5edde24 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -793,6 +793,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_7
+	bool "4.7.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_6
 	bool "4.6.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
-- 
1.9.1
