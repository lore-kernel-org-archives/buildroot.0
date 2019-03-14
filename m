From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Mar 2019 21:30:09 +0100
Subject: [Buildroot] [git commit] package/kexec: update to 2.0.18
Message-ID: <20190314202842.060E9821ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=254384e7699d5c7a84b2b029099107046e3a6a5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This release fixes the following issue with new kernels:

kexec --load bzImage --reuse-cmdline
Unhandled rela relocation: R_X86_64_PLT32

Signed-off-by: Adrien Gallou??t <adrien@gallouet.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kexec/kexec.hash | 2 +-
 package/kexec/kexec.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kexec/kexec.hash b/package/kexec/kexec.hash
index 24294909ee..f87692b689 100644
--- a/package/kexec/kexec.hash
+++ b/package/kexec/kexec.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kexec/sha256sums.asc
-sha256 504c816b769da573167b63f3b6d4fce3740f231c98d8db0c4fda47a4b90482a9 kexec-tools-2.0.17.tar.xz
+sha256 f020f07341977eb512663e301c2de60c6589e141467c16a8efd58243c0b2b238 kexec-tools-2.0.18.tar.xz
 # locally calculated
 sha256 fa5fc1d1eec39532ea517518eeefd7b6e3c14341a55e5880a0e2a49eee47a5b7 COPYING
diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index b0f4367ddd..b011c0b4e5 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KEXEC_VERSION = 2.0.17
+KEXEC_VERSION = 2.0.18
 KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.xz
 KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
 KEXEC_LICENSE = GPL-2.0
