From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed,  1 May 2019 14:40:29 -0500
Subject: [Buildroot] [PATCH v7 2/5] package llvm/clang: note about version
 bumping dep
In-Reply-To: <20190501194032.765-1-matthew.weber@rockwellcollins.com>
References: <20190501194032.765-1-matthew.weber@rockwellcollins.com>
Message-ID: <20190501194032.765-3-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Acked-by: Romain Naour <romain.naour@smile.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
--

This patch can be applied independent of the compiler-rt series.

Changes
v1 -> v2
 - None

v2 -> v3
[Ricardo
 - Added compiler-rt to list of items to bump. I originaly had kept this
   patch independent of the compiler-rt series but since compiler-rt is
   first in the series, this one may as well include it in the statements

v4
 - None

v5
 - Rebased post 2018.11 on master

v6
 - Rebased after LLVM/Clang bump to 7.0.1

v7
 - Updated patch so it could be applied independent of compiler-rt
---
 package/clang/clang.mk | 1 +
 package/llvm/llvm.mk   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/clang/clang.mk b/package/clang/clang.mk
index 0cab1c7f89..07e7fced2a 100644
--- a/package/clang/clang.mk
+++ b/package/clang/clang.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# LLVM and Clang should be version bumped together
 CLANG_VERSION = 8.0.0
 CLANG_SITE = http://llvm.org/releases/$(CLANG_VERSION)
 CLANG_SOURCE = cfe-$(CLANG_VERSION).src.tar.xz
diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index 7186c91cb7..a1c0167ff6 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# LLVM and Clang should be version bumped together
 LLVM_VERSION = 8.0.0
 LLVM_SITE = http://llvm.org/releases/$(LLVM_VERSION)
 LLVM_SOURCE = llvm-$(LLVM_VERSION).src.tar.xz
-- 
2.17.1
