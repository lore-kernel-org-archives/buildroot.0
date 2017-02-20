From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Feb 2017 21:55:55 +0100
Subject: [Buildroot] [git commit branch/next] toolchain: add 4.10.x choice
	for headers
Message-ID: <20170220205659.69AA380E58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=369b66fc366e3841ffb4dd2d35696f27799ae374
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-common.in                                        | 5 +++++
 .../toolchain-external/toolchain-external-custom/Config.in.options   | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 96d5709..379006d 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -243,10 +243,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "4.10" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
 	default "4.9"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	default "4.8"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
 	default "4.7"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index ed2b082..668ea3d 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -89,6 +89,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_10
+	bool "4.10.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9
 	bool "4.9.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
