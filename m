From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 29 May 2018 23:52:53 +0200
Subject: [Buildroot] [PATCH v3 for-next 1/5] arch: add
 BR2_ARCH_NEEDS_GCC_AT_LEAST_8
Message-ID: <20180529215257.17686-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new symbol will be used by architectures introduced with gcc 8 and
by external toolchains based on gcc 8.

[1] https://gcc.gnu.org/gcc-8/changes.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index a66ea0d03b..a16012bdfd 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -282,6 +282,10 @@ config BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 	bool
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 
+config BR2_ARCH_NEEDS_GCC_AT_LEAST_8
+	bool
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
+
 # The following string values are defined by the individual
 # Config.in.$ARCH files
 config BR2_ARCH
-- 
2.14.3
