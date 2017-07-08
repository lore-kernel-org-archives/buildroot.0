From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Jul 2017 15:56:30 +0200
Subject: [Buildroot] [git commit] toolchain: add 4.12.x choice for headers
Message-ID: <20170708135437.5945481EBD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e9f6a61dd98a3108f57803931d56fcfc972a6bd5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-common.in                                        | 5 +++++
 .../toolchain-external/toolchain-external-custom/Config.in.options   | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index c570cc8..932eeca 100644
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
index d1b76c3..ae343dd 100644
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
