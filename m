From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 13 Feb 2018 15:46:47 +0200
Subject: [Buildroot] [PATCH next] iproute2: bump to version 4.15.0
Message-ID: <492e49143bb778c17119b57ed55468c20dc6625d.1518529607.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Keep the musl workaround patch for now, even though libc-compat.h has
been updated from kernel v4.15. To take advantage of the new
libc-compat.h we need a newer or patched version of musl. The workaround
patch will be removed once musl is updated, and external autobuilders
toolchains are rebuilt.

Cc: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/iproute2/iproute2.hash | 2 +-
 package/iproute2/iproute2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index e9b8a0ef26fc..630447cc7184 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256	d43ac068afcc350a448f4581b6e292331ef7e4e7aa746e34981582d5fdb10067	iproute2-4.14.1.tar.xz
+sha256	48d4616a99d7b609b7b795c0ae8ec57099fb0271ed89253e8772c02327798355	iproute2-4.15.0.tar.xz
 sha256	e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4	COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 15bb132c5001..11db7d2c6e4e 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 4.14.1
+IPROUTE2_VERSION = 4.15.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
-- 
2.15.1
