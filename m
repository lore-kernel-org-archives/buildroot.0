From: Joel Stanley <joel@jms.id.au>
Date: Tue, 19 Mar 2019 10:36:37 +1030
Subject: [Buildroot] [PATCH 2/3] toolchain: Add necessary options to support
 5.0 kernel headers
In-Reply-To: <20190319000638.6259-1-joel@jms.id.au>
References: <20190319000638.6259-1-joel@jms.id.au>
Message-ID: <20190319000638.6259-3-joel@jms.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 toolchain/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index bcbc3cf98432..f0bde8fbc870 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -397,10 +397,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
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
