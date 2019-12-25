From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Dec 2019 22:38:10 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/openipmi: install
 to staging dir
Message-ID: <20191225214909.77E218E522@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5969c88945e8189b7bcb082c8b4ef4fbc8c94ba0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Needed for packages which depend on openipmi.

Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3c5912b2ec727bb0337cdbc63d59a3a0f4e3bdf3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openipmi/openipmi.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openipmi/openipmi.mk b/package/openipmi/openipmi.mk
index 9590b446ef..ca8fa77342 100644
--- a/package/openipmi/openipmi.mk
+++ b/package/openipmi/openipmi.mk
@@ -10,6 +10,7 @@ OPENIPMI_SOURCE = OpenIPMI-$(OPENIPMI_VERSION).tar.gz
 OPENIPMI_LICENSE = LGPL-2.0+, GPL-2.0+, BSD-3-Clause
 OPENIPMI_LICENSE_FILES = COPYING.LIB COPYING COPYING.BSD
 OPENIPMI_DEPENDENCIES = popt ncurses readline host-pkgconf
+OPENIPMI_INSTALL_STAGING = YES
 # Patching Makefile.am
 OPENIPMI_AUTORECONF = YES
 OPENIPMI_CONF_ENV = ac_cv_path_pkgprog="$(PKG_CONFIG_HOST_BINARY)"
