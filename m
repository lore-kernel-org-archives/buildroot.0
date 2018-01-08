From: Romain Naour <romain.naour@gmail.com>
Date: Tue,  9 Jan 2018 00:10:19 +0100
Subject: [Buildroot] [PATCH] package/ti-cgt-pru: bump to 2.2.1
Message-ID: <20180108231019.24969-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See: http://www.ti.com/tool/download/PRU-CGT-2-2

The ti-cgt-pru v2.1.x installer are affected by a bug with recent
distribution (Fedora 27 and Ubuntu 17.10) using kernel 4.13 or 4.14
with a glibc 2.26.
The installer is stuck in a futex(wait) system call.

Fixes:
http://autobuild.buildroot.net/results/68f/68f60ad38d9b6eae83b5d233966616a25d8c9391

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Ash Charles <ash.charles@savoirfairelinux.com>
Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
---
Note: This bump is not tested on real PRU hardware.
---
 package/ti-cgt-pru/ti-cgt-pru.hash | 2 +-
 package/ti-cgt-pru/ti-cgt-pru.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ti-cgt-pru/ti-cgt-pru.hash b/package/ti-cgt-pru/ti-cgt-pru.hash
index 3ff08ace32..3944f35609 100644
--- a/package/ti-cgt-pru/ti-cgt-pru.hash
+++ b/package/ti-cgt-pru/ti-cgt-pru.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	c80dbf35e7401f4c122ff25cc2f6b5db496607782fb4583cee8663a2763f4472	ti_cgt_pru_2.1.4_linux_installer_x86.bin
+sha256	7dc37fd689d1d506bf410d2a00af658b93a58d4bc10ac32c2210129dab617377	ti_cgt_pru_2.2.1_linux_installer_x86.bin
diff --git a/package/ti-cgt-pru/ti-cgt-pru.mk b/package/ti-cgt-pru/ti-cgt-pru.mk
index f923e835dc..4f70d4b023 100644
--- a/package/ti-cgt-pru/ti-cgt-pru.mk
+++ b/package/ti-cgt-pru/ti-cgt-pru.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TI_CGT_PRU_VERSION = 2.1.4
+TI_CGT_PRU_VERSION = 2.2.1
 TI_CGT_PRU_SOURCE = ti_cgt_pru_$(TI_CGT_PRU_VERSION)_linux_installer_x86.bin
 TI_CGT_PRU_SITE = http://downloads.ti.com/codegen/esd/cgt_public_sw/PRU/$(TI_CGT_PRU_VERSION)
 TI_CGT_PRU_LICENSE = TI Technology and Software Publicly Available License (compiler + PRU library), \
-- 
2.14.3
