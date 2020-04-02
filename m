From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 2 Apr 2020 21:45:53 +0200
Subject: [Buildroot] [git commit] package/gdb: bump to version 8.3.1
Message-ID: <20200402195000.6B2F57FCB3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d1737fc1b601a03bd959ff8c6068acc520d59c49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch |  0
 ...-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch |  0
 package/gdb/{8.3 => 8.3.1}/0003-use-asm-sgidefs.h.patch        |  0
 .../gdb/{8.3 => 8.3.1}/0004-gdbserver-fix-build-for-m68k.patch |  0
 .../0005-nat-fork-inferior-include-linux-ptrace.h.patch        |  0
 package/gdb/Config.in.host                                     |  2 +-
 package/gdb/gdb.hash                                           | 10 +++++-----
 7 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/gdb/8.3/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/package/gdb/8.3.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
similarity index 100%
rename from package/gdb/8.3/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
rename to package/gdb/8.3.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
diff --git a/package/gdb/8.3/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch b/package/gdb/8.3.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
similarity index 100%
rename from package/gdb/8.3/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
rename to package/gdb/8.3.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
diff --git a/package/gdb/8.3/0003-use-asm-sgidefs.h.patch b/package/gdb/8.3.1/0003-use-asm-sgidefs.h.patch
similarity index 100%
rename from package/gdb/8.3/0003-use-asm-sgidefs.h.patch
rename to package/gdb/8.3.1/0003-use-asm-sgidefs.h.patch
diff --git a/package/gdb/8.3/0004-gdbserver-fix-build-for-m68k.patch b/package/gdb/8.3.1/0004-gdbserver-fix-build-for-m68k.patch
similarity index 100%
rename from package/gdb/8.3/0004-gdbserver-fix-build-for-m68k.patch
rename to package/gdb/8.3.1/0004-gdbserver-fix-build-for-m68k.patch
diff --git a/package/gdb/8.3/0005-nat-fork-inferior-include-linux-ptrace.h.patch b/package/gdb/8.3.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch
similarity index 100%
rename from package/gdb/8.3/0005-nat-fork-inferior-include-linux-ptrace.h.patch
rename to package/gdb/8.3.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 5315f10493..2db73b10d6 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -71,5 +71,5 @@ config BR2_GDB_VERSION
 	default "4ecb98fbc2f94dbe01b69384afbc515107de73df" if BR2_csky
 	default "8.1.1"    if BR2_GDB_VERSION_8_1
 	default "8.2.1"    if BR2_GDB_VERSION_8_2 || !BR2_PACKAGE_HOST_GDB
-	default "8.3"	   if BR2_GDB_VERSION_8_3
+	default "8.3.1"    if BR2_GDB_VERSION_8_3
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index b98d6d6a67..60b0954ff9 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -1,10 +1,10 @@
 # From ftp://gcc.gnu.org/pub/gdb/releases/sha512.sum
-sha512  7dcd5e8c90de92f577834d887b5f54edb93a07083bfe661bc46c270a6cc4919f0b348e7e2fe8ae4511298a570ef150eeefdc667ef7cf527f0cf60943177ab6c9	gdb-8.1.1.tar.xz
-sha512  2aa81cfd389bb48c35d7d9f95cc10e88b4f7ad4597bdde0f8f1fd312f60f10d9fb2cc6e5a9355227d89ff328f7feb0fc411a69394560cafeb9fa75d35d896d11	gdb-8.2.1.tar.xz
-sha512  47ac074d20a09a3fac8f4a41dce0a0cbe6ef702f7dc21ba8b7d650d306128dcae481e9a16bf65e596b3a541dc82ae57c02bcbb786d551b4ef3e2917b9b6f0ae1	gdb-8.3.tar.xz
+sha512  7dcd5e8c90de92f577834d887b5f54edb93a07083bfe661bc46c270a6cc4919f0b348e7e2fe8ae4511298a570ef150eeefdc667ef7cf527f0cf60943177ab6c9  gdb-8.1.1.tar.xz
+sha512  2aa81cfd389bb48c35d7d9f95cc10e88b4f7ad4597bdde0f8f1fd312f60f10d9fb2cc6e5a9355227d89ff328f7feb0fc411a69394560cafeb9fa75d35d896d11  gdb-8.2.1.tar.xz
+sha512  9053a2dc6b9eb921907afbc4cecc75d635aa76df5e8c4f0e5824ccf57cb206b299c19b127fff000b65c334826ff8304a54ff6098428365a8e997cca886c39e9a  gdb-8.3.1.tar.xz
 
 # Locally calculated (fetched from Github)
-sha512  c33818f8679d99d5315220578864b04b87f69c46ebe62472809ee6e1d260e5ec84d598f38d80c127a2045d6624f28803c2720d89434204acbd94e988a45870f1 	gdb-arc-2019.09-release-gdb.tar.gz
+sha512  c33818f8679d99d5315220578864b04b87f69c46ebe62472809ee6e1d260e5ec84d598f38d80c127a2045d6624f28803c2720d89434204acbd94e988a45870f1  gdb-arc-2019.09-release-gdb.tar.gz
 
 # Locally calculated (fetched from https://github.com/c-sky/binutils-gdb)
-sha512  c421e1f3c0d6cfb3c04544573c0c4b0075c8d8e3d563c6c234fcc1e4c2167ab203d1e57aec3b58abd348dc46f8cf9b47b753d3a43dba3ea970c9c9a6bd78c07b	gdb-4ecb98fbc2f94dbe01b69384afbc515107de73df.tar.gz
+sha512  c421e1f3c0d6cfb3c04544573c0c4b0075c8d8e3d563c6c234fcc1e4c2167ab203d1e57aec3b58abd348dc46f8cf9b47b753d3a43dba3ea970c9c9a6bd78c07b  gdb-4ecb98fbc2f94dbe01b69384afbc515107de73df.tar.gz
