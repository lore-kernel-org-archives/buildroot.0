From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 10 Mar 2021 10:14:50 +0100
Subject: [Buildroot] [PATCH v2 3/6] toolchain: introduce
 BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27100
In-Reply-To: <20210310091453.23611-1-giulio.benetti@benettiengineering.com>
References: <20210310091453.23611-1-giulio.benetti@benettiengineering.com>
Message-ID: <20210310091453.23611-4-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On OpenRisc binutils it still present ld bug 27100 leading to a package
openal to fail building:
http://autobuild.buildroot.net/results/c05/c053b9e191b31f0b1f8f8c902b602e187f714dc0/

The bug was already reported and it's been updated:
https://sourceware.org/bugzilla/show_bug.cgi?id=27100

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 toolchain/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index f3f9bbe641..f0aff3c64e 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -87,6 +87,12 @@ config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
 	bool
 	default y if BR2_or1k
 
+# https://sourceware.org/bugzilla/show_bug.cgi?id=27100
+# Affect toolchains built with binutils 2.33.1 (fixed in binutils 2.36)
+config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27100
+	bool
+	default y if BR2_or1k && !BR2_BINUTILS_VERSION_2_36_X
+
 # Atomic types can be:
 #  - never lock-free
 #  - sometimes lock-free
-- 
2.25.1
