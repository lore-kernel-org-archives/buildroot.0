From: Joel Stanley <joel@jms.id.au>
Date: Thu, 21 Mar 2019 10:58:30 +1030
Subject: [Buildroot] [PATCH v2 4/4] toolchain/toolchain-external-custom:
 Support Linux 5.0 kernel headers
In-Reply-To: <20190321002830.21863-1-joel@jms.id.au>
References: <20190321002830.21863-1-joel@jms.id.au>
Message-ID: <20190321002830.21863-5-joel@jms.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .../toolchain-external-custom/Config.in.options               | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 08a79ee4d958..4f355bb4548d 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -123,6 +123,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_0
+	bool "5.0.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_20
 	bool "4.20.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
-- 
2.20.1
