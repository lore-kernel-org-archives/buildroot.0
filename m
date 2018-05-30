From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 May 2018 21:44:01 +0200
Subject: [Buildroot] [git commit branch/next] arch: add
 BR2_ARCH_NEEDS_GCC_AT_LEAST_8
Message-ID: <20180530202335.AAB848351F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c9216bc1d01983be22ce2119efb98b5684cd714a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This new symbol will be used by architectures introduced with gcc 8 and
by external toolchains based on gcc 8.

[1] https://gcc.gnu.org/gcc-8/changes.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
