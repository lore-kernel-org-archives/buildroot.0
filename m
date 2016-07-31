From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 31 Jul 2016 23:41:26 +0200
Subject: [Buildroot] [PATCH] uclibc: disable PIE for microblaze
Message-ID: <20160731214126.GA18543@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

PIE is not supported at the moment for uClibc-ng/microblaze.
Fixes:
http://autobuild.buildroot.net/results/a5848753eb0e2b0ddf55e226c45b85fd3a1c84f3/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 toolchain/Config.in |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 5752380..464e1d9 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -19,7 +19,7 @@ config BR2_TOOLCHAIN_USES_GLIBC
 
 config BR2_TOOLCHAIN_USES_UCLIBC
 	bool
-	select BR2_TOOLCHAIN_SUPPORTS_PIE if !BR2_arc && !BR2_m68k && !BR2_STATIC_LIBS
+	select BR2_TOOLCHAIN_SUPPORTS_PIE if !BR2_arc && !BR2_m68k && !BR2_microblaze && !BR2_STATIC_LIBS
 
 config BR2_TOOLCHAIN_USES_MUSL
 	bool
-- 
1.7.10.4
