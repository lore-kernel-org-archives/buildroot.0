From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 19 Apr 2017 21:59:59 +0200
Subject: [Buildroot] [PATCH 1/9] xenomai: update LICENSE_FILES
In-Reply-To: <20170419200007.12590-1-patrickdepinguin@gmail.com>
References: <20170419200007.12590-1-patrickdepinguin@gmail.com>
Message-ID: <20170419200007.12590-2-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Xenomai sources contain much more license files than we currently list, so
complete the current list.

Based on:
    find | grep -Ei 'copying|license|copyright' | sort

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/xenomai/xenomai.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 7c0ad34..456f200 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -15,7 +15,12 @@ XENOMAI_SITE = https://xenomai.org/downloads/xenomai/stable
 XENOMAI_SOURCE = xenomai-$(XENOMAI_VERSION).tar.bz2
 XENOMAI_LICENSE = GPL-2.0+ with exception (headers), LGPL-2.1+ (libraries), GPL-2.0+ (kernel), GFDL-1.2+ (docs), GPL-2.0 (ipipe patch, can driver)
 # GFDL is not included but refers to gnu.org
-XENOMAI_LICENSE_FILES = debian/copyright include/COPYING lib/trank/COPYING kernel/cobalt/COPYING
+XENOMAI_LICENSE_FILES = debian/copyright include/COPYING kernel/cobalt/COPYING \
+	kernel/cobalt/posix/COPYING kernel/cobalt/rtdm/COPYING \
+	lib/alchemy/COPYING lib/analogy/COPYING \
+	lib/boilerplate/iniparser/LICENSE lib/boilerplate/COPYING \
+	lib/cobalt/COPYING lib/copperplate/COPYING lib/psos/COPYING \
+	lib/smokey/COPYING lib/trank/COPYING lib/vxworks/COPYING
 
 XENOMAI_DEPENDENCIES = host-pkgconf
 
-- 
2.10.2
