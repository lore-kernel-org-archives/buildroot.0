From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 01 Dec 2017 21:00:42 -0000
Subject: [Buildroot] [git commit] toolchain: add 4.14.x choice for headers
Message-ID: <20171201205315.E2BEB7FF55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf91e4bd77280fa1b24c15b51a79ef6a8917baf2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-common.in                                        | 5 +++++
 .../toolchain-external/toolchain-external-custom/Config.in.options   | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index d87d4d7..1555377 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -253,10 +253,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "4.14" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
 	default "4.13" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13
 	default "4.12" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
 	default "4.11" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index a285340..b9e7c20 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -93,6 +93,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14
+	bool "4.14.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_13
 	bool "4.13.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13
