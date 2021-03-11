From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 11 Mar 2021 08:29:25 -0600
Subject: [Buildroot] [PATCH v11 2/9] package/clang: bump to version 11.1.0
In-Reply-To: <20210311142932.44985-1-matthew.weber@rockwellcollins.com>
References: <20210311142932.44985-1-matthew.weber@rockwellcollins.com>
Message-ID: <20210311142932.44985-2-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/clang/clang.hash | 2 +-
 package/clang/clang.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/clang/clang.hash b/package/clang/clang.hash
index 067a2c0470..32a19c1659 100644
--- a/package/clang/clang.hash
+++ b/package/clang/clang.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256 5778512b2e065c204010f88777d44b95250671103e434f9dc7363ab2e3804253 clang-9.0.1.src.tar.xz
+sha256 0a8288f065d1f57cb6d96da4d2965cbea32edc572aa972e466e954d17148558b clang-11.1.0.src.tar.xz
 sha256 ebcd9bbf783a73d05c53ba4d586b8d5813dcdf3bbec50265860ccc885e606f47 LICENSE.TXT
diff --git a/package/clang/clang.mk b/package/clang/clang.mk
index 939f000cbd..d1667d79b6 100644
--- a/package/clang/clang.mk
+++ b/package/clang/clang.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 # LLVM, Clang and lld should be version bumped together
-CLANG_VERSION = 9.0.1
+CLANG_VERSION_MAJOR = 11
+CLANG_VERSION = $(CLANG_VERSION_MAJOR).1.0
 CLANG_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(CLANG_VERSION)
 CLANG_SOURCE = clang-$(CLANG_VERSION).src.tar.xz
 CLANG_LICENSE = Apache-2.0 with exceptions
-- 
2.17.1
