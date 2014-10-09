From: Karoly Kasza <kaszak@gmail.com>
Date: Thu,  9 Oct 2014 12:59:01 +0200
Subject: [Buildroot] [PATCH 1/1] toolchain: external 3.17 headers typo fix
Message-ID: <1412852341-38481-1-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 2d312b7b61c98716535513a2743a85d4d7e8a084 had a typo
"." instead of "_" in BR2_TOOLCHAIN_HEADERS_AT_LEAST_3.17.
This made selecting 3.17 as custom external headers version
impossible.

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---
 toolchain/toolchain-external/Config.in |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 8c94871..c74388f 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -994,7 +994,7 @@ choice
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_17
 	bool "3.17.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3.17
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_16
 	bool "3.16.x"
-- 
1.7.10.4
