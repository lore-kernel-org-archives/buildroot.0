From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 May 2020 23:31:38 +0200
Subject: [Buildroot] [git commit] package/{fmc,
 fmlib}: change repository location
Message-ID: <20200529211443.B3C2C91DF7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3bfe849189881d4872b5949739f91b1ed01b6622
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that Freescale has been wholly swallowed into NXP, the public-facing
git repositories that were hosting those two packages are no longer
available.

Fortunately, they had been mirrored on Code Aurora forge (a Linux
Foundation project, so relatively stable and trustworthy), which has the
tags we need, and that generates the exact same archives.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
Reviewed-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fmc/fmc.mk     | 3 ++-
 package/fmlib/fmlib.mk | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/fmc/fmc.mk b/package/fmc/fmc.mk
index 2a95fec0b7..b385730138 100644
--- a/package/fmc/fmc.mk
+++ b/package/fmc/fmc.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 FMC_VERSION = fsl-sdk-v2.0
-FMC_SITE = git://git.freescale.com/ppc/sdk/fmc.git
+FMC_SITE = https://source.codeaurora.org/external/qoriq/qoriq-yocto-sdk/fmc
+FMC_SITE_METHOD = git
 FMC_LICENSE = MIT
 FMC_LICENSE_FILES = COPYING
 FMC_DEPENDENCIES = libxml2 tclap fmlib
diff --git a/package/fmlib/fmlib.mk b/package/fmlib/fmlib.mk
index e67ab1e5de..8cb779201d 100644
--- a/package/fmlib/fmlib.mk
+++ b/package/fmlib/fmlib.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 FMLIB_VERSION = fsl-sdk-v2.0
-FMLIB_SITE = git://git.freescale.com/ppc/sdk/fmlib.git
+FMLIB_SITE = https://source.codeaurora.org/external/qoriq/qoriq-yocto-sdk/fmlib
+FMLIB_SITE_METHOD = git
 FMLIB_LICENSE = BSD-3-Clause, GPL-2.0+
 FMLIB_LICENSE_FILES = COPYING
 FMLIB_DEPENDENCIES = linux
