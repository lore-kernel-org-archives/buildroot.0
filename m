From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:27:25 +0200
Subject: [Buildroot] [git commit] gdbm: use the new gettext logic
Message-ID: <20170704233514.F1E6D802C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a24b583e633e005e793032d78d6c2996a4552989
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
