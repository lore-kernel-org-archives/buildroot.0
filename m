From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 21:00:49 +0200
Subject: [Buildroot] [git commit] package/stress-ng: bump to version 0.09.39
Message-ID: <20180912190111.27982812D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=27bce5fc8e4c40e5d9acac4187c842fe6c9f5a01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- package/stress-ng: bump to version 0.09.39

- remove patch, which was merged upstream in commit
  http://kernel.ubuntu.com/git/cking/stress-ng.git/commit/stress-netlink-proc.c?id=cbfc5a9d648ae639e3aebf2354eac5b3c015c0fb

Signed-off-by: Florian La Roche <F.LaRoche@pilz.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...s-netlink-proc-fix-build-with-kernel-v3.9.patch | 38 ----------------------
 package/stress-ng/stress-ng.hash                   |  2 +-
 package/stress-ng/stress-ng.mk                     |  2 +-
 3 files changed, 2 insertions(+), 40 deletions(-)

diff --git a/package/stress-ng/0001-stress-netlink-proc-fix-build-with-kernel-v3.9.patch b/package/stress-ng/0001-stress-netlink-proc-fix-build-with-kernel-v3.9.patch
index 6cbba5e729..e69de29bb2 100644
--- a/package/stress-ng/0001-stress-netlink-proc-fix-build-with-kernel-v3.9.patch
+++ b/package/stress-ng/0001-stress-netlink-proc-fix-build-with-kernel-v3.9.patch
@@ -1,38 +0,0 @@
-From f3aa381322a4b73b9ca4e7940f802d74324ef24b Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Mon, 2 Jul 2018 21:06:43 +0300
-Subject: [PATCH] stress-netlink-proc: fix build with kernel v3.9
-
-The PROC_EVENT_COREDUMP has been introduced in kernel version 3.10.
-Don't use it with 3.9 headers.
-
-Fixes build failure:
-
-stress-netlink-proc.c: In function 'monitor':
-stress-netlink-proc.c:108:8: error: 'PROC_EVENT_COREDUMP' undeclared (first use in this function)
-   case PROC_EVENT_COREDUMP:
-        ^
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://github.com/ColinIanKing/stress-ng/pull/24
-
- stress-netlink-proc.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/stress-netlink-proc.c b/stress-netlink-proc.c
-index 5845610dc816..6114a0b92af1 100644
---- a/stress-netlink-proc.c
-+++ b/stress-netlink-proc.c
-@@ -104,7 +104,7 @@ static int monitor(const args_t *args, const int sock)
- #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,31)
- 		case PROC_EVENT_SID:
- #endif
--#if LINUX_VERSION_CODE >= KERNEL_VERSION(3,9,0)
-+#if LINUX_VERSION_CODE >= KERNEL_VERSION(3,10,0)
- 		case PROC_EVENT_COREDUMP:
- #endif
- #if LINUX_VERSION_CODE >= KERNEL_VERSION(3,1,0)
--- 
-2.18.0
-
diff --git a/package/stress-ng/stress-ng.hash b/package/stress-ng/stress-ng.hash
index 7455288c17..f62c15b8e3 100644
--- a/package/stress-ng/stress-ng.hash
+++ b/package/stress-ng/stress-ng.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  0de97212a83b2f8a34ee31ef32a7bc69066ed49ebdc59b51aa4060cb95e29321  stress-ng-0.09.32.tar.xz
+sha256 485f6e7384614fd96955bea4d1f79cd75f8be7e8da30cb3a7e8724ff7b75cd9c stress-ng-0.09.39.tar.xz
diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
index d83240817a..26e100f454 100644
--- a/package/stress-ng/stress-ng.mk
+++ b/package/stress-ng/stress-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRESS_NG_VERSION = 0.09.32
+STRESS_NG_VERSION = 0.09.39
 STRESS_NG_SOURCE = stress-ng-$(STRESS_NG_VERSION).tar.xz
 STRESS_NG_SITE = http://kernel.ubuntu.com/~cking/tarballs/stress-ng
 STRESS_NG_LICENSE = GPL-2.0+
