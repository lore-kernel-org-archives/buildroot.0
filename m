From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Dec 2019 23:44:42 +0100
Subject: [Buildroot] [git commit] package/libnss: remove patch
Message-ID: <20191223223541.96D6F8E145@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=92625702e4afd7b497f8bb77c5ed6d8023ff63d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove uClibc fix patch since its change has been upstreamed despite the
comment contained in patch.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ch => 0001-add-zlib-include-dir-variable.patch} |  0
 package/libnss/0001-fix-uclibc-build.patch         | 22 ----------------------
 ...Fix-build-failure-due-to-missing-posix-s.patch} |  0
 ...743-Fix-PowerPc-build-sys-auxv.h-failure.patch} |  0
 ...-Fix-nsinstall.c-build-failure-on-RHEL-7.patch} |  0
 5 files changed, 22 deletions(-)

diff --git a/package/libnss/0002-add-zlib-include-dir-variable.patch b/package/libnss/0001-add-zlib-include-dir-variable.patch
similarity index 100%
rename from package/libnss/0002-add-zlib-include-dir-variable.patch
rename to package/libnss/0001-add-zlib-include-dir-variable.patch
diff --git a/package/libnss/0001-fix-uclibc-build.patch b/package/libnss/0001-fix-uclibc-build.patch
deleted file mode 100644
index a9e84c264b..0000000000
--- a/package/libnss/0001-fix-uclibc-build.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Fix build with uClibc-ng
-
-The elf.h header in uClibc-ng is missing the AT_HWCAP2 definition. Add it in
-the code.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: Not upstreamable; uClibc needs to update elf.h
-
-diff -Nuar nss-3.38.orig/nss/lib/freebl/blinit.c nss-3.38/nss/lib/freebl/blinit.c
---- nss-3.38.orig/nss/lib/freebl/blinit.c	2018-06-21 12:24:45.000000000 +0300
-+++ nss-3.38/nss/lib/freebl/blinit.c	2018-06-26 13:13:55.636434720 +0300
-@@ -100,6 +100,9 @@
-     defined(__GNUC__) && __GNUC__ >= 2 && defined(__ELF__)
- #include <sys/auxv.h>
- extern unsigned long getauxval(unsigned long type) __attribute__((weak));
-+#ifndef AT_HWCAP2
-+#define AT_HWCAP2	26
-+#endif
- #else
- static unsigned long (*getauxval)(unsigned long) = NULL;
- #define AT_HWCAP2 0
diff --git a/package/libnss/0003-Bug-1602288-Fix-build-failure-due-to-missing-posix-s.patch b/package/libnss/0002-Bug-1602288-Fix-build-failure-due-to-missing-posix-s.patch
similarity index 100%
rename from package/libnss/0003-Bug-1602288-Fix-build-failure-due-to-missing-posix-s.patch
rename to package/libnss/0002-Bug-1602288-Fix-build-failure-due-to-missing-posix-s.patch
diff --git a/package/libnss/0004-Bug-1602743-Fix-PowerPc-build-sys-auxv.h-failure.patch b/package/libnss/0003-Bug-1602743-Fix-PowerPc-build-sys-auxv.h-failure.patch
similarity index 100%
rename from package/libnss/0004-Bug-1602743-Fix-PowerPc-build-sys-auxv.h-failure.patch
rename to package/libnss/0003-Bug-1602743-Fix-PowerPc-build-sys-auxv.h-failure.patch
diff --git a/package/libnss/0005-Bug-1603398-Fix-nsinstall.c-build-failure-on-RHEL-7.patch b/package/libnss/0004-Bug-1603398-Fix-nsinstall.c-build-failure-on-RHEL-7.patch
similarity index 100%
rename from package/libnss/0005-Bug-1603398-Fix-nsinstall.c-build-failure-on-RHEL-7.patch
rename to package/libnss/0004-Bug-1603398-Fix-nsinstall.c-build-failure-on-RHEL-7.patch
