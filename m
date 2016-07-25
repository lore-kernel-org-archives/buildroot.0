From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jul 2016 22:16:59 +0200
Subject: [Buildroot] [git commit] toolchain: add 4.7.x choice for headers
Message-ID: <20160725201804.D9DA481F05@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e36bf63f9fe1f5a2daef6ea1d1bde0a049886e42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-common.in          | 5 +++++
 toolchain/toolchain-external/Config.in | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index d69acf2..5611b5b 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -251,10 +251,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
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
