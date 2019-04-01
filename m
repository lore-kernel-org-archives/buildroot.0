From: Shyam Saini <shyam.saini@amarulasolutions.com>
Date: Mon,  1 Apr 2019 18:00:49 +0530
Subject: [Buildroot] [PATCH 1/3] toolchain: add necessary options to support
 5.0 kernel headers
Message-ID: <20190401123051.19455-1-shyam.saini@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>
---
 toolchain/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index bcbc3cf984..ebd908f254 100644
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
+	default "5.0" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
 	default "4.20" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
 	default "4.19" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	default "4.18" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18
-- 
2.11.0
