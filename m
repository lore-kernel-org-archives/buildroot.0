From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Mar 2019 17:17:48 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/log4cplus: add
 optional qt5 dependency
Message-ID: <20190325161544.003987FD88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=884e3918bfeac54fc1d4e962780d3402d58323e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Thomas: test BR2_PACKAGE_QT5BASE instead of BR2_PACKAGE_QT5, just for
consistency with the package we add to the DEPENDENCIES variable.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

(cherry picked from commit d04b12d19e834c0e7aba52e78c46ff820b93ad69)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
