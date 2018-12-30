From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 17:00:22 +0100
Subject: [Buildroot] [git commit] package/acpica: add missing dependencies
 for host variant
Message-ID: <20181230155541.C39DA817C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=86814306288d2f46b042123a7883737d0c388db4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Just like the target acpica package needs host-flex and host-bison,
the host variant also needs the same dependencies. This allows to fix
the build of "make host-acpica", which was detected thanks to
per-package directory support.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/acpica/acpica.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/acpica/acpica.mk b/package/acpica/acpica.mk
index 57cc37f85e..c540061928 100644
--- a/package/acpica/acpica.mk
+++ b/package/acpica/acpica.mk
@@ -10,6 +10,7 @@ ACPICA_SITE = https://acpica.org/sites/acpica/files
 ACPICA_LICENSE = BSD-3-Clause or GPL-2.0
 ACPICA_LICENSE_FILES = source/include/acpi.h
 ACPICA_DEPENDENCIES = host-bison host-flex
+HOST_ACPICA_DEPENDENCIES = host-bison host-flex
 
 define ACPICA_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
