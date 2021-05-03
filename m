From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon,  3 May 2021 13:13:47 +0200
Subject: [Buildroot] [PATCH 6/9] toolchain: remove binutils bug 21464
In-Reply-To: <20210503111350.2933319-1-giulio.benetti@benettiengineering.com>
References: <20210503111350.2933319-1-giulio.benetti@benettiengineering.com>
Message-ID: <20210503111350.2933319-7-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This bug has been fixed upstream and backported to buildroot binutils
package. So let's remove it.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 toolchain/Config.in | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 78444f6130..06c338ee7d 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -71,12 +71,6 @@ source "package/gdb/Config.in.host"
 
 comment "Toolchain Generic Options"
 
-# https://sourceware.org/bugzilla/show_bug.cgi?id=21464
-# Affect toolchains built with binutils 2.31.1, still not fixed.
-config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
-	bool
-	default y if BR2_or1k
-
 # https://sourceware.org/bugzilla/show_bug.cgi?id=27100
 # Affect toolchains built with binutils 2.33.1 (fixed in binutils 2.36)
 config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27100
-- 
2.25.1
