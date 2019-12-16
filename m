From: Alexey Lukyanchuk <skif@skif-web.ru>
Date: Mon, 16 Dec 2019 12:38:03 +0300
Subject: [Buildroot] [PATCH 1/1] package/openipmi: install to staging dir
Message-ID: <20191216093803.4957-1-skif@skif-web.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed for packages which depend from openipmi

Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru>
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
-- 
2.23.0
