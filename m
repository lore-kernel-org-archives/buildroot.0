From: Romain Naour <romain.naour@smile.fr>
Date: Sat,  7 Sep 2019 11:40:18 +0200
Subject: [Buildroot] [PATCH v2 03/12] package/clang: add the version major
 variable
In-Reply-To: <20190907094027.9537-1-romain.naour@smile.fr>
References: <20190907094027.9537-1-romain.naour@smile.fr>
Message-ID: <20190907094027.9537-4-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CLANG_VERSION_MAJOR will be used in a followup patch
to install the toolchain-wrapper for clang cross-compiler
and it's symlinks.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
---
 package/clang/clang.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/clang/clang.mk b/package/clang/clang.mk
index ed6f9bf90e..857ec148ac 100644
--- a/package/clang/clang.mk
+++ b/package/clang/clang.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 # LLVM and Clang should be version bumped together
-CLANG_VERSION = 8.0.1
+CLANG_VERSION_MAJOR = 8
+CLANG_VERSION = $(CLANG_VERSION_MAJOR).0.1
 CLANG_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(CLANG_VERSION)
 CLANG_SOURCE = cfe-$(CLANG_VERSION).src.tar.xz
 CLANG_LICENSE = NCSA
-- 
2.21.0
