From: Shyam Saini <shyam.saini@amarulasolutions.com>
Date: Mon,  1 Apr 2019 18:00:51 +0530
Subject: [Buildroot] [PATCH 3/3] toolchain: toolchain-external : support
 Linux 5.0 kernel headers
In-Reply-To: <20190401123051.19455-1-shyam.saini@amarulasolutions.com>
References: <20190401123051.19455-1-shyam.saini@amarulasolutions.com>
Message-ID: <20190401123051.19455-3-shyam.saini@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>
---
 .../toolchain-external/toolchain-external-custom/Config.in.options    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 08a79ee4d9..4f355bb454 100644
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
2.11.0
