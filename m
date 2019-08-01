From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 1 Aug 2019 18:43:19 +0200
Subject: [Buildroot] [git commit] package/llvm: disable libxml2
Message-ID: <20190801164056.4242588988@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2abba0dfb3e33d04a6a5cd5663c8fd42bf5ee804
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libxml2 is needed during Windows builds to populate the COFF
file manifest info.  This isn't required for Linux builds.

Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/llvm/llvm.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index ec6d53b941..1106a07877 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -133,6 +133,11 @@ HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_ZLIB=ON
 HOST_LLVM_DEPENDENCIES += host-zlib
 LLVM_CONF_OPTS += -DLLVM_ENABLE_ZLIB=OFF
 
+# libxml2 can be disabled as it is used for LLVM Windows builds where COFF
+# files include manifest info
+HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_LIBXML2=OFF
+LLVM_CONF_OPTS += -DLLVM_ENABLE_LIBXML2=OFF
+
 # We don't use llvm for static only build, so enable PIC
 HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_PIC=ON
 LLVM_CONF_OPTS += -DLLVM_ENABLE_PIC=ON
