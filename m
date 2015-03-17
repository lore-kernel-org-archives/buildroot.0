From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Mar 2015 13:41:00 -0300
Subject: [Buildroot] [PATCH] toolchain: disable internal for blackfin
Message-ID: <1426610460-11691-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The internal toolchain was a "best effort" approach - we strived to make
it build properly and all but it's mostly untested.
Since it's got issues disable it until it's properly fixed and tested
and leave the official ADI toolchain instead.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 291db94..32a00a9 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -41,6 +41,7 @@ choice
 
 config BR2_TOOLCHAIN_BUILDROOT
 	bool "Buildroot toolchain"
+	depends on !BR2_bfin
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 
 config BR2_TOOLCHAIN_EXTERNAL
-- 
2.0.5
