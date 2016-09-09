From: Fabio Estevam <festevam@gmail.com>
Date: Fri,  9 Sep 2016 14:18:15 -0300
Subject: [Buildroot] [PATCH 2/4] toolchain: add 4.8.x choice for headers
In-Reply-To: <1473441497-29986-1-git-send-email-festevam@gmail.com>
References: <1473441497-29986-1-git-send-email-festevam@gmail.com>
Message-ID: <1473441497-29986-2-git-send-email-festevam@gmail.com>
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
index 03fa880..cef5a83 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -222,10 +222,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "4.8"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
 	default "4.7"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
 	default "4.6"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
 	default "4.5"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 63b7712..c3822ed 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -794,6 +794,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_8
+	bool "4.8.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_7
 	bool "4.7.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
-- 
2.7.4
