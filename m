From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Dec 2015 00:02:28 +0100
Subject: [Buildroot] [git commit] package/efl: libefl and libelementary
	share the same version number
Message-ID: <20151217230816.64EE2803E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bb8020069508cb0e85d2e32d95c210058b89d49d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/efl.mk                         | 2 ++
 package/efl/libefl/libefl.mk               | 3 +--
 package/efl/libelementary/libelementary.mk | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 99e4d14..151ac28 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -1,2 +1,4 @@
 
+EFL_VERSION = 1.15.2
+
 include $(sort $(wildcard package/efl/*/*.mk))
diff --git a/package/efl/libefl/libefl.mk b/package/efl/libefl/libefl.mk
index 0472827..b989d54 100644
--- a/package/efl/libefl/libefl.mk
+++ b/package/efl/libefl/libefl.mk
@@ -4,8 +4,7 @@
 #
 ################################################################################
 
-# hardcode the version here since the bump to 1.15 is not complete in Buildroot
-LIBEFL_VERSION = 1.15.2
+LIBEFL_VERSION = $(EFL_VERSION)
 LIBEFL_SOURCE = efl-$(LIBEFL_VERSION).tar.xz
 LIBEFL_SITE = http://download.enlightenment.org/rel/libs/efl
 LIBEFL_LICENSE = BSD-2c, LGPLv2.1+, GPLv2+
diff --git a/package/efl/libelementary/libelementary.mk b/package/efl/libelementary/libelementary.mk
index 4ba8681..c920801 100644
--- a/package/efl/libelementary/libelementary.mk
+++ b/package/efl/libelementary/libelementary.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBELEMENTARY_VERSION = 1.15.2
+LIBELEMENTARY_VERSION = $(EFL_VERSION)
 LIBELEMENTARY_SOURCE = elementary-$(LIBELEMENTARY_VERSION).tar.xz
 LIBELEMENTARY_SITE = http://download.enlightenment.org/rel/libs/elementary
 LIBELEMENTARY_LICENSE = LGPLv2.1
