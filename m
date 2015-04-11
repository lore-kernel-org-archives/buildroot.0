From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 11 Apr 2015 09:17:31 -0300
Subject: [Buildroot] [PATCH 03/14] toolchain-common: default to Y for IPv6
In-Reply-To: <1428754662-27829-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428754662-27829-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1428754662-27829-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This will allow us to remove IPv6 handling in the tree without breaking
things while doing so.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/toolchain-common.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 13c684d..dfb7394 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -7,6 +7,7 @@ source "package/gdb/Config.in.host"
 
 config BR2_INET_IPV6
 	bool
+	default y
 
 config BR2_TOOLCHAIN_HAS_GCC_BUG_58595
 	bool
-- 
2.0.5
