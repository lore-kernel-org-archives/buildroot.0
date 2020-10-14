From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Oct 2020 23:56:17 +0200
Subject: [Buildroot] [git commit] support/scripts/gen-bootlin-toolchains:
 add missing MMU dependencies
Message-ID: <20201014215743.E638E8141E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4ba1ce24b9f505a321c7bd584478cbe229f5acf3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/gen-bootlin-toolchains | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index bfc7237d48..62cdb48478 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -244,12 +244,16 @@ class Toolchain:
             if frag.startswith("BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC"):
                 selects.append("BR2_TOOLCHAIN_EXTERNAL_UCLIBC")
             elif frag.startswith("BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC"):
+                # glibc needs mmu support
+                depends.append("BR2_USE_MMU")
                 # glibc doesn't support static only configuration
                 depends.append("!BR2_STATIC_LIBS")
                 selects.append("BR2_TOOLCHAIN_EXTERNAL_GLIBC")
                 # all glibc toolchains have RPC support
                 selects.append("BR2_TOOLCHAIN_HAS_NATIVE_RPC")
             elif frag.startswith("BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL"):
+                # musl needs mmu support
+                depends.append("BR2_USE_MMU")
                 selects.append("BR2_TOOLCHAIN_EXTERNAL_MUSL")
 
             # gcc version
