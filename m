From: Michael Drake <michael.drake@codethink.co.uk>
Date: Thu, 10 Oct 2019 17:59:04 +0100
Subject: [Buildroot] [RFC PATCH v1 09/25] package/llvm: disable libxml2
In-Reply-To: <20191010165920.72050-1-michael.drake@codethink.co.uk>
References: <20191010165920.72050-1-michael.drake@codethink.co.uk>
Message-ID: <20191010165920.72050-10-michael.drake@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Matt Weber <matthew.weber@rockwellcollins.com>

libxml2 is needed during Windows builds to populate the COFF
file manifest info.  This isn't required for Linux builds.

Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 package/llvm/llvm.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index aa70a85490..44882d39a6 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -140,6 +140,11 @@ HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_ZLIB=ON
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
-- 
2.20.1
