From: Romain Naour <romain.naour@gmail.com>
Date: Tue,  9 Jan 2018 21:13:06 +0100
Subject: [Buildroot] [PATCH v2] package/ti-cgt-pru: bump to 2.2.1
Message-ID: <20180109201306.13526-1-romain.naour@gmail.com>
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

While at it, add license hash.

Fixes:
http://autobuild.buildroot.net/results/68f/68f60ad38d9b6eae83b5d233966616a25d8c9391

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Ash Charles <ash.charles@savoirfairelinux.com>
Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
---
Note: This bump is not tested on real PRU hardware.

v2: update license files and add license hash
---
 package/ti-cgt-pru/ti-cgt-pru.hash | 4 +++-
 package/ti-cgt-pru/ti-cgt-pru.mk   | 6 +++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/ti-cgt-pru/ti-cgt-pru.hash b/package/ti-cgt-pru/ti-cgt-pru.hash
index 3ff08ace32..1975d8d1e6 100644
--- a/package/ti-cgt-pru/ti-cgt-pru.hash
+++ b/package/ti-cgt-pru/ti-cgt-pru.hash
@@ -1,2 +1,4 @@
 # Locally calculated
-sha256	c80dbf35e7401f4c122ff25cc2f6b5db496607782fb4583cee8663a2763f4472	ti_cgt_pru_2.1.4_linux_installer_x86.bin
+sha256	7dc37fd689d1d506bf410d2a00af658b93a58d4bc10ac32c2210129dab617377	ti_cgt_pru_2.2.1_linux_installer_x86.bin
+sha256	eb646f4f8b14351110992b40ba24d12803bcc150a76e7298705f51088b0a09cc	PRU_Code_Generation_Tools_2.2.x_manifest.html
+sha256	6b98f9262abd1ae9a3731e6feee02a56b6e290542dea119eeeeaf88bf802aabc	pru_rts_2_2_0_82167478-F8C9-49b2-82BD-12F8550770F9.spdx
diff --git a/package/ti-cgt-pru/ti-cgt-pru.mk b/package/ti-cgt-pru/ti-cgt-pru.mk
index f923e835dc..0b9a64b3c9 100644
--- a/package/ti-cgt-pru/ti-cgt-pru.mk
+++ b/package/ti-cgt-pru/ti-cgt-pru.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-TI_CGT_PRU_VERSION = 2.1.4
+TI_CGT_PRU_VERSION = 2.2.1
 TI_CGT_PRU_SOURCE = ti_cgt_pru_$(TI_CGT_PRU_VERSION)_linux_installer_x86.bin
 TI_CGT_PRU_SITE = http://downloads.ti.com/codegen/esd/cgt_public_sw/PRU/$(TI_CGT_PRU_VERSION)
 TI_CGT_PRU_LICENSE = TI Technology and Software Publicly Available License (compiler + PRU library), \
 	BSL-1.0 (compiler), BSD-2-Clause, BSD-3-Clause, MIT, AFL-3.0, Hewlett-Packard (PRU library)
-TI_CGT_PRU_LICENSE_FILES = PRU_Code_Generation_Tools_2.1.x_manifest.html \
-	PRU_CodeGen_Library_2.1_0222433C-30C1-442d-B5C6-2073BD97F80F.spdx.tag
+TI_CGT_PRU_LICENSE_FILES = PRU_Code_Generation_Tools_2.2.x_manifest.html \
+	pru_rts_2_2_0_82167478-F8C9-49b2-82BD-12F8550770F9.spdx
 
 define HOST_TI_CGT_PRU_EXTRACT_CMDS
 	chmod +x $(DL_DIR)/$(TI_CGT_PRU_SOURCE)
-- 
2.14.3
