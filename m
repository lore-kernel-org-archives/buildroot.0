From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 30 Mar 2020 20:22:49 +0200
Subject: [Buildroot] [PATCH 2/3] linux: fix option string for kernel 5.5.x
In-Reply-To: <20200330182250.1515995-1-bernd.kuhls@t-online.de>
References: <20200330182250.1515995-1-bernd.kuhls@t-online.de>
Message-ID: <20200330182250.1515995-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/linux-headers/Config.in.host                            | 2 +-
 .../toolchain-external-custom/Config.in.options                 | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 5c5a9b0330..b89605bbf7 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -132,7 +132,7 @@ choice
 	  in the choice, then select the latest version.
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_5
-	bool "5.5.x or later"
+	bool "5.5.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 31fe651081..91d55602e0 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -116,7 +116,7 @@ choice
 	  in the choice, then select the latest version.
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_5
-	bool "5.5.x or later"
+	bool "5.5.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_4
-- 
2.25.0
