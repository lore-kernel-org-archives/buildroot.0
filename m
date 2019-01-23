From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Jan 2019 11:50:40 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/acpica: add
 missing dependencies for host variant
Message-ID: <20190123105054.DB42F8E3D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fa069b85b348265b63a3925e198af2db50ce42f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Just like the target acpica package needs host-flex and host-bison,
the host variant also needs the same dependencies. This allows to fix
the build of "make host-acpica", which was detected thanks to
per-package directory support.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 86814306288d2f46b042123a7883737d0c388db4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
