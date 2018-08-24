From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 Aug 2018 23:51:46 +0200
Subject: [Buildroot] [git commit branch/next] iproute2: bump to version
 4.18.0
Message-ID: <20180824214435.45C9D8E72A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=447d82f9f5d2f4b7993ca45f8402969b75ce7577
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Drop upstream patch.

Cc: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...0001-rdma-sync-some-IP-headers-with-glibc.patch | 39 ----------------------
 package/iproute2/iproute2.hash                     |  2 +-
 package/iproute2/iproute2.mk                       |  2 +-
 3 files changed, 2 insertions(+), 41 deletions(-)

diff --git a/package/iproute2/0001-rdma-sync-some-IP-headers-with-glibc.patch b/package/iproute2/0001-rdma-sync-some-IP-headers-with-glibc.patch
deleted file mode 100644
index f78a5d6b43..0000000000
--- a/package/iproute2/0001-rdma-sync-some-IP-headers-with-glibc.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 5887ff0922a06d978d3271df9f01fcb04fadc75f Mon Sep 17 00:00:00 2001
-From: Hoang Le <hoang.h.le@dektech.com.au>
-Date: Wed, 13 Jun 2018 11:09:56 +0700
-Subject: rdma: sync some IP headers with glibc
-
-In the commit 9a362cc71a45, new userspace header:
-  (i.e rdma/rdma_user_cm.h -> linux/in6.h)
-is included before the kernel space header:
-  (i.e utils.h -> resolv.h -> netinet/in.h).
-
-This leads to unsynchronous some IP headers and compiler got failure
-with error: redefinition of some structs IP.
-
-In this commit, just reorder this including to make them in-sync.
-
-Signed-off-by: Hoang Le <hoang.h.le@dektech.com.au>
-Acked-by: Leon Romanovsky <leonro@mellanox.com>
-Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from: https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=5887ff0922a06d978d3271df9f01fcb04fadc75f]
----
- rdma/rdma.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/rdma/rdma.h b/rdma/rdma.h
-index fcaf9e6..d4b7ba1 100644
---- a/rdma/rdma.h
-+++ b/rdma/rdma.h
-@@ -15,6 +15,7 @@
- #include <string.h>
- #include <errno.h>
- #include <getopt.h>
-+#include <netinet/in.h>
- #include <libmnl/libmnl.h>
- #include <rdma/rdma_netlink.h>
- #include <rdma/rdma_user_cm.h>
--- 
-cgit v1.1
-
diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index 48867f0a99..672ea66d88 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256	6fa991b092315887775b9e47dc6a89af7ae09dd3ad4ccff754d055c566b4be6e	iproute2-4.17.0.tar.xz
+sha256	a9e6c70c95f513871c5e1f4e452c04fcb3c4d8a05be651bd794cd994a52daa45  iproute2-4.18.0.tar.xz
 sha256	e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4	COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 48413401cd..b2bb33b8dc 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 4.17.0
+IPROUTE2_VERSION = 4.18.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
