From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Mar 2015 13:48:28 -0300
Subject: [Buildroot] [PATCH v2 04/15] toolchain-common: default to Y for
	LARGEFILE
In-Reply-To: <1426610919-11901-1-git-send-email-gustavo@zacarias.com.ar>
References: <1426610919-11901-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1426610919-11901-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This will allow us to remove largefile handling in the tree without
breaking things while doing so.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
