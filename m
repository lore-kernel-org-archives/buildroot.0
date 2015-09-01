From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Sep 2015 10:05:20 +0200
Subject: [Buildroot] [git commit] toolchain: add 4.2.x choice for headers
Message-ID: <20150901083109.527DA7FA68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8dc68293374ff9b5e20dd5ad68820af62d7358fe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-common.in          |    5 +++++
 toolchain/toolchain-external/Config.in |    4 ++++
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 4be55c3..4e880a2 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -227,10 +227,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_1
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_1
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "4.2"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2
 	default "4.1"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_1
 	default "4.0"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
 	default "3.19" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 0b45e12..e7aed2e 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -1051,6 +1051,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_2
+	bool "4.2.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1
 	bool "4.1.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_1
