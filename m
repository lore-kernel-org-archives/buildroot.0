From: =?utf-8?Q?Cl=C3=A9ment?= Leger <cleger@kalray.eu>
Date: Thu, 4 Apr 2019 09:03:04 +0200 (CEST)
Subject: [Buildroot] [PATCH 3/3] package/linux-headers: add support for
 Linux 5.1 kernel headers
In-Reply-To: <2016794590.159827.1554361302233.JavaMail.zimbra@kalray.eu>
References: <1905283465.159802.1554361271608.JavaMail.zimbra@kalray.eu>
 <2016794590.159827.1554361302233.JavaMail.zimbra@kalray.eu>
Message-ID: <436454902.159974.1554361384065.JavaMail.zimbra@kalray.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Clement Leger <clement.leger@kalray.eu>
---
 .../toolchain-external/toolchain-external-custom/Config.in.options    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 607490260f..cb7095632f 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -123,6 +123,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1
+	bool "5.1.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_0
 	bool "5.0.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
-- 
2.15.0.276.g89ea799
