From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Apr 2018 21:15:04 +0200
Subject: [Buildroot] [git commit] toolchain: add 4.16.x choice for headers
Message-ID: <20180409191938.BF9488820B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=792ead7996b125f912028201abfc7f8c4df1c762
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/Config.in                                                  | 5 +++++
 .../toolchain-external/toolchain-external-custom/Config.in.options   | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index b33eaffd52..e2ef1e7ef3 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -323,10 +323,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "4.16" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16
 	default "4.15" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
 	default "4.14" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
 	default "4.13" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 6c12b1619c..8cc9db6841 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -108,6 +108,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_16
+	bool "4.16.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_15
 	bool "4.15.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
