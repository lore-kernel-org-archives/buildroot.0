From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 24 Mar 2021 08:04:13 +0100
Subject: [Buildroot] [PATCH 1/1] package/openmpi: drop unrecognized option
Message-ID: <20210324070413.733545-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--disable-vt has been dropped since version 2.0.0 and
https://github.com/open-mpi/ompi/commit/94190bf04b0877e878223a04c236443774e57ef2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.30.1
