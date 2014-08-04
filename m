From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Aug 2014 09:46:41 +0200
Subject: [Buildroot] [git commit] toolchain: add 3.16 choice for headers
Message-ID: <20140804074718.6E7519D3A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=911516f1b6dec4b2985a1f454949f8d9d10f6ef5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-common.in          |    5 +++++
 toolchain/toolchain-external/Config.in |    4 ++++
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 48ba840..6d43700 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -213,10 +213,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "3.16" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
 	default "3.15" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
 	default "3.14" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
 	default "3.13" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index b524ac7..e210011 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -960,6 +960,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_16
+	bool "3.16.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_15
 	bool "3.15.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
