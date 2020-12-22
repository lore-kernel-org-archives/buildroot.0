From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Tue, 22 Dec 2020 16:07:36 +0100
Subject: [Buildroot] [PATCH 15/15] package/jitterentropy-library: add
 SELinux module
In-Reply-To: <20201222150736.319593-1-maxime.chevallier@bootlin.com>
References: <20201222150736.319593-1-maxime.chevallier@bootlin.com>
Message-ID: <20201222150736.319593-16-maxime.chevallier@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support for the jitterentropy lib is added by the services/entropyd
module in the SELinux refpolicy.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 package/jitterentropy-library/jitterentropy-library.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/jitterentropy-library/jitterentropy-library.mk b/package/jitterentropy-library/jitterentropy-library.mk
index 3db04b27d3..d9dc031c35 100644
--- a/package/jitterentropy-library/jitterentropy-library.mk
+++ b/package/jitterentropy-library/jitterentropy-library.mk
@@ -10,6 +10,7 @@ JITTERENTROPY_LIBRARY_LICENSE = GPL-2.0 or BSD-3-Clause
 JITTERENTROPY_LIBRARY_LICENSE_FILES = COPYING COPYING.bsd COPYING.gplv2
 JITTERENTROPY_LIBRARY_INSTALL_STAGING = YES
 JITTERENTROPY_LIBRARY_INSTALL_TARGETS = install-includes
+JITTERENTROPY_LIBRARY_SELINUX_MODULES = entropyd
 
 ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
 JITTERENTROPY_LIBRARY_BUILD_TARGETS += jitterentropy-static
-- 
2.25.4
