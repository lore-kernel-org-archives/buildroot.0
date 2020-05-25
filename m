From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 25 May 2020 23:48:54 +0200
Subject: [Buildroot] [PATCH] package/fmc+fmlib: directly use s.b.o to fetch
 the archive
Message-ID: <20200525214854.14591-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that Freescale has been wholly swallowed into NXP, the public-facing
git repositories that were hosting those two packages are no longer
available, which leaves our archives on s.b.o the only known locations
where we can grab the sources, so switch to using it.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Matthew Weber <matthew.weber@rockwellcollins.com>

---
Matt: I happen to actually have the git trees in the state they were on
2020-02-03T13:07+0200 if you would happen to know what to do with those.
Just tell me, I can ship them to you (960K+736K resp.)
---
 package/fmc/fmc.mk     | 8 +++++++-
 package/fmlib/fmlib.mk | 8 +++++++-
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/package/fmc/fmc.mk b/package/fmc/fmc.mk
index 2a95fec0b7..35c5d2434a 100644
--- a/package/fmc/fmc.mk
+++ b/package/fmc/fmc.mk
@@ -5,7 +5,13 @@
 ################################################################################
 
 FMC_VERSION = fsl-sdk-v2.0
-FMC_SITE = git://git.freescale.com/ppc/sdk/fmc.git
+#FMC_SITE = git://git.freescale.com/ppc/sdk/fmc.git
+
+# Upstream git repository is no longer accessible now that Freescale has been
+# wholy absorbed into NXP. The only known location with the sources that we
+# know of is our backup mirror, s.b.o, so directly use that.
+FMC_SITE = http://sources.buildroot.org/fmc
+
 FMC_LICENSE = MIT
 FMC_LICENSE_FILES = COPYING
 FMC_DEPENDENCIES = libxml2 tclap fmlib
diff --git a/package/fmlib/fmlib.mk b/package/fmlib/fmlib.mk
index e67ab1e5de..0f6321393c 100644
--- a/package/fmlib/fmlib.mk
+++ b/package/fmlib/fmlib.mk
@@ -5,7 +5,13 @@
 ################################################################################
 
 FMLIB_VERSION = fsl-sdk-v2.0
-FMLIB_SITE = git://git.freescale.com/ppc/sdk/fmlib.git
+#FMLIB_SITE = git://git.freescale.com/ppc/sdk/fmlib.git
+
+# Upstream git repository is no longer accessible now that Freescale has been
+# wholy absorbed into NXP. The only known location with the sources that we
+# know of is our backup mirror, s.b.o, so directly use that.
+FMLIB_SITE = http://sources.buildroot.org/fmlib
+
 FMLIB_LICENSE = BSD-3-Clause, GPL-2.0+
 FMLIB_LICENSE_FILES = COPYING
 FMLIB_DEPENDENCIES = linux
-- 
2.20.1
