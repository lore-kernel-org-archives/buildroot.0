From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 18 Sep 2014 21:44:48 +0200
Subject: [Buildroot] [git commit] e2fsprogs: switch site and add hash
Message-ID: <20140918195021.328489D6E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2d0d3aae765bda1403e5eed5b1375746b27d283d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For some reason the kernel.org download hash doesn't match the
sourceforge hash so switch to kernel.org for the download.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/e2fsprogs/e2fsprogs.hash |    2 ++
 package/e2fsprogs/e2fsprogs.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.hash b/package/e2fsprogs/e2fsprogs.hash
new file mode 100644
index 0000000..89c3fd8
--- /dev/null
+++ b/package/e2fsprogs/e2fsprogs.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.42.12/sha256sums.asc
+sha256	8c790e8708dbb7c766c88c8152c2bf2d0628937e9dd6571eef8f59080d0fb58a	e2fsprogs-1.42.12.tar.gz
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 810802d..b115582 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 E2FSPROGS_VERSION = 1.42.12
-E2FSPROGS_SITE = http://downloads.sourceforge.net/project/e2fsprogs/e2fsprogs/v$(E2FSPROGS_VERSION)
+E2FSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/tytso/e2fsprogs/v$(E2FSPROGS_VERSION)
 E2FSPROGS_LICENSE = GPLv2, libuuid BSD-3c, libss and libet MIT-like with advertising clause
 E2FSPROGS_LICENSE_FILES = COPYING lib/uuid/COPYING lib/ss/mit-sipb-copyright.h lib/et/internal.h
 E2FSPROGS_INSTALL_STAGING = YES
