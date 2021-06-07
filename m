From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 7 Jun 2021 23:35:29 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/llvm: include
 limits
Message-ID: <20210607211334.79E0D8B845@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=daf1a5d80ac687c5104684919a45b02677578204
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fix the following build failure:

In file included from /data/buildroot-autobuilder/instance-0/output-1/build/host-llvm-9.0.1/utils/benchmark/src/benchmark_register.cc:15:
/data/buildroot-autobuilder/instance-0/output-1/build/host-llvm-9.0.1/utils/benchmark/src/benchmark_register.h: In function 'void AddRange(std::vector<T>*, T, T, int)':
/data/buildroot-autobuilder/instance-0/output-1/build/host-llvm-9.0.1/utils/benchmark/src/benchmark_register.h:17:30: error: 'numeric_limits' is not a member of 'std'
   17 |   static const T kmax = std::numeric_limits<T>::max();
      |                              ^~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/68581aad7c622a1fc74bb5556799e3c681425b2a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 8d8f456d59ca5b1e70e37f899743b8d41514cb40)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/llvm/0001-nfc-Fix-missing-include.patch | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/package/llvm/0001-nfc-Fix-missing-include.patch b/package/llvm/0001-nfc-Fix-missing-include.patch
new file mode 100644
index 0000000000..62111ca138
--- /dev/null
+++ b/package/llvm/0001-nfc-Fix-missing-include.patch
@@ -0,0 +1,24 @@
+From b498303066a63a203d24f739b2d2e0e56dca70d1 Mon Sep 17 00:00:00 2001
+From: serge-sans-paille <sguelton@redhat.com>
+Date: Tue, 10 Nov 2020 14:55:25 +0100
+Subject: [PATCH] [nfc] Fix missing include
+
+[Retrieved (and backported) from:
+https://github.com/llvm/llvm-project/commit/b498303066a63a203d24f739b2d2e0e56dca70d1]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ llvm/utils/benchmark/src/benchmark_register.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/utils/benchmark/src/benchmark_register.h b/utils/benchmark/src/benchmark_register.h
+index 0705e219f2fa2..4caa5ad4da079 100644
+--- a/utils/benchmark/src/benchmark_register.h
++++ b/utils/benchmark/src/benchmark_register.h
+@@ -1,6 +1,7 @@
+ #ifndef BENCHMARK_REGISTER_H
+ #define BENCHMARK_REGISTER_H
+ 
++#include <limits>
+ #include <vector>
+ 
+ #include "check.h"
