From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 6 Oct 2014 16:24:32 +0200
Subject: [Buildroot] [git commit] toolchain: add 3.17 choice for headers
Message-ID: <20141006143025.A9D09B0BD7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2d312b7b61c98716535513a2743a85d4d7e8a084
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-common.in          |    5 +++++
 toolchain/toolchain-external/Config.in |    4 ++++
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 82ac26a..2dfaecc 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -213,10 +213,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "3.17" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
 	default "3.16" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
 	default "3.15" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
 	default "3.14" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 67ad450..8c94871 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -992,6 +992,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_17
+	bool "3.17.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3.17
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_16
 	bool "3.16.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
