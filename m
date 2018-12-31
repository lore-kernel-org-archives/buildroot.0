From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 17:06:59 +0100
Subject: [Buildroot] [PATCH 1/3] toolchain: add necessary options to support
 4.20 kernel headers
In-Reply-To: <20181231160701.12086-1-thomas.petazzoni@bootlin.com>
References: <20181231160701.12086-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181231160701.12086-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index bf8ed5bf5b..baf192c936 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -370,10 +370,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "4.20" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
 	default "4.19" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	default "4.18" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18
 	default "4.17" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17
-- 
2.20.1
