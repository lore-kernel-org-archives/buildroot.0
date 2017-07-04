From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:48:10 +0200
Subject: [Buildroot] [PATCH 030/100] gdbm: use the new gettext logic
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-31-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit switches to use the new gettext logic, which involves
using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies on
gettext/host-gettext.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdbm/gdbm.mk | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/gdbm/gdbm.mk b/package/gdbm/gdbm.mk
index 4e3ed76..acd8cd2 100644
--- a/package/gdbm/gdbm.mk
+++ b/package/gdbm/gdbm.mk
@@ -9,10 +9,7 @@ GDBM_SITE = $(BR2_GNU_MIRROR)/gdbm
 GDBM_LICENSE = GPL-3.0+
 GDBM_LICENSE_FILES = COPYING
 GDBM_INSTALL_STAGING = YES
-
-ifeq ($(BR2_PACKAGE_GETTEXT),y)
-GDBM_DEPENDENCIES += gettext
-endif
+GDBM_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
 GDBM_CONF_OPTS += --with-readline
-- 
2.9.4
