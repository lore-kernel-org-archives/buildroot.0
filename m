From: Joel Stanley <joel@jms.id.au>
Date: Thu, 21 Mar 2019 10:58:27 +1030
Subject: [Buildroot] [PATCH v2 1/4] toolchain: Add necessary options to
 support 5.0 kernel headers
In-Reply-To: <20190321002830.21863-1-joel@jms.id.au>
References: <20190321002830.21863-1-joel@jms.id.au>
Message-ID: <20190321002830.21863-2-joel@jms.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2:
 Select correct n-1 kernel
 Make this the first patch, as it introduces _AT_LEAST_5_0

 toolchain/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index bcbc3cf98432..3f297f6b433b 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -397,10 +397,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "5.0"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
 	default "4.20" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
 	default "4.19" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	default "4.18" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18
-- 
2.20.1
