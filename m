From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Mar 2019 23:10:56 +0100
Subject: [Buildroot] [git commit] package/log4cplus: add optional qt5
 dependency
Message-ID: <20190307220847.CF1258EA35@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d04b12d19e834c0e7aba52e78c46ff820b93ad69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Thomas: test BR2_PACKAGE_QT5BASE instead of BR2_PACKAGE_QT5, just for
consistency with the package we add to the DEPENDENCIES variable.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/log4cplus/log4cplus.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/log4cplus/log4cplus.mk b/package/log4cplus/log4cplus.mk
index 0bc4fc9aa6..82fc7135f4 100644
--- a/package/log4cplus/log4cplus.mk
+++ b/package/log4cplus/log4cplus.mk
@@ -11,6 +11,13 @@ LOG4CPLUS_LICENSE = Apache-2.0, BSD-2-Clause, BSD-like (threadpool)
 LOG4CPLUS_LICENSE_FILES = LICENSE
 LOG4CPLUS_INSTALL_STAGING = YES
 
+ifeq ($(BR2_PACKAGE_QT5BASE),y)
+LOG4CPLUS_DEPENDENCIES += host-pkgconf qt5base
+LOG4CPLUS_CONF_OPTS += --with-qt5
+else
+LOG4CPLUS_CONF_OPTS += --without-qt5
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 LOG4CPLUS_CONF_ENV += LIBS='-latomic'
 endif
