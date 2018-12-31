From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 18:52:34 +0100
Subject: [Buildroot] [PATCH v2 4/4] toolchain/toolchain-external-custom:
 support Linux 4.20 kernel headers
In-Reply-To: <20181231175234.14572-1-thomas.petazzoni@bootlin.com>
References: <20181231175234.14572-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181231175234.14572-5-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../toolchain-external-custom/Config.in.options               | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 288fc3f3e0..08a79ee4d9 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -123,6 +123,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_20
+	bool "4.20.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_19
 	bool "4.19.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
-- 
2.20.1
