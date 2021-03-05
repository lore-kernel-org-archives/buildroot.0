From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri,  5 Mar 2021 17:12:09 +0100
Subject: [Buildroot] [PATCH v2 1/3] toolchain: introduce
 BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
In-Reply-To: <20210305161211.4396-1-giulio.benetti@benettiengineering.com>
References: <20210305161211.4396-1-giulio.benetti@benettiengineering.com>
Message-ID: <20210305161211.4396-2-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On OpenRisc binutils it still present ld bug 21464 leading to a package
protobuf to fail building:
http://autobuild.buildroot.net/results/908/9084cd777aefe0fa8235514c33767d8640ad7a5b/

The bug was already reported and it's been updated:
https://sourceware.org/bugzilla/show_bug.cgi?id=21464

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 toolchain/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 553612c4aa..d181644f98 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -81,6 +81,12 @@ config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19615
 config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_20006
 	bool
 
+# https://sourceware.org/bugzilla/show_bug.cgi?id=21464
+# Affect toolchains built with binutils 2.31.1, still not fixed.
+config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
+	bool
+	default y if BR2_or1k
+
 # Atomic types can be:
 #  - never lock-free
 #  - sometimes lock-free
-- 
2.25.1
