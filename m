From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Mar 2015 10:40:19 -0300
Subject: [Buildroot] [PATCH] toolchain: default to external for blackfin
Message-ID: <1426599619-26827-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The internal toolchain is a "best effort" approach - we strive to make
it build properly and all but it's mostly untested.
So default to the external (ADI) toolchains.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 291db94..deb4c85 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -32,6 +32,7 @@ config BR2_TOOLCHAIN_USES_MUSL
 
 choice
 	prompt "Toolchain type"
+	default BR2_TOOLCHAIN_EXTERNAL if BR2_bfin
 	help
 	  Select whether to use the toolchain provided by buildroot
 	  or an external toolchain.
-- 
2.0.5
