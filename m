From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  6 Jan 2020 22:47:41 +0100
Subject: [Buildroot] [PATCH 1/2] package/llvm: bump to version 9.0.1
Message-ID: <20200106214742.126120-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Go back to the github url download again.

See:
http://lists.llvm.org/pipermail/llvm-announce/2019-December/000086.html

Cc: Joseph Kogut <joseph.kogut@gmail.com>
Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/llvm/llvm.hash | 2 +-
 package/llvm/llvm.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/llvm/llvm.hash b/package/llvm/llvm.hash
index a10b66ded2..6bf2755777 100644
--- a/package/llvm/llvm.hash
+++ b/package/llvm/llvm.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256 d6a0565cf21f22e9b4353b2eb92622e8365000a9e90a16b09b56f8157eabfe84 llvm-9.0.0.src.tar.xz
+sha256 00a1ee1f389f81e9979f3a640a01c431b3021de0d42278f6508391a2f0b81c9a llvm-9.0.1.src.tar.xz
 sha256 8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee LICENSE.TXT
diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index 2b2bcf336e..28ad6a5704 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # LLVM, Clang and lld should be version bumped together
-LLVM_VERSION = 9.0.0
-LLVM_SITE = http://llvm.org/releases/$(LLVM_VERSION)
+LLVM_VERSION = 9.0.1
+LLVM_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_VERSION)
 LLVM_SOURCE = llvm-$(LLVM_VERSION).src.tar.xz
 LLVM_LICENSE = Apache-2.0 with exceptions
 LLVM_LICENSE_FILES = LICENSE.TXT
-- 
2.24.1
