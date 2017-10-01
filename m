From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Oct 2017 23:15:12 +0200
Subject: [Buildroot] [git commit] package/gdb: bump to version 8.0.1
Message-ID: <20171001211816.67BB38110F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a693573d861557008f42cb8ff6a0916fae675e10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://sourceware.org/ml/gdb-announce/2017/msg00004.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch     | 0
 .../0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch     | 0
 package/gdb/{8.0 => 8.0.1}/0003-use-asm-sgidefs.h.patch                 | 0
 .../0004-nat-linux-ptrace.c-add-missing-gdb_byte-cast.patch             | 0
 package/gdb/Config.in.host                                              | 2 +-
 package/gdb/gdb.hash                                                    | 2 +-
 6 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gdb/8.0/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/package/gdb/8.0.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
similarity index 100%
rename from package/gdb/8.0/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
rename to package/gdb/8.0.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
diff --git a/package/gdb/8.0/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch b/package/gdb/8.0.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
similarity index 100%
rename from package/gdb/8.0/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
rename to package/gdb/8.0.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
diff --git a/package/gdb/8.0/0003-use-asm-sgidefs.h.patch b/package/gdb/8.0.1/0003-use-asm-sgidefs.h.patch
similarity index 100%
rename from package/gdb/8.0/0003-use-asm-sgidefs.h.patch
rename to package/gdb/8.0.1/0003-use-asm-sgidefs.h.patch
diff --git a/package/gdb/8.0/0004-nat-linux-ptrace.c-add-missing-gdb_byte-cast.patch b/package/gdb/8.0.1/0004-nat-linux-ptrace.c-add-missing-gdb_byte-cast.patch
similarity index 100%
rename from package/gdb/8.0/0004-nat-linux-ptrace.c-add-missing-gdb_byte-cast.patch
rename to package/gdb/8.0.1/0004-nat-linux-ptrace.c-add-missing-gdb_byte-cast.patch
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 93dfa67..3e59187 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -68,5 +68,5 @@ config BR2_GDB_VERSION
 	default "7.10.1"   if BR2_GDB_VERSION_7_10
 	default "7.11.1"   if BR2_GDB_VERSION_7_11 || !BR2_PACKAGE_HOST_GDB
 	default "7.12.1"   if BR2_GDB_VERSION_7_12
-	default "8.0"      if BR2_GDB_VERSION_8_0
+	default "8.0.1"    if BR2_GDB_VERSION_8_0
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index a4fd8bc..d82aa1c 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -2,7 +2,7 @@
 sha512	17a5138277a31685a5c2a841cb47ed9bc4626ea617b8ca77750513b300299f4fbbffe504958b5372de610dcb952c679cf8fa9c1bdadd380294fbf59b6e366010	gdb-7.10.1.tar.xz
 sha512  f80ec6c8a0f0b54c8b945666e875809174402b7e121efb378ebac931a91f9a1cc0048568f8e2f42ae8ae2392ff8d144c2e51d41c7398935017450aaf29838360	gdb-7.11.1.tar.xz
 sha512  0ac8d0a495103611ef41167a08313a010dce6ca4c6d827cbe8558a0c1a1a8a6bfa53f1b7704251289cababbfaaf9e075550cdf741a54d6cd9ca3433d910efcd8	gdb-7.12.1.tar.xz
-sha512  e4044bdd162cbf95044ec1eaa44d2fa62a33e051bdbbacbc97afd4dfb07bae1bea514381fc1966aede89d6796ef2377a15748a93d95e2ad494c8497db489e886	gdb-8.0.tar.xz
+sha512  5eb328910033f0918058be2f92caebf1e8dfc6caa3c730d99d621627e53de3c1b43761c2f683d53555893253c2f06768cbf56cdea051a3d291ffb6cfae87b5e1	gdb-8.0.1.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  8ec849a5ea1c16f104c51c4813c35ab229e460eef0025967673b87316f62b5171f05448cda018464914d43d2da50b2902eb7f9f060d0af1368a9db111f959668	gdb-arc-2017.03-gdb.tar.gz
