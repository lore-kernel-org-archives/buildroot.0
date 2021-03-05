From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri,  5 Mar 2021 16:41:39 +0100
Subject: [Buildroot] [PATCH] toolchain: disable gcc bug 60620 if gcc version
 >= 10.x
Message-ID: <20210305154139.3682817-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since gcc version 10.x bug 60620 doesn't show anymore, so let's make it
enabled up to versino 10.x excluded.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 toolchain/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 0cd8b82059..9d6e96d275 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -155,10 +155,11 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_85862
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=90620
 # ICE: in do_output_reload, at reload1.c:7978 on microblaze.
-# It's still not fixed in gcc 9.x
+# This bug no longer exists in gcc 10.x
 config BR2_TOOLCHAIN_HAS_GCC_BUG_90620
 	bool
 	default y if BR2_microblaze
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=93847
 # ICE: compiler error: Segmentation fault on Nios II. This bug
-- 
2.25.1
