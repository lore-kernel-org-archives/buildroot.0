From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 14:48:55 +0200
Subject: [Buildroot] [git commit] toolchain: add 3.15 choice for headers
Message-ID: <20140609125032.B028A9CF77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fb29afe2aa6a38df42929fd58fbc2808e27bff76
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: fix BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15 to select
BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14 and not itself.]

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-common.in          |    5 +++++
 toolchain/toolchain-external/Config.in |    4 ++++
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 1573e00..a91d247 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -180,10 +180,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "3.15" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
 	default "3.14" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
 	default "3.13" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
 	default "3.12" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index f4a5ccf..aa21f22 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -1018,6 +1018,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_15
+	bool "3.15.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_14
 	bool "3.14.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
