From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Wed, 19 Oct 2016 23:11:55 +0530
Subject: [Buildroot] [PATCH 2/3] dtc: update legal info
In-Reply-To: <1476898916-7434-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1476898916-7434-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <1476898916-7434-2-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

library libdtc is dual licensed under BSD-2c or GPLv2+ and dtc programs
are licensed under GPLv2+.

This patch annotates licenses with components and uses correct format to
specify dual licensing that is separating licenses with 'or' keyword
instead of '/'.

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
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
-- 
2.6.2
