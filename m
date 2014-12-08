From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 8 Dec 2014 13:10:30 +0100
Subject: [Buildroot] [git commit] toolchain: add 3.18 choice for headers
Message-ID: <20141208121431.9A0757F968@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bf6f74de113d1a36317cd53121e76314c8e7c345
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-common.in          |    5 +++++
 toolchain/toolchain-external/Config.in |    4 ++++
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index ad04d64..b246834 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -217,10 +217,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "3.18" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
 	default "3.17" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
 	default "3.16" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
 	default "3.15" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 66166dd..2e9352b 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -1038,6 +1038,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_18
+	bool "3.18.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_17
 	bool "3.17.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
