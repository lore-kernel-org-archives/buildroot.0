From: Guo Ren <ren_guo@c-sky.com>
Date: Thu,  2 Mar 2017 19:14:12 +0800
Subject: [Buildroot] [PATCH 2/3] toolchain: only external toolchain option
	displayed
In-Reply-To: <1488453253-32089-1-git-send-email-ren_guo@c-sky.com>
References: <1488453253-32089-1-git-send-email-ren_guo@c-sky.com>
Message-ID: <1488453253-32089-2-git-send-email-ren_guo@c-sky.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently csky architecture isn't support the "internal toolchain
backend", so we disable it in config.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
---
 toolchain/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index de01585..652c9d8 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -46,6 +46,7 @@ config BR2_TOOLCHAIN_BUILDROOT
 	depends on !BR2_bf607
 	depends on !BR2_bf608
 	depends on !BR2_bf609
+	depends on !BR2_csky
 
 config BR2_TOOLCHAIN_EXTERNAL
 	bool "External toolchain"
-- 
1.9.1
