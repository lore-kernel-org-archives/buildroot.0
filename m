From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 10 May 2017 11:55:46 +0100
Subject: [Buildroot] [PATCH master] mpir: fix build on MIPS R6 CPUs
Message-ID: <20170510105546.51108-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit ef9eebf65f554d9aacfd420600c8ba17787151a8 tried to fix this
problem in a wrong way. It was fixed only for generic R6 CPUs, so the
problem still persist if you choose any other R6 CPU, like I6400 for
instance.

Fix it properly by using the right kconfig options.

Fixes:
  http://autobuild.buildroot.net/results/f33/f33cb1e0b49fe8aee68fb4b66ea4c304b71a6f8f/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/mpir/mpir.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mpir/mpir.mk b/package/mpir/mpir.mk
index 697e838..91f704d 100644
--- a/package/mpir/mpir.mk
+++ b/package/mpir/mpir.mk
@@ -27,7 +27,7 @@ MPIR_CONF_ENV += MPN_PATH="generic"
 endif
 
 # Optimized mips32/mips64 code not suitable for mips32r6/mips64r6
-ifeq ($(BR2_mips_32r6)$(BR2_mips_64r6),y)
+ifeq ($(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6),y)
 MPIR_CONF_ENV += MPN_PATH="generic"
 endif
 
-- 
2.10.2
