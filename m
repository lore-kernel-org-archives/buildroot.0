From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Mar 2015 22:27:17 -0000
Subject: [Buildroot] [git commit] toolchain: add 3.19 choice for headers
Message-ID: <20150302222715.BE3108057D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=81366edd7c20f395a4269a243eca9cbbd995a48b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-common.in          |    5 +++++
 toolchain/toolchain-external/Config.in |    4 ++++
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 2ee2019..304afe4 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -221,10 +221,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "3.19" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19
 	default "3.18" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
 	default "3.17" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
 	default "3.16" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 50daa66..6ab483a 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -1038,6 +1038,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_19
+	bool "3.19.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_18
 	bool "3.18.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
