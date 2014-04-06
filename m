From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  6 Apr 2014 18:27:49 +0200
Subject: [Buildroot] [PATCH] external toolchain: add 3.14 choice for kernel
	headers
Message-ID: <1396801669-12089-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 toolchain/toolchain-external/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 3990336..9499629 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -965,6 +965,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_14
+	bool "3.14.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_13
 	bool "3.13.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
-- 
1.9.1
