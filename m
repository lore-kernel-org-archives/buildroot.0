From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Oct 2014 22:15:53 +0200
Subject: [Buildroot] [git commit] botan: fix mips64 build using n32 ABI
Message-ID: <20141023201557.6D233B0881@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=141e3354415795f521931cdbb67f2222d666a01b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove explicit -mabi parameter, and let the external toolchain wrapper set
the correct -mabi.

Fixes:
http://autobuild.buildroot.net/results/8fb/8fb8621bc5175f593de4ad0f005a5c7ffd4d9241/

Cc: Francois Perrad <fperrad@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../botan/0001-remove-mips64-explicit-mabi.patch   |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/package/botan/0001-remove-mips64-explicit-mabi.patch b/package/botan/0001-remove-mips64-explicit-mabi.patch
new file mode 100644
index 0000000..3fddd54
--- /dev/null
+++ b/package/botan/0001-remove-mips64-explicit-mabi.patch
@@ -0,0 +1,18 @@
+Remove explicit mips64 -mabi parameter
+
+This breaks when building for n32 ABI on mips64.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+
+diff -Nuar Botan-1.10.8-orig/src/build-data/cc/gcc.txt Botan-1.10.8/src/build-data/cc/gcc.txt
+--- Botan-1.10.8-orig/src/build-data/cc/gcc.txt	2014-04-10 17:11:44.000000000 +0300
++++ Botan-1.10.8/src/build-data/cc/gcc.txt	2014-10-23 09:20:34.506722323 +0300
+@@ -92,7 +92,6 @@
+ # The 'linking' bit means "use this for both compiling *and* linking"
+ <mach_abi_linking>
+ x86_64  -> "-m64"
+-mips64  -> "-mabi=64"
+ s390    -> "-m31"
+ s390x   -> "-m64"
+ sparc32 -> "-m32 -mno-app-regs"
