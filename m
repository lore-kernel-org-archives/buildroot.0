From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Apr 2015 22:14:42 +0200
Subject: [Buildroot] [git commit] toolchain: add 4.0.x choice for headers
Message-ID: <20150413201514.2EE8A80756@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e714ee9412ea873af68a48edbe60f48029728186
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-common.in          |    5 +++++
 toolchain/toolchain-external/Config.in |    4 ++++
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 13c684d..1b25cf1 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -222,10 +222,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19
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
index 3b7f40b..cd2115b 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -1018,6 +1018,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_0
+	bool "4.0.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_19
 	bool "3.19.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19
