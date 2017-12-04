From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Dec 2017 11:25:41 +0100
Subject: [Buildroot] [git commit] kexec: bump to 2.0.16
Message-ID: <20171204102104.C10F7803D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5764dc89385a7ab08ccef214c45dc73bb9b93836
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In 2.0.16 we now have uncompressed kernel size available
for ARM starting v4.14 and later kernels.

Let's also remove the extra space after the checksum while at it.

Signed-off-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kexec/kexec.hash | 2 +-
 package/kexec/kexec.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kexec/kexec.hash b/package/kexec/kexec.hash
index 0e39e7c..eaa9d7b 100644
--- a/package/kexec/kexec.hash
+++ b/package/kexec/kexec.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kexec/sha256sums.asc
-sha256 899b7b861431eb51886d0c12866e91b036228244d35a5fb04762dd1a3c0194e7  kexec-tools-2.0.15.tar.xz
+sha256 5b103351ad752c9badd1d65b00eb6de4bce579f944f4df4e3ef3a755ba567010 kexec-tools-2.0.16.tar.xz
diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index 79c4b73..3ce1ed2 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KEXEC_VERSION = 2.0.15
+KEXEC_VERSION = 2.0.16
 KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.xz
 KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
 KEXEC_LICENSE = GPL-2.0
