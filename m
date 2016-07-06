From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Jul 2016 09:07:43 +0200
Subject: [Buildroot] [git commit] uclibc: add ldd compile fix from upstream
Message-ID: <20160706070749.0472680789@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f25345558418eef068539e396402db1093ebc6c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes a build error, when uclibc utils is selected targeting Blackfin.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/0001-bfin-allow-to-build-ldd.patch | 29 +++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/uclibc/0001-bfin-allow-to-build-ldd.patch b/package/uclibc/0001-bfin-allow-to-build-ldd.patch
new file mode 100644
index 0000000..4ec2b71
--- /dev/null
+++ b/package/uclibc/0001-bfin-allow-to-build-ldd.patch
@@ -0,0 +1,29 @@
+From 10f469f6ce1a0c14e4506c42e47e15aa83be2eef Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@uclibc-ng.org>
+Date: Wed, 6 Jul 2016 06:08:51 +0200
+Subject: [PATCH] bfin: allow to build ldd
+
+Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
+---
+ utils/ldd.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/utils/ldd.c b/utils/ldd.c
+index f6413c6..5d2c8f4 100644
+--- a/utils/ldd.c
++++ b/utils/ldd.c
+@@ -35,6 +35,11 @@
+ #define ELFCLASSM      ELFCLASS32
+ #endif
+
++#if defined(__bfin__)
++#define MATCH_MACHINE(x) (x == EM_BLACKFIN)
++#define ELFCLASSM      ELFCLASS32
++#endif
++
+ #if defined(__s390__)
+ #define MATCH_MACHINE(x) (x == EM_S390)
+ #define ELFCLASSM	ELFCLASS32
+--
+2.1.4
+
