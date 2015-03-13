From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 13 Mar 2015 15:22:02 -0300
Subject: [Buildroot] [PATCH 03/15] toolchain-common: default to Y for
	LARGEFILE
In-Reply-To: <1426270934-15499-1-git-send-email-gustavo@zacarias.com.ar>
References: <1426270934-15499-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1426270934-15499-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This will allow us to remove largefile handling in the tree without
breaking things while doing so.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/toolchain-common.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 304afe4..7eb22ce 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -7,6 +7,7 @@ source "package/gdb/Config.in.host"
 
 config BR2_LARGEFILE
 	bool
+	default y
 
 config BR2_INET_IPV6
 	bool
-- 
2.0.5
