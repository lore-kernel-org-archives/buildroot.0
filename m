From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Oct 2016 23:28:19 +0200
Subject: [Buildroot] [git commit] dtc: update legal info
Message-ID: <20161019212834.E0C7F7FF2C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af2658da2092be3417260bf67f5ac15575181e21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

library libdtc is dual licensed under BSD-2c or GPLv2+ and dtc programs
are licensed under GPLv2+.

This patch annotates licenses with components and uses correct format to
specify dual licensing that is separating licenses with 'or' keyword
instead of '/'.

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dtc/dtc.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index 8fdcdbe..9dbca0a 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -7,7 +7,7 @@
 DTC_VERSION = 1.4.1
 DTC_SOURCE = dtc-$(DTC_VERSION).tar.xz
 DTC_SITE = https://www.kernel.org/pub/software/utils/dtc
-DTC_LICENSE = GPLv2+/BSD-2c
+DTC_LICENSE = GPLv2+ or BSD-2c (library)
 DTC_LICENSE_FILES = README.license GPL
 DTC_INSTALL_STAGING = YES
 DTC_DEPENDENCIES = host-bison host-flex
@@ -19,7 +19,7 @@ endef
 
 ifeq ($(BR2_PACKAGE_DTC_PROGRAMS),y)
 
-DTC_LICENSE += (for the library), GPLv2+ (for the executables)
+DTC_LICENSE := $(DTC_LICENSE), GPLv2+ (programs)
 DTC_INSTALL_GOAL = install
 ifeq ($(BR2_PACKAGE_BASH),)
 DTC_POST_INSTALL_TARGET_HOOKS += DTC_POST_INSTALL_TARGET_RM_DTDIFF
