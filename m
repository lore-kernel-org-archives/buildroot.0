From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Jun 2018 22:44:42 +0200
Subject: [Buildroot] [git commit] toolchain: add 4.17.x choice for headers
Message-ID: <20180604204329.44F818367A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=77fd06a1d6aa3819bc898010cf0956ad32f77400
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/Config.in                                                  | 5 +++++
 .../toolchain-external/toolchain-external-custom/Config.in.options   | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 3936fc4511..3a53a32a6d 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -336,10 +336,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "4.17" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17
 	default "4.16" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16
 	default "4.15" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
 	default "4.14" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 2ef1126740..6a9921c149 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -123,6 +123,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_17
+	bool "4.17.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_16
 	bool "4.16.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16
