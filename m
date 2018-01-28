From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Jan 2018 23:48:21 +0100
Subject: [Buildroot] [git commit] toolchain: add 4.15.x choice for headers
Message-ID: <20180128225534.BAC65865D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ea0f6e8f06be4e405b1610b0e2dbde70c1d5d80a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-common.in                                        | 5 +++++
 .../toolchain-external/toolchain-external-custom/Config.in.options   | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 0000713331..8941e0f3cd 100644
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
index e35ef8784d..70c7d8e3c3 100644
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
