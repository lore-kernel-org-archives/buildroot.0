From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 18 Nov 2018 20:37:47 -0600
Subject: [Buildroot] [PATCH v3 6/6] llvm/clang: add note about version
 bumping together
In-Reply-To: <1542595067-45972-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1542595067-45972-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1542595067-45972-6-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Acked-by: Romain Naour <romain.naour@smile.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Changes
v1 -> v2
 - None

v2 -> v3
[Ricardo
 - Added compiler-rt to list of items to bump. I originaly had kept this
   patch independent of the compiler-rt series but since compiler-rt is
   first in the series, this one may as well include it in the statements
---
 package/clang/clang.mk | 1 +
 package/llvm/llvm.mk   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/clang/clang.mk b/package/clang/clang.mk
index f9d4ae3..461d5f9 100644
--- a/package/clang/clang.mk
+++ b/package/clang/clang.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# LLVM, Clang and Compiler-RT should be version bumped together
 CLANG_VERSION = 7.0.0
 CLANG_SITE = http://llvm.org/releases/$(CLANG_VERSION)
 CLANG_SOURCE = cfe-$(CLANG_VERSION).src.tar.xz
diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index 79477f0..14f317d 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# LLVM, Clang and Compiler-RT should be version bumped together
 LLVM_VERSION = 7.0.0
 LLVM_SITE = http://llvm.org/releases/$(LLVM_VERSION)
 LLVM_SOURCE = llvm-$(LLVM_VERSION).src.tar.xz
-- 
1.9.1
