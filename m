From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Apr 2021 22:03:38 +0200
Subject: [Buildroot] [git commit branch/2020.11.x] package/openmpi: drop
 unrecognized option
Message-ID: <20210404194031.275F08CA49@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de2152eea41b9eb03eefd40f8e90f3a85df75714
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

--disable-vt has been dropped since version 2.0.0 and
https://github.com/open-mpi/ompi/commit/94190bf04b0877e878223a04c236443774e57ef2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 210ec9c0d8a32b6ad399898de978348de7c252c4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openmpi/openmpi.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/openmpi/openmpi.mk b/package/openmpi/openmpi.mk
index b682e6e74e..8bdc3fa188 100644
--- a/package/openmpi/openmpi.mk
+++ b/package/openmpi/openmpi.mk
@@ -11,7 +11,6 @@ OPENMPI_SOURCE = openmpi-$(OPENMPI_VERSION).tar.bz2
 OPENMPI_LICENSE = BSD-3-Clause
 OPENMPI_LICENSE_FILES = LICENSE
 OPENMPI_INSTALL_STAGING = YES
-OPENMPI_CONF_OPTS = --disable-vt
 
 # Enabling Fortran support requires pre-seeding the configure script
 # with various values that cannot be guessed, so we provide cache
